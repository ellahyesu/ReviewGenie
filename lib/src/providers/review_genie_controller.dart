import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/error/app_exception.dart';
import '../data/repositories/review_genie_repository.dart';
import '../features/generator/domain/review_request.dart';
import '../features/rating/domain/review_platform.dart';
import '../features/search/domain/product.dart';
import '../features/search/domain/search_source.dart';
import 'app_providers.dart';
import 'review_genie_state.dart';

final reviewGenieControllerProvider =
    NotifierProvider<ReviewGenieController, ReviewGenieState>(
  ReviewGenieController.new,
);

class ReviewGenieController extends Notifier<ReviewGenieState> {
  ReviewGenieRepository get _repository => ref.read(reviewGenieRepositoryProvider);

  @override
  ReviewGenieState build() {
    Future<void>.microtask(_hydrateRecentQueries);
    return const ReviewGenieState();
  }

  Future<void> _hydrateRecentQueries() async {
    final recentQueries = await _repository.loadRecentQueries();

    if (!ref.mounted) {
      return;
    }

    state = state.copyWith(recentQueries: recentQueries);
  }

  void updateQuery(String query) {
    state = state.copyWith(
      query: query,
      searchError: null,
      searchMessage: null,
    );
  }

  void updateSearchSource(SearchSource source) {
    state = state.copyWith(
      searchSource: source,
      searchError: null,
      searchMessage: null,
    );
  }

  Future<void> useRecentQuery(String query) async {
    state = state.copyWith(query: query);
    await searchProducts();
  }

  Future<void> searchProducts() async {
    final query = state.query.trim();

    if (query.isEmpty) {
      state = state.copyWith(
        searchError: '검색어를 입력해주세요.',
        searchMessage: null,
      );
      return;
    }

    final selectedProductId = state.selectedProduct?.id;
    state = state.copyWith(
      query: query,
      isSearching: true,
      searchError: null,
      searchMessage: null,
      generationError: null,
      generatedReview: null,
    );

    try {
      final results = await _repository.searchProducts(query, state.searchSource);
      final recentQueries = await _repository.loadRecentQueries();

      if (!ref.mounted) {
        return;
      }

      state = state.copyWith(
        isSearching: false,
        searchResults: results,
        recentQueries: recentQueries,
        selectedProduct: _findSelectedProduct(results, selectedProductId),
        searchError: results.isEmpty ? '검색 결과가 없습니다.' : null,
        searchMessage: null,
      );
    } on AppException catch (error) {
      final fallbackResults = _buildMockProducts(query, state.searchSource);
      state = state.copyWith(
        isSearching: false,
        searchResults: fallbackResults,
        searchError: null,
        searchMessage: _composeSearchMessage(error),
      );
    } catch (_) {
      final fallbackResults = _buildMockProducts(query, state.searchSource);
      state = state.copyWith(
        isSearching: false,
        searchResults: fallbackResults,
        searchError: null,
        searchMessage:
            '검색 중 알 수 없는 오류가 발생했습니다. 데모 결과로 대체했습니다.',
      );
    }
  }

  void selectProduct(Product product) {
    state = state.copyWith(
      selectedProduct: product,
      generationError: null,
      generatedReview: null,
    );
  }

  void updateStarRating(int starRating) {
    state = state.copyWith(
      starRating: starRating,
      generationError: null,
      generatedReview: null,
    );
  }

  void updatePlatform(ReviewPlatform platform) {
    state = state.copyWith(
      platform: platform,
      generationError: null,
      generatedReview: null,
    );
  }

  Future<void> generateReview() async {
    final product = state.selectedProduct;

    if (product == null) {
      state = state.copyWith(
        generationError: '리뷰를 생성하려면 먼저 상품을 선택해주세요.',
      );
      return;
    }

    state = state.copyWith(
      isGenerating: true,
      generationError: null,
    );

    try {
      final review = await _repository.generateReview(
        ReviewRequest(
          product: product,
          starRating: state.starRating,
          platform: state.platform,
        ),
      );

      if (!ref.mounted) {
        return;
      }

      state = state.copyWith(
        isGenerating: false,
        generatedReview: review,
      );
    } on AppException catch (error) {
      state = state.copyWith(
        isGenerating: false,
        generationError: error.message,
      );
    } catch (_) {
      state = state.copyWith(
        isGenerating: false,
        generationError: '리뷰 생성 중 알 수 없는 오류가 발생했습니다.',
      );
    }
  }

  Product? _findSelectedProduct(List<Product> products, String? productId) {
    if (productId == null) {
      return null;
    }

    for (final product in products) {
      if (product.id == productId) {
        return product;
      }
    }

    return null;
  }

  List<Product> _buildMockProducts(
    String query,
    SearchSource source,
  ) {
    final category = _guessCategory(query);
    final sourceLabel = switch (source) {
      SearchSource.naver => '네이버',
      SearchSource.coupang => '쿠팡',
    };

    return <Product>[
      Product(
        id: 'fallback-$sourceLabel-$query-1',
        name: '$query 프리미엄 에디션',
        categories: <String>[category, '$sourceLabel 검색'],
        mallName: 'ReviewGenie Lab',
      ),
      Product(
        id: 'fallback-$sourceLabel-$query-2',
        name: '$query 실속형',
        categories: <String>[category, '입문형'],
        mallName: 'Preview Store',
      ),
      Product(
        id: 'fallback-$sourceLabel-$query-3',
        name: '$query 베스트셀러',
        categories: <String>[category, '인기 상품'],
        mallName: '$sourceLabel Demo',
      ),
    ];
  }

  String _guessCategory(String query) {
    if (query.contains('치킨') ||
        query.contains('피자') ||
        query.contains('족발') ||
        query.contains('닭강정')) {
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

  String _composeSearchMessage(AppException error) {
    final details = error.details;
    if (details == null || details.trim().isEmpty) {
      return '${error.message} 데모 결과로 대체했습니다.';
    }

    return '${error.message} ($details) 데모 결과로 대체했습니다.';
  }
}
