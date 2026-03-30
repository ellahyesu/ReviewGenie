import 'package:dio/dio.dart';

import '../../core/config/app_environment.dart';
import '../../core/error/app_exception.dart';
import '../dtos/open_ai_response_dto.dart';

class OpenAiClient {
  const OpenAiClient({
    required this.dio,
    required this.environment,
  });

  final Dio dio;
  final AppEnvironment environment;

  Future<String> generateReview({
    required String prompt,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/responses',
        data: <String, dynamic>{
          'model': environment.openAiModel,
          'instructions':
              'You write natural Korean shopping reviews that feel human, grounded, and platform-native.',
          'input': prompt,
          'temperature': 0.9,
          'max_output_tokens': 320,
        },
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer ${environment.openAiApiKey}',
          },
        ),
      );

      final dto = OpenAiResponseDto.fromJson(
        response.data ?? <String, dynamic>{},
      );
      final text = dto.firstText;

      if (text.isEmpty) {
        throw const AppException('AI가 비어 있는 응답을 반환했습니다.');
      }

      return text;
    } on DioException catch (error) {
      throw AppException(
        'AI 리뷰 생성 요청이 실패했습니다.',
        details: error.message,
      );
    }
  }
}
