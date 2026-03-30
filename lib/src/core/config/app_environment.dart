class AppEnvironment {
  const AppEnvironment({
    required this.naverClientId,
    required this.naverClientSecret,
    required this.openAiApiKey,
    required this.openAiModel,
  });

  const AppEnvironment.fromEnvironment()
      : naverClientId = const String.fromEnvironment('NAVER_CLIENT_ID'),
        naverClientSecret =
            const String.fromEnvironment('NAVER_CLIENT_SECRET'),
        openAiApiKey = const String.fromEnvironment('OPENAI_API_KEY'),
        openAiModel = const String.fromEnvironment(
          'OPENAI_MODEL',
          defaultValue: 'gpt-4.1-mini',
        );

  final String naverClientId;
  final String naverClientSecret;
  final String openAiApiKey;
  final String openAiModel;

  bool get hasNaverCredentials =>
      naverClientId.isNotEmpty && naverClientSecret.isNotEmpty;

  bool get hasOpenAiCredentials => openAiApiKey.isNotEmpty;
}
