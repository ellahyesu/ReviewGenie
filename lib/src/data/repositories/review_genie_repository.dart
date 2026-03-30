import 'package:shared_preferences/shared_preferences.dart';

import '../../core/config/app_environment.dart';
import '../../core/error/app_exception.dart';
import '../../core/utils/review_prompt_builder.dart';
import '../../core/utils/template_review_composer.dart';
import '../../features/generator/domain/generated_review.dart';
import '../../features/generator/domain/review_request.dart';
import '../../features/search/domain/product.dart';
import '../../features/search/domain/search_source.dart';
import '../clients/coupang_search_client.dart';
import '../clients/naver_shop_client.dart';
import '../clients/open_ai_client.dart';

abstract class ReviewGenieRepository {
  Future<List<String>> loadRecentQueries();

  Future<List<Product>> searchProducts(
    String query,
    SearchSource source,
  );

  Future<GeneratedReview> generateReview(ReviewRequest request);
}

class ReviewGenieRepositoryImpl implements ReviewGenieRepository {
  ReviewGenieRepositoryImpl({
    required AppEnvironment environment,
    required SharedPreferences sharedPreferences,
    required NaverShopClient naverShopClient,
    required CoupangSearchClient coupangSearchClient,
    required OpenAiClient openAiClient,
    required ReviewPromptBuilder promptBuilder,
    required TemplateReviewComposer templateReviewComposer,
  })  : _environment = environment,
        _sharedPreferences = sharedPreferences,
        _naverShopClient = naverShopClient,
        _coupangSearchClient = coupangSearchClient,
        _openAiClient = openAiClient,
        _promptBuilder = promptBuilder,
        _templateReviewComposer = templateReviewComposer;

  static const String _recentQueriesKey = 'recent_queries';

  final AppEnvironment _environment;
  final SharedPreferences _sharedPreferences;
  final NaverShopClient _naverShopClient;
  final CoupangSearchClient _coupangSearchClient;
  final OpenAiClient _openAiClient;
  final ReviewPromptBuilder _promptBuilder;
  final TemplateReviewComposer _templateReviewComposer;

  @override
  Future<List<String>> loadRecentQueries() async {
    final queries = _sharedPreferences.getStringList(_recentQueriesKey);
    return queries ?? <String>[];
  }

  @override
  Future<List<Product>> searchProducts(
    String query,
    SearchSource source,
  ) async {
    final trimmedQuery = query.trim();
    await _saveRecentQuery(trimmedQuery);

    return switch (source) {
      SearchSource.naver => _searchNaver(trimmedQuery),
      SearchSource.coupang => _searchCoupang(trimmedQuery),
    };
  }

  Future<List<Product>> _searchNaver(String query) async {
    if (!_environment.hasNaverCredentials) {
      throw const AppException(
        '네이버 검색 자격증명이 없습니다.',
        details: 'NAVER_CLIENT_ID / NAVER_CLIENT_SECRET를 확인하세요.',
      );
    }

    final items = await _naverShopClient.searchProducts(query);
    return items.map((item) => item.toDomain()).toList(growable: false);
  }

  Future<List<Product>> _searchCoupang(String query) async {
    final items = await _coupangSearchClient.searchProducts(query);
    return items.map((item) => item.toDomain()).toList(growable: false);
  }

  @override
  Future<GeneratedReview> generateReview(ReviewRequest request) async {
    final prompt = _promptBuilder.build(request);

    if (!_environment.hasOpenAiCredentials) {
      return _templateReviewComposer.compose(
        request,
        prompt: prompt,
      );
    }

    try {
      final content = await _openAiClient.generateReview(prompt: prompt);
      return GeneratedReview(
        content: content,
        prompt: prompt,
        starRating: request.starRating,
        platform: request.platform,
        createdAt: DateTime.now(),
      );
    } catch (_) {
      return _templateReviewComposer.compose(
        request,
        prompt: prompt,
      );
    }
  }

  Future<void> _saveRecentQuery(String query) async {
    if (query.isEmpty) {
      return;
    }

    final currentQueries = await loadRecentQueries();
    final nextQueries = <String>[
      query,
      ...currentQueries.where((item) => item != query),
    ].take(6).toList(growable: false);

    await _sharedPreferences.setStringList(_recentQueriesKey, nextQueries);
  }
}
