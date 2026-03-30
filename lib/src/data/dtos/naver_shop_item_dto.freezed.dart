// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'naver_shop_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NaverShopItemDto {

 String get title; String get link; String get mallName;@JsonKey(name: 'category1') String get category1;@JsonKey(name: 'category2') String get category2;@JsonKey(name: 'category3') String get category3;@JsonKey(name: 'category4') String get category4;
/// Create a copy of NaverShopItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NaverShopItemDtoCopyWith<NaverShopItemDto> get copyWith => _$NaverShopItemDtoCopyWithImpl<NaverShopItemDto>(this as NaverShopItemDto, _$identity);

  /// Serializes this NaverShopItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NaverShopItemDto&&(identical(other.title, title) || other.title == title)&&(identical(other.link, link) || other.link == link)&&(identical(other.mallName, mallName) || other.mallName == mallName)&&(identical(other.category1, category1) || other.category1 == category1)&&(identical(other.category2, category2) || other.category2 == category2)&&(identical(other.category3, category3) || other.category3 == category3)&&(identical(other.category4, category4) || other.category4 == category4));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,link,mallName,category1,category2,category3,category4);

@override
String toString() {
  return 'NaverShopItemDto(title: $title, link: $link, mallName: $mallName, category1: $category1, category2: $category2, category3: $category3, category4: $category4)';
}


}

/// @nodoc
abstract mixin class $NaverShopItemDtoCopyWith<$Res>  {
  factory $NaverShopItemDtoCopyWith(NaverShopItemDto value, $Res Function(NaverShopItemDto) _then) = _$NaverShopItemDtoCopyWithImpl;
@useResult
$Res call({
 String title, String link, String mallName,@JsonKey(name: 'category1') String category1,@JsonKey(name: 'category2') String category2,@JsonKey(name: 'category3') String category3,@JsonKey(name: 'category4') String category4
});




}
/// @nodoc
class _$NaverShopItemDtoCopyWithImpl<$Res>
    implements $NaverShopItemDtoCopyWith<$Res> {
  _$NaverShopItemDtoCopyWithImpl(this._self, this._then);

  final NaverShopItemDto _self;
  final $Res Function(NaverShopItemDto) _then;

/// Create a copy of NaverShopItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? link = null,Object? mallName = null,Object? category1 = null,Object? category2 = null,Object? category3 = null,Object? category4 = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,mallName: null == mallName ? _self.mallName : mallName // ignore: cast_nullable_to_non_nullable
as String,category1: null == category1 ? _self.category1 : category1 // ignore: cast_nullable_to_non_nullable
as String,category2: null == category2 ? _self.category2 : category2 // ignore: cast_nullable_to_non_nullable
as String,category3: null == category3 ? _self.category3 : category3 // ignore: cast_nullable_to_non_nullable
as String,category4: null == category4 ? _self.category4 : category4 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NaverShopItemDto].
extension NaverShopItemDtoPatterns on NaverShopItemDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NaverShopItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NaverShopItemDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NaverShopItemDto value)  $default,){
final _that = this;
switch (_that) {
case _NaverShopItemDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NaverShopItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _NaverShopItemDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String link,  String mallName, @JsonKey(name: 'category1')  String category1, @JsonKey(name: 'category2')  String category2, @JsonKey(name: 'category3')  String category3, @JsonKey(name: 'category4')  String category4)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NaverShopItemDto() when $default != null:
return $default(_that.title,_that.link,_that.mallName,_that.category1,_that.category2,_that.category3,_that.category4);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String link,  String mallName, @JsonKey(name: 'category1')  String category1, @JsonKey(name: 'category2')  String category2, @JsonKey(name: 'category3')  String category3, @JsonKey(name: 'category4')  String category4)  $default,) {final _that = this;
switch (_that) {
case _NaverShopItemDto():
return $default(_that.title,_that.link,_that.mallName,_that.category1,_that.category2,_that.category3,_that.category4);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String link,  String mallName, @JsonKey(name: 'category1')  String category1, @JsonKey(name: 'category2')  String category2, @JsonKey(name: 'category3')  String category3, @JsonKey(name: 'category4')  String category4)?  $default,) {final _that = this;
switch (_that) {
case _NaverShopItemDto() when $default != null:
return $default(_that.title,_that.link,_that.mallName,_that.category1,_that.category2,_that.category3,_that.category4);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NaverShopItemDto extends NaverShopItemDto {
  const _NaverShopItemDto({this.title = '', this.link = '', this.mallName = '', @JsonKey(name: 'category1') this.category1 = '', @JsonKey(name: 'category2') this.category2 = '', @JsonKey(name: 'category3') this.category3 = '', @JsonKey(name: 'category4') this.category4 = ''}): super._();
  factory _NaverShopItemDto.fromJson(Map<String, dynamic> json) => _$NaverShopItemDtoFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String link;
@override@JsonKey() final  String mallName;
@override@JsonKey(name: 'category1') final  String category1;
@override@JsonKey(name: 'category2') final  String category2;
@override@JsonKey(name: 'category3') final  String category3;
@override@JsonKey(name: 'category4') final  String category4;

/// Create a copy of NaverShopItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NaverShopItemDtoCopyWith<_NaverShopItemDto> get copyWith => __$NaverShopItemDtoCopyWithImpl<_NaverShopItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NaverShopItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NaverShopItemDto&&(identical(other.title, title) || other.title == title)&&(identical(other.link, link) || other.link == link)&&(identical(other.mallName, mallName) || other.mallName == mallName)&&(identical(other.category1, category1) || other.category1 == category1)&&(identical(other.category2, category2) || other.category2 == category2)&&(identical(other.category3, category3) || other.category3 == category3)&&(identical(other.category4, category4) || other.category4 == category4));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,link,mallName,category1,category2,category3,category4);

@override
String toString() {
  return 'NaverShopItemDto(title: $title, link: $link, mallName: $mallName, category1: $category1, category2: $category2, category3: $category3, category4: $category4)';
}


}

/// @nodoc
abstract mixin class _$NaverShopItemDtoCopyWith<$Res> implements $NaverShopItemDtoCopyWith<$Res> {
  factory _$NaverShopItemDtoCopyWith(_NaverShopItemDto value, $Res Function(_NaverShopItemDto) _then) = __$NaverShopItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, String link, String mallName,@JsonKey(name: 'category1') String category1,@JsonKey(name: 'category2') String category2,@JsonKey(name: 'category3') String category3,@JsonKey(name: 'category4') String category4
});




}
/// @nodoc
class __$NaverShopItemDtoCopyWithImpl<$Res>
    implements _$NaverShopItemDtoCopyWith<$Res> {
  __$NaverShopItemDtoCopyWithImpl(this._self, this._then);

  final _NaverShopItemDto _self;
  final $Res Function(_NaverShopItemDto) _then;

/// Create a copy of NaverShopItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? link = null,Object? mallName = null,Object? category1 = null,Object? category2 = null,Object? category3 = null,Object? category4 = null,}) {
  return _then(_NaverShopItemDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,mallName: null == mallName ? _self.mallName : mallName // ignore: cast_nullable_to_non_nullable
as String,category1: null == category1 ? _self.category1 : category1 // ignore: cast_nullable_to_non_nullable
as String,category2: null == category2 ? _self.category2 : category2 // ignore: cast_nullable_to_non_nullable
as String,category3: null == category3 ? _self.category3 : category3 // ignore: cast_nullable_to_non_nullable
as String,category4: null == category4 ? _self.category4 : category4 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
