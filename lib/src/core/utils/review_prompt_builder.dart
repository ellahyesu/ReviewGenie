import '../../features/generator/domain/review_request.dart';

class ReviewPromptBuilder {
  const ReviewPromptBuilder();

  String build(ReviewRequest request) {
    final ratingGuide = switch (request.starRating) {
      5 => '강한 만족감을 기반으로 구체적인 장점을 2개 이상 자연스럽게 드러낸다.',
      4 => '전반적으로 만족하지만 아주 작은 아쉬움은 은근하게 남겨 현실감을 준다.',
      3 => '장점과 아쉬움을 균형 있게 섞어 무난한 만족도로 보이게 한다.',
      2 => '아쉬움이 중심이지만 감정 폭발보다는 실사용 불편을 구체적으로 말한다.',
      _ => '실망과 불만이 분명해야 하며 재구매 의사가 없다는 분위기를 담는다.',
    };
    final toneGuide = request.platform.promptGuide;

    return '''
너는 ${request.platform.label}에서 활동하는 숙련된 한국인 리뷰어다.
상품명: ${request.product.name}
카테고리: ${request.categoryText}
별점: ${request.starRating}점
플랫폼 톤: $toneGuide

작성 규칙:
- 한국어만 사용한다.
- 제목 없이 본문만 출력한다.
- 1인칭 시점으로 작성한다.
- 실제 상위 리뷰에서 자주 보이는 흐름처럼 도입 -> 사용 경험 -> 총평 구조를 따른다.
- $ratingGuide
- 분량은 120자 이상 220자 이하로 유지한다.
- 허위 체험, 과장 광고, 과도한 해시태그, 리스트 기호는 사용하지 않는다.
- 상품 카테고리와 사용 맥락이 자연스럽게 드러나야 한다.
''';
  }
}
