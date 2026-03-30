enum ReviewPlatform {
  naverBlog(
    label: '네이버 블로그',
    promptGuide: '스토리텔링이 자연스럽고 경험 중심 문장, 이모지는 적당히 사용',
  ),
  naverReceipt(
    label: '네이버 영수증',
    promptGuide: '짧고 실용적인 문장, 재방문 여부와 만족 포인트를 간결하게 전달',
  ),
  coupang(
    label: '쿠팡',
    promptGuide: '배송, 실사용성, 가성비를 중심으로 솔직하고 명확하게 전달',
  ),
  baemin(
    label: '배달의민족',
    promptGuide: '먹은 직후의 생생한 톤, 메뉴 상태와 만족도를 편하게 전달',
  );

  const ReviewPlatform({
    required this.label,
    required this.promptGuide,
  });

  final String label;
  final String promptGuide;
}
