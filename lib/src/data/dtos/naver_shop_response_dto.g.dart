// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_shop_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NaverShopResponseDto _$NaverShopResponseDtoFromJson(
  Map<String, dynamic> json,
) => _NaverShopResponseDto(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => NaverShopItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NaverShopItemDto>[],
);

Map<String, dynamic> _$NaverShopResponseDtoToJson(
  _NaverShopResponseDto instance,
) => <String, dynamic>{'items': instance.items};
