import 'package:flutter_test/flutter_test.dart';
import 'package:review_genie/src/core/utils/review_prompt_builder.dart';
import 'package:review_genie/src/features/generator/domain/review_request.dart';
import 'package:review_genie/src/features/rating/domain/review_platform.dart';
import 'package:review_genie/src/features/search/domain/product.dart';

void main() {
  test('prompt builder includes product, rating, and platform tone', () {
    const builder = ReviewPromptBuilder();
    final request = ReviewRequest(
      product: const Product(
        id: 'demo',
        name: '닭강정 세트',
        categories: <String>['배달음식', '치킨'],
      ),
      starRating: 4,
      platform: ReviewPlatform.baemin,
    );

    final prompt = builder.build(request);

    expect(prompt, contains('닭강정 세트'));
    expect(prompt, contains('4점'));
    expect(prompt, contains(ReviewPlatform.baemin.label));
  });
}
