import 'package:freezed_annotation/freezed_annotation.dart';

import 'naver_shop_item_dto.dart';

part 'naver_shop_response_dto.freezed.dart';
part 'naver_shop_response_dto.g.dart';

@freezed
abstract class NaverShopResponseDto with _$NaverShopResponseDto {
  const factory NaverShopResponseDto({
    @Default(<NaverShopItemDto>[]) List<NaverShopItemDto> items,
  }) = _NaverShopResponseDto;

  factory NaverShopResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NaverShopResponseDtoFromJson(json);
}
