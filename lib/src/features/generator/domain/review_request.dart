import 'package:freezed_annotation/freezed_annotation.dart';

import '../../rating/domain/review_platform.dart';
import '../../search/domain/product.dart';

part 'review_request.freezed.dart';
part 'review_request.g.dart';

@freezed
abstract class ReviewRequest with _$ReviewRequest {
  const ReviewRequest._();

  const factory ReviewRequest({
    required Product product,
    required int starRating,
    required ReviewPlatform platform,
  }) = _ReviewRequest;

  factory ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestFromJson(json);

  String get categoryText =>
      product.categories.isEmpty ? '일반 상품' : product.categoryPath;
}
