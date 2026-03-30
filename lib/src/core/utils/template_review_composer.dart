import '../../features/generator/domain/generated_review.dart';
import '../../features/generator/domain/review_request.dart';
import '../../features/rating/domain/review_platform.dart';

class TemplateReviewComposer {
  const TemplateReviewComposer();

  GeneratedReview compose(
    ReviewRequest request, {
    required String prompt,
  }) {
    final content = [
      _buildOpening(request),
      _buildExperience(request),
      _buildClosing(request),
    ].join(' ');

    return GeneratedReview(
      content: content,
      prompt: prompt,
      starRating: request.starRating,
      platform: request.platform,
      createdAt: DateTime.now(),
      source: ReviewGenerationSource.template,
    );
  }

  String _buildOpening(ReviewRequest request) {
    final productName = request.product.name;

    return switch (request.platform) {
      ReviewPlatform.naverBlog =>
        '요즘 $productName 후기가 좋아서 직접 써봤는데 첫인상부터 꽤 또렷했어요.',
      ReviewPlatform.naverReceipt =>
        '$productName 선택 전에 후기 많이 보고 갔는데 실제 사용감이 궁금해서 바로 남깁니다.',
      ReviewPlatform.coupang =>
        '$productName 받아보고 바로 써본 기준으로 솔직하게 적어볼게요.',
      ReviewPlatform.baemin =>
        '$productName 주문해보고 바로 먹어본 느낌 기준으로 남겨요.',
    };
  }

  String _buildExperience(ReviewRequest request) {
    final category = request.categoryText;

    return switch (request.starRating) {
      5 =>
        '$category 계열에서 기대했던 포인트가 거의 다 맞았고, 사용하면서 만족감이 계속 올라왔어요. 디테일도 깔끔해서 굳이 단점을 찾을 필요가 없었어요.',
      4 =>
        '전체적으로 만족스러웠고 특히 편하게 쓰기 좋은 점이 분명했어요. 다만 아주 사소한 부분에서 취향 차이는 있을 수 있지만 재구매 의사는 충분합니다.',
      3 =>
        '기본기는 괜찮은데 기대했던 만큼 강하게 인상적인 느낌은 아니었어요. 무난하게 쓰기에는 괜찮지만 호불호가 조금 갈릴 수 있겠다는 생각은 들었습니다.',
      2 =>
        '처음 기대치에 비해 아쉬운 부분이 더 빨리 보였어요. 쓰는 동안 불편한 포인트가 반복돼서 만족도는 높지 않았습니다.',
      _ =>
        '솔직히 기대와 차이가 컸고 만족스럽지 않았어요. 사용 경험에서 불편함이 바로 느껴져서 다시 고를 가능성은 낮습니다.',
    };
  }

  String _buildClosing(ReviewRequest request) {
    return switch (request.platform) {
      ReviewPlatform.naverBlog => switch (request.starRating) {
          5 => '비슷한 고민 중이라면 저는 꽤 자신 있게 추천할 수 있을 것 같아요.',
          4 => '전반적으로 만족해서 다음에도 다시 찾을 가능성이 높아요.',
          3 => '한 번쯤은 써볼 만하지만 기대치를 조금 낮추면 더 괜찮을 것 같아요.',
          2 => '개선되면 좋겠고 지금 상태라면 적극 추천하긴 어렵습니다.',
          _ => '저처럼 중요하게 보는 기준이 있다면 신중하게 비교해보시는 편이 좋겠습니다.',
        },
      ReviewPlatform.naverReceipt => switch (request.starRating) {
          5 => '재방문하거나 다시 구매할 의사가 있습니다.',
          4 => '다음에도 비슷한 상황이면 다시 선택할 것 같아요.',
          3 => '무난한 편이라 상황에 따라 다시 고를 수는 있을 것 같습니다.',
          2 => '가격이나 기대 대비 만족도는 낮은 편이었습니다.',
          _ => '현재 기준으로는 재구매 의사는 없습니다.',
        },
      ReviewPlatform.coupang => switch (request.starRating) {
          5 => '빠르게 만족도 높은 선택을 원하면 괜찮은 후보예요.',
          4 => '전반적으로 괜찮아서 실사용 기준 추천 가능합니다.',
          3 => '장단점이 뚜렷해서 후기 보고 판단하면 좋겠습니다.',
          2 => '기대치가 높다면 아쉬울 수 있어요.',
          _ => '다른 상품도 같이 비교해보는 쪽을 권합니다.',
        },
      ReviewPlatform.baemin => switch (request.starRating) {
          5 => '다음에 생각나면 다시 주문할 정도로 만족했어요.',
          4 => '무난하게 만족스러워서 또 주문할 수 있을 것 같아요.',
          3 => '배고플 때 무난하게 먹기엔 괜찮았어요.',
          2 => '다음 주문 때는 다른 메뉴나 다른 곳을 먼저 볼 것 같아요.',
          _ => '재주문은 어렵고 다른 선택지를 찾을 것 같습니다.',
        },
    };
  }
}
