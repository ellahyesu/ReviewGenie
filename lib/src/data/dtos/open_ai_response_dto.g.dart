// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_ai_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenAiResponseDto _$OpenAiResponseDtoFromJson(Map<String, dynamic> json) =>
    _OpenAiResponseDto(
      output:
          (json['output'] as List<dynamic>?)
              ?.map((e) => OpenAiOutputDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OpenAiOutputDto>[],
    );

Map<String, dynamic> _$OpenAiResponseDtoToJson(_OpenAiResponseDto instance) =>
    <String, dynamic>{'output': instance.output};

_OpenAiOutputDto _$OpenAiOutputDtoFromJson(Map<String, dynamic> json) =>
    _OpenAiOutputDto(
      type: json['type'] as String? ?? '',
      content:
          (json['content'] as List<dynamic>?)
              ?.map((e) => OpenAiContentDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OpenAiContentDto>[],
    );

Map<String, dynamic> _$OpenAiOutputDtoToJson(_OpenAiOutputDto instance) =>
    <String, dynamic>{'type': instance.type, 'content': instance.content};

_OpenAiContentDto _$OpenAiContentDtoFromJson(Map<String, dynamic> json) =>
    _OpenAiContentDto(
      type: json['type'] as String? ?? '',
      text: json['text'] as String?,
    );

Map<String, dynamic> _$OpenAiContentDtoToJson(_OpenAiContentDto instance) =>
    <String, dynamic>{'type': instance.type, 'text': instance.text};
