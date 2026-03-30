import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/section_card.dart';
import '../../../features/generator/domain/generated_review.dart';
import '../../../providers/app_providers.dart';
import '../../../providers/review_genie_controller.dart';

class ReviewGeneratorSection extends ConsumerWidget {
  const ReviewGeneratorSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reviewGenieControllerProvider);
    final environment = ref.watch(appEnvironmentProvider);
    final controller = ref.read(reviewGenieControllerProvider.notifier);
    final review = state.generatedReview;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SectionCard(
      stepLabel: 'Step 3',
      title: '리뷰 생성',
      subtitle: '선택한 조건으로 리뷰를 만들고 바로 복사합니다.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ChecklistTile(
            title: '상품',
            value: state.selectedProduct?.name ?? '선택 필요',
            isReady: state.selectedProduct != null,
          ),
          const SizedBox(height: 10),
          _ChecklistTile(
            title: '별점',
            value: '${state.starRating}점',
            isReady: true,
          ),
          const SizedBox(height: 10),
          _ChecklistTile(
            title: '플랫폼',
            value: state.platform.label,
            isReady: true,
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: state.selectedProduct == null || state.isGenerating
                  ? null
                  : controller.generateReview,
              icon: state.isGenerating
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.auto_awesome_rounded),
              label: Text(
                state.isGenerating ? '리뷰 생성 중...' : '리뷰 생성하기',
              ),
            ),
          ),
          if (state.generationError != null) ...[
            const SizedBox(height: 14),
            Text(
              state.generationError!,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: review == null
                ? Text(
                    '상품을 고른 뒤 생성 버튼을 누르면 이 영역에 플랫폼 톤에 맞춘 리뷰가 표시됩니다.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: review.source == ReviewGenerationSource.ai
                                  ? const Color(0xFFD9F5E5)
                                  : const Color(0xFFFFE6D1),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              '${review.source.label} ${review.source == ReviewGenerationSource.ai ? '생성' : '폴백'}',
                              style: textTheme.labelLarge?.copyWith(
                                color: review.source == ReviewGenerationSource.ai
                                    ? const Color(0xFF136F63)
                                    : const Color(0xFF8A3B12),
                              ),
                            ),
                          ),
                          const Spacer(),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(text: review.content),
                              );

                              if (!context.mounted) {
                                return;
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('리뷰를 클립보드에 복사했습니다.'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.copy_rounded),
                            label: const Text('복사'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SelectableText(
                        review.content,
                        style: textTheme.bodyLarge?.copyWith(height: 1.7),
                      ),
                      if (review.source == ReviewGenerationSource.template) ...[
                        const SizedBox(height: 16),
                        Text(
                          environment.hasOpenAiCredentials
                              ? 'AI 응답 실패로 템플릿 리뷰를 대신 사용했습니다.'
                              : 'OPENAI_API_KEY가 없어 템플릿 리뷰를 사용했습니다.',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _ChecklistTile extends StatelessWidget {
  const _ChecklistTile({
    required this.title,
    required this.value,
    required this.isReady,
  });

  final String title;
  final String value;
  final bool isReady;

  @override
  Widget build(BuildContext context) {
    final color = isReady ? const Color(0xFF136F63) : const Color(0xFF8A3B12);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            isReady ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
            color: color,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$title  ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color,
                        ),
                  ),
                  TextSpan(
                    text: value,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
