// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_shop_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NaverShopItemDto _$NaverShopItemDtoFromJson(Map<String, dynamic> json) =>
    _NaverShopItemDto(
      title: json['title'] as String? ?? '',
      link: json['link'] as String? ?? '',
      mallName: json['mallName'] as String? ?? '',
      category1: json['category1'] as String? ?? '',
      category2: json['category2'] as String? ?? '',
      category3: json['category3'] as String? ?? '',
      category4: json['category4'] as String? ?? '',
    );

Map<String, dynamic> _$NaverShopItemDtoToJson(_NaverShopItemDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'mallName': instance.mallName,
      'category1': instance.category1,
      'category2': instance.category2,
      'category3': instance.category3,
      'category4': instance.category4,
    };
