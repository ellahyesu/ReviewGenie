enum SearchSource {
  naver(
    label: '네이버',
    description: '네이버 쇼핑 검색 API',
  ),
  coupang(
    label: '쿠팡',
    description: '쿠팡 검색 연동',
  );

  const SearchSource({
    required this.label,
    required this.description,
  });

  final String label;
  final String description;
}
