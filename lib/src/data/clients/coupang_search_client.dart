import 'package:dio/dio.dart';

import '../../core/error/app_exception.dart';
import '../dtos/naver_shop_item_dto.dart';

class CoupangSearchClient {
  const CoupangSearchClient({
    required this.dio,
  });

  final Dio dio;

  Future<List<NaverShopItemDto>> searchProducts(String query) async {
    // 공개적으로 검증 가능한 마켓플레이스 상품 검색 API가 아닌 경우,
    // 백엔드 프록시 또는 별도 제공 API가 필요합니다.
    throw AppException(
      '쿠팡 상품 검색 API가 아직 연결되지 않았습니다.',
      details: '쿠팡 공개 문서 기준으로 현재 프로젝트에 바로 붙일 수 있는 마켓 상품 검색 API가 확인되지 않았습니다.',
    );
  }
}
