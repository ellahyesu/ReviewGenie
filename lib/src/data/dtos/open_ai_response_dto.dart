import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_ai_response_dto.freezed.dart';
part 'open_ai_response_dto.g.dart';

@freezed
abstract class OpenAiResponseDto with _$OpenAiResponseDto {
  const OpenAiResponseDto._();

  const factory OpenAiResponseDto({
    @Default(<OpenAiOutputDto>[]) List<OpenAiOutputDto> output,
  }) = _OpenAiResponseDto;

  factory OpenAiResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAiResponseDtoFromJson(json);

  String get firstText {
    for (final item in output) {
      for (final content in item.content) {
        final text = content.text?.trim();
        if (content.type == 'output_text' && text != null && text.isNotEmpty) {
          return text;
        }
      }
    }

    return '';
  }
}

@freezed
abstract class OpenAiOutputDto with _$OpenAiOutputDto {
  const factory OpenAiOutputDto({
    @Default('') String type,
    @Default(<OpenAiContentDto>[]) List<OpenAiContentDto> content,
  }) = _OpenAiOutputDto;

  factory OpenAiOutputDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAiOutputDtoFromJson(json);
}

@freezed
abstract class OpenAiContentDto with _$OpenAiContentDto {
  const factory OpenAiContentDto({
    @Default('') String type,
    String? text,
  }) = _OpenAiContentDto;

  factory OpenAiContentDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAiContentDtoFromJson(json);
}
