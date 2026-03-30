import 'package:freezed_annotation/freezed_annotation.dart';

import '../features/generator/domain/generated_review.dart';
import '../features/rating/domain/review_platform.dart';
import '../features/search/domain/product.dart';
import '../features/search/domain/search_source.dart';

part 'review_genie_state.freezed.dart';

@freezed
abstract class ReviewGenieState with _$ReviewGenieState {
  const ReviewGenieState._();

  const factory ReviewGenieState({
    @Default('') String query,
    @Default(<String>[]) List<String> recentQueries,
    @Default(<Product>[]) List<Product> searchResults,
    Product? selectedProduct,
    @Default(5) int starRating,
    @Default(ReviewPlatform.naverReceipt) ReviewPlatform platform,
    @Default(SearchSource.naver) SearchSource searchSource,
    GeneratedReview? generatedReview,
    @Default(false) bool isSearching,
    @Default(false) bool isGenerating,
    String? searchError,
    String? searchMessage,
    String? generationError,
  }) = _ReviewGenieState;

  bool get canGenerate => selectedProduct != null && !isGenerating;
}
