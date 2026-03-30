import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/section_card.dart';
import '../../../providers/review_genie_controller.dart';
import '../domain/review_platform.dart';

class ReviewOptionsSection extends ConsumerWidget {
  const ReviewOptionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reviewGenieControllerProvider);
    final controller = ref.read(reviewGenieControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SectionCard(
      stepLabel: 'Step 2',
      title: '별점과 플랫폼 톤 설정',
      subtitle: '리뷰 감성과 문체를 결정하는 핵심 옵션입니다.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.selectedProduct != null) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '선택된 상품',
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.selectedProduct!.name,
                    style: textTheme.titleLarge,
                  ),
                  if (state.selectedProduct!.categoryPath.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      state.selectedProduct!.categoryPath,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 22),
          ],
          Text('별점 선택', style: textTheme.titleLarge),
          const SizedBox(height: 10),
          Row(
            children: List<Widget>.generate(5, (index) {
              final rating = index + 1;
              final isActive = rating <= state.starRating;

              return Padding(
                padding: EdgeInsets.only(right: index == 4 ? 0 : 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => controller.updateStarRating(rating),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFFFFE2A8)
                          : colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      isActive ? Icons.star_rounded : Icons.star_border_rounded,
                      color: isActive
                          ? const Color(0xFFB45309)
                          : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          Text(
            _ratingDescription(state.starRating),
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Text('플랫폼 선택', style: textTheme.titleLarge),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: ReviewPlatform.values.map((platform) {
              final isSelected = platform == state.platform;
              return ChoiceChip(
                label: Text(platform.label),
                selected: isSelected,
                onSelected: (_) => controller.updatePlatform(platform),
              );
            }).toList(growable: false),
          ),
        ],
      ),
    );
  }

  String _ratingDescription(int rating) {
    return switch (rating) {
      5 => '매우 만족. 강한 추천과 구체적인 장점이 드러나는 톤으로 생성됩니다.',
      4 => '대체로 만족. 현실적인 만족감과 작은 아쉬움이 함께 반영됩니다.',
      3 => '보통. 장단점이 함께 보이는 중립 톤으로 생성됩니다.',
      2 => '아쉬움이 큼. 불편과 부족한 점을 중심으로 작성됩니다.',
      _ => '매우 불만족. 분명한 실망감과 재구매 의사 없음이 드러납니다.',
    };
  }
}
