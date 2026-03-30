import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  const AppEnvironment({
    required this.naverClientId,
    required this.naverClientSecret,
    required this.openAiApiKey,
    required this.openAiModel,
  });

  AppEnvironment.fromEnvironment()
      : naverClientId = _read('NAVER_CLIENT_ID'),
        naverClientSecret = _read('NAVER_CLIENT_SECRET'),
        openAiApiKey = _read('OPENAI_API_KEY'),
        openAiModel = _read('OPENAI_MODEL', fallback: 'gpt-4.1-mini');

  final String naverClientId;
  final String naverClientSecret;
  final String openAiApiKey;
  final String openAiModel;

  bool get hasNaverCredentials =>
      naverClientId.isNotEmpty && naverClientSecret.isNotEmpty;

  bool get hasOpenAiCredentials => openAiApiKey.isNotEmpty;

  static String _read(String key, {String fallback = ''}) {
    final fromDotEnv = dotenv.env[key];
    if (fromDotEnv != null && fromDotEnv.trim().isNotEmpty) {
      return fromDotEnv.trim();
    }

    final fromDartDefine = switch (key) {
      'NAVER_CLIENT_ID' => const String.fromEnvironment('NAVER_CLIENT_ID'),
      'NAVER_CLIENT_SECRET' =>
        const String.fromEnvironment('NAVER_CLIENT_SECRET'),
      'OPENAI_API_KEY' => const String.fromEnvironment('OPENAI_API_KEY'),
      'OPENAI_MODEL' => const String.fromEnvironment(
          'OPENAI_MODEL',
          defaultValue: 'gpt-4.1-mini',
        ),
      _ => '',
    };

    if (fromDartDefine.trim().isNotEmpty) {
      return fromDartDefine.trim();
    }

    return fallback;
  }
}
