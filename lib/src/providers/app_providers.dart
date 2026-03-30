import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/app_environment.dart';
import '../core/utils/review_prompt_builder.dart';
import '../core/utils/template_review_composer.dart';
import '../data/clients/coupang_search_client.dart';
import '../data/clients/naver_shop_client.dart';
import '../data/clients/open_ai_client.dart';
import '../data/repositories/review_genie_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden.');
});

final appEnvironmentProvider = Provider<AppEnvironment>((ref) {
  return AppEnvironment.fromEnvironment();
});

final naverShopDioProvider = Provider<Dio>((ref) {
  final environment = ref.read(appEnvironmentProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: kIsWeb
          ? environment.naverProxyBaseUrl
          : 'https://openapi.naver.com/v1/search',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: false,
      ),
    );
  }

  return dio;
});

final openAiDioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openai.com/v1',
      connectTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: false,
      ),
    );
  }

  return dio;
});

final naverShopClientProvider = Provider<NaverShopClient>((ref) {
  return NaverShopClient(
    dio: ref.read(naverShopDioProvider),
    environment: ref.read(appEnvironmentProvider),
  );
});

final coupangSearchClientProvider = Provider<CoupangSearchClient>((ref) {
  return CoupangSearchClient(
    dio: ref.read(naverShopDioProvider),
  );
});

final openAiClientProvider = Provider<OpenAiClient>((ref) {
  return OpenAiClient(
    dio: ref.read(openAiDioProvider),
    environment: ref.read(appEnvironmentProvider),
  );
});

final reviewPromptBuilderProvider = Provider<ReviewPromptBuilder>((ref) {
  return const ReviewPromptBuilder();
});

final templateReviewComposerProvider =
    Provider<TemplateReviewComposer>((ref) {
  return const TemplateReviewComposer();
});

final reviewGenieRepositoryProvider = Provider<ReviewGenieRepository>((ref) {
  return ReviewGenieRepositoryImpl(
    environment: ref.read(appEnvironmentProvider),
    sharedPreferences: ref.read(sharedPreferencesProvider),
    naverShopClient: ref.read(naverShopClientProvider),
    coupangSearchClient: ref.read(coupangSearchClientProvider),
    openAiClient: ref.read(openAiClientProvider),
    promptBuilder: ref.read(reviewPromptBuilderProvider),
    templateReviewComposer: ref.read(templateReviewComposerProvider),
  );
});
