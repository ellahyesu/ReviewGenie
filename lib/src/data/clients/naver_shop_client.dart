import 'package:dio/dio.dart';

import '../../core/config/app_environment.dart';
import '../../core/error/app_exception.dart';
import '../dtos/naver_shop_item_dto.dart';
import '../dtos/naver_shop_response_dto.dart';

class NaverShopClient {
  const NaverShopClient({
    required this.dio,
    required this.environment,
  });

  final Dio dio;
  final AppEnvironment environment;

  Future<List<NaverShopItemDto>> searchProducts(String query) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/shop.json',
        queryParameters: <String, dynamic>{
          'query': query,
          'display': 12,
          'sort': 'sim',
        },
        options: Options(
          headers: <String, String>{
            'X-Naver-Client-Id': environment.naverClientId,
            'X-Naver-Client-Secret': environment.naverClientSecret,
          },
        ),
      );

      final dto = NaverShopResponseDto.fromJson(
        response.data ?? <String, dynamic>{},
      );

      return dto.items;
    } on DioException catch (error) {
      throw AppException(
        '네이버 쇼핑 검색을 불러오지 못했습니다.',
        details: error.message,
      );
    }
  }
}
