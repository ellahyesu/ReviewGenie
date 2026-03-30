import 'package:shared_preferences/shared_preferences.dart';

import '../../core/config/app_environment.dart';
import '../../core/utils/review_prompt_builder.dart';
import '../../core/utils/template_review_composer.dart';
import '../../features/generator/domain/generated_review.dart';
import '../../features/generator/domain/review_request.dart';
import '../../features/search/domain/product.dart';
import '../clients/naver_shop_client.dart';
import '../clients/open_ai_client.dart';

abstract class ReviewGenieRepository {
  Future<List<String>> loadRecentQueries();

  Future<List<Product>> searchProducts(String query);

  Future<GeneratedReview> generateReview(ReviewRequest request);
}

class ReviewGenieRepositoryImpl implements ReviewGenieRepository {
  ReviewGenieRepositoryImpl({
    required AppEnvironment environment,
    required SharedPreferences sharedPreferences,
    required NaverShopClient naverShopClient,
    required OpenAiClient openAiClient,
    required ReviewPromptBuilder promptBuilder,
    required TemplateReviewComposer templateReviewComposer,
  })  : _environment = environment,
        _sharedPreferences = sharedPreferences,
        _naverShopClient = naverShopClient,
        _openAiClient = openAiClient,
        _promptBuilder = promptBuilder,
        _templateReviewComposer = templateReviewComposer;

  static const String _recentQueriesKey = 'recent_queries';

  final AppEnvironment _environment;
  final SharedPreferences _sharedPreferences;
  final NaverShopClient _naverShopClient;
  final OpenAiClient _openAiClient;
  final ReviewPromptBuilder _promptBuilder;
  final TemplateReviewComposer _templateReviewComposer;

  @override
  Future<List<String>> loadRecentQueries() async {
    final queries = _sharedPreferences.getStringList(_recentQueriesKey);
    return queries ?? <String>[];
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final trimmedQuery = query.trim();
    await _saveRecentQuery(trimmedQuery);

    if (!_environment.hasNaverCredentials) {
      return _buildMockProducts(trimmedQuery);
    }

    final items = await _naverShopClient.searchProducts(trimmedQuery);
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

  List<Product> _buildMockProducts(String query) {
    final category = _guessCategory(query);

    return <Product>[
      Product(
        id: 'mock-$query-1',
        name: '$query 프리미엄 에디션',
        categories: <String>[category, '데모 검색'],
        mallName: 'ReviewGenie Lab',
      ),
      Product(
        id: 'mock-$query-2',
        name: '$query 실속형',
        categories: <String>[category, '입문형'],
        mallName: 'Preview Store',
      ),
      Product(
        id: 'mock-$query-3',
        name: '$query 베스트셀러',
        categories: <String>[category, '인기 상품'],
        mallName: 'Sample Market',
      ),
    ];
  }

  String _guessCategory(String query) {
    if (query.contains('치킨') || query.contains('피자') || query.contains('족발')) {
      return '배달음식';
    }
    if (query.contains('의자') || query.contains('책상') || query.contains('조명')) {
      return '가구';
    }
    if (query.contains('샴푸') || query.contains('크림') || query.contains('세럼')) {
      return '뷰티';
    }
    if (query.contains('이어폰') || query.contains('키보드') || query.contains('노트북')) {
      return '디지털';
    }

    return '일반 상품';
  }
}
