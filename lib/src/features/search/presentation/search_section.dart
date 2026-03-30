import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/section_card.dart';
import '../../../providers/review_genie_controller.dart';
import '../domain/product.dart';

class SearchSection extends ConsumerStatefulWidget {
  const SearchSection({super.key});

  @override
  ConsumerState<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends ConsumerState<SearchSection> {
  late final TextEditingController _textController;
  late final ProviderSubscription<String> _querySubscription;

  @override
  void initState() {
    super.initState();
    final initialQuery = ref.read(reviewGenieControllerProvider).query;
    _textController = TextEditingController(text: initialQuery);
    _querySubscription = ref.listenManual<String>(
      reviewGenieControllerProvider.select((state) => state.query),
      (previous, next) {
        if (_textController.text == next) {
          return;
        }

        _textController.value = TextEditingValue(
          text: next,
          selection: TextSelection.collapsed(offset: next.length),
        );
      },
    );
  }

  @override
  void dispose() {
    _querySubscription.close();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reviewGenieControllerProvider);
    final controller = ref.read(reviewGenieControllerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SectionCard(
      stepLabel: 'Step 1',
      title: '상품 검색',
      subtitle: '카테고리와 상품명을 함께 검색하고, 결과에서 정확한 상품을 선택합니다.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  onChanged: controller.updateQuery,
                  onSubmitted: (_) => controller.searchProducts(),
                  decoration: const InputDecoration(
                    hintText: '예: 무선 이어폰, 닭강정, 샴푸',
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FilledButton(
                onPressed: state.isSearching ? null : controller.searchProducts,
                child: state.isSearching
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('검색'),
              ),
            ],
          ),
          if (state.recentQueries.isNotEmpty) ...[
            const SizedBox(height: 14),
            Text(
              '최근 검색어',
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: state.recentQueries.map((query) {
                return ActionChip(
                  label: Text(query),
                  onPressed: () => controller.useRecentQuery(query),
                );
              }).toList(growable: false),
            ),
          ],
          if (state.searchError != null) ...[
            const SizedBox(height: 14),
            Text(
              state.searchError!,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          if (state.searchMessage != null) ...[
            const SizedBox(height: 14),
            Text(
              state.searchMessage!,
              style: textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF8A3B12),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          if (state.searchResults.isNotEmpty) ...[
            const SizedBox(height: 18),
            Text('검색 결과', style: textTheme.titleLarge),
            const SizedBox(height: 12),
            Column(
              children: state.searchResults.map((product) {
                final isSelected = state.selectedProduct?.id == product.id;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _ProductResultTile(
                    product: product,
                    isSelected: isSelected,
                    onTap: () => controller.selectProduct(product),
                  ),
                );
              }).toList(growable: false),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProductResultTile extends StatelessWidget {
  const _ProductResultTile({
    required this.product,
    required this.isSelected,
    required this.onTap,
  });

  final Product product;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer.withValues(alpha: 0.58)
              : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isSelected
                  ? Icons.check_circle_rounded
                  : Icons.shopping_bag_outlined,
              color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: textTheme.titleMedium,
                  ),
                  if (product.mallName.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      product.mallName,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (product.categoryPath.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      product.categoryPath,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
