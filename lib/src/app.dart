import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/generator/presentation/review_generator_section.dart';
import 'features/rating/presentation/review_options_section.dart';
import 'features/search/presentation/search_section.dart';
import 'providers/app_providers.dart';
import 'providers/review_genie_controller.dart';

class ReviewGenieApp extends StatelessWidget {
  const ReviewGenieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReviewGenie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const ReviewGenieHomePage(),
    );
  }
}

class ReviewGenieHomePage extends ConsumerWidget {
  const ReviewGenieHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(appEnvironmentProvider);
    final state = ref.watch(reviewGenieControllerProvider);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isWideLayout = screenWidth >= 1080;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF7F2E8),
              Color(0xFFF4E4D2),
              Color(0xFFEAD9C4),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroBanner(
                      isDemoSearch: !environment.hasNaverCredentials,
                      isDemoGeneration: !environment.hasOpenAiCredentials,
                      hasSelection: state.selectedProduct != null,
                    ),
                    const SizedBox(height: 24),
                    if (isWideLayout)
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                SearchSection(),
                                SizedBox(height: 20),
                                ReviewOptionsSection(),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 4,
                            child: ReviewGeneratorSection(),
                          ),
                        ],
                      )
                    else
                      const Column(
                        children: [
                          SearchSection(),
                          SizedBox(height: 20),
                          ReviewOptionsSection(),
                          SizedBox(height: 20),
                          ReviewGeneratorSection(),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  const _HeroBanner({
    required this.isDemoSearch,
    required this.isDemoGeneration,
    required this.hasSelection,
  });

  final bool isDemoSearch;
  final bool isDemoGeneration;
  final bool hasSelection;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.08),
            blurRadius: 32,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _StatusPill(
                label: isDemoSearch ? '네이버 검색: 데모' : '네이버 검색: 실 API',
                color: isDemoSearch ? const Color(0xFF8B5E34) : const Color(0xFF136F63),
              ),
              _StatusPill(
                label: isDemoGeneration ? '리뷰 생성: 템플릿' : '리뷰 생성: AI',
                color: isDemoGeneration ? const Color(0xFF8A3B12) : const Color(0xFF0B5CAB),
              ),
              _StatusPill(
                label: hasSelection ? '상품 선택 완료' : '상품 선택 대기',
                color: hasSelection ? const Color(0xFF4D7C0F) : const Color(0xFF7C2D12),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '상품 검색부터 리뷰 완성까지\n한 화면에서 정리합니다',
            style: textTheme.displaySmall,
          ),
          const SizedBox(height: 12),
          Text(
            'PRD 기준 사용자 흐름을 그대로 반영했습니다. 검색하고, 상품을 고르고, 별점과 플랫폼 톤을 맞춘 뒤 바로 복사 가능한 리뷰를 생성합니다.',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          if (isDemoSearch || isDemoGeneration) ...[
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF4E5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF3C78E)),
              ),
              child: Text(
                '개발 모드입니다. `NAVER_CLIENT_ID`, `NAVER_CLIENT_SECRET`, `OPENAI_API_KEY`를 `--dart-define`로 넣으면 실 API로 전환됩니다.',
                style: textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF7C2D12),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
