// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewRequest _$ReviewRequestFromJson(Map<String, dynamic> json) =>
    _ReviewRequest(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      starRating: (json['starRating'] as num).toInt(),
      platform: $enumDecode(_$ReviewPlatformEnumMap, json['platform']),
    );

Map<String, dynamic> _$ReviewRequestToJson(_ReviewRequest instance) =>
    <String, dynamic>{
      'product': instance.product,
      'starRating': instance.starRating,
      'platform': _$ReviewPlatformEnumMap[instance.platform]!,
    };

const _$ReviewPlatformEnumMap = {
  ReviewPlatform.naverBlog: 'naverBlog',
  ReviewPlatform.naverReceipt: 'naverReceipt',
  ReviewPlatform.coupang: 'coupang',
  ReviewPlatform.baemin: 'baemin',
};
