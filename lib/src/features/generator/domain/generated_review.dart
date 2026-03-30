import 'package:freezed_annotation/freezed_annotation.dart';

import '../../rating/domain/review_platform.dart';

part 'generated_review.freezed.dart';
part 'generated_review.g.dart';

enum ReviewGenerationSource {
  ai('AI'),
  template('Template');

  const ReviewGenerationSource(this.label);

  final String label;
}

@freezed
abstract class GeneratedReview with _$GeneratedReview {
  const GeneratedReview._();

  const factory GeneratedReview({
    required String content,
    required String prompt,
    required int starRating,
    required ReviewPlatform platform,
    required DateTime createdAt,
    @Default(ReviewGenerationSource.ai) ReviewGenerationSource source,
  }) = _GeneratedReview;

  factory GeneratedReview.fromJson(Map<String, dynamic> json) =>
      _$GeneratedReviewFromJson(json);
}
