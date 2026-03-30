// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneratedReview _$GeneratedReviewFromJson(Map<String, dynamic> json) =>
    _GeneratedReview(
      content: json['content'] as String,
      prompt: json['prompt'] as String,
      starRating: (json['starRating'] as num).toInt(),
      platform: $enumDecode(_$ReviewPlatformEnumMap, json['platform']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      source:
          $enumDecodeNullable(
            _$ReviewGenerationSourceEnumMap,
            json['source'],
          ) ??
          ReviewGenerationSource.ai,
    );

Map<String, dynamic> _$GeneratedReviewToJson(_GeneratedReview instance) =>
    <String, dynamic>{
      'content': instance.content,
      'prompt': instance.prompt,
      'starRating': instance.starRating,
      'platform': _$ReviewPlatformEnumMap[instance.platform]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'source': _$ReviewGenerationSourceEnumMap[instance.source]!,
    };

const _$ReviewPlatformEnumMap = {
  ReviewPlatform.naverBlog: 'naverBlog',
  ReviewPlatform.naverReceipt: 'naverReceipt',
  ReviewPlatform.coupang: 'coupang',
  ReviewPlatform.baemin: 'baemin',
};

const _$ReviewGenerationSourceEnumMap = {
  ReviewGenerationSource.ai: 'ai',
  ReviewGenerationSource.template: 'template',
};
