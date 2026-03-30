import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/utils/html_utils.dart';
import '../../features/search/domain/product.dart';

part 'naver_shop_item_dto.freezed.dart';
part 'naver_shop_item_dto.g.dart';

@freezed
abstract class NaverShopItemDto with _$NaverShopItemDto {
  const NaverShopItemDto._();

  const factory NaverShopItemDto({
    @Default('') String title,
    @Default('') String link,
    @Default('') String mallName,
    @JsonKey(name: 'category1') @Default('') String category1,
    @JsonKey(name: 'category2') @Default('') String category2,
    @JsonKey(name: 'category3') @Default('') String category3,
    @JsonKey(name: 'category4') @Default('') String category4,
  }) = _NaverShopItemDto;

  factory NaverShopItemDto.fromJson(Map<String, dynamic> json) =>
      _$NaverShopItemDtoFromJson(json);

  Product toDomain() {
    final categories = <String>[
      category1,
      category2,
      category3,
      category4,
    ].where((category) => category.trim().isNotEmpty).toList(growable: false);
    final cleanedTitle = HtmlUtils.stripHtml(title);

    return Product(
      id: '${cleanedTitle.hashCode}-${link.hashCode}',
      name: cleanedTitle,
      categories: categories,
      link: link,
      mallName: mallName,
    );
  }
}
