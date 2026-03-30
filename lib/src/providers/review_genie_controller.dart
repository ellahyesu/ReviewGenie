import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/error/app_exception.dart';
import '../data/repositories/review_genie_repository.dart';
import '../features/generator/domain/review_request.dart';
import '../features/rating/domain/review_platform.dart';
import '../features/search/domain/product.dart';
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
      );
      return;
    }

    final selectedProductId = state.selectedProduct?.id;
    state = state.copyWith(
      query: query,
      isSearching: true,
      searchError: null,
      generationError: null,
      generatedReview: null,
    );

    try {
      final results = await _repository.searchProducts(query);
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
      );
    } on AppException catch (error) {
      state = state.copyWith(
        isSearching: false,
        searchError: error.message,
      );
    } catch (_) {
      state = state.copyWith(
        isSearching: false,
        searchError: '검색 중 알 수 없는 오류가 발생했습니다.',
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

    // Riverpod state = React 전역 state처럼 검색/선택/생성 결과를 한곳에서 관리합니다.
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
}
