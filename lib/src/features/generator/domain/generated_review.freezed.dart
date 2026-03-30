// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generated_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneratedReview {

 String get content; String get prompt; int get starRating; ReviewPlatform get platform; DateTime get createdAt; ReviewGenerationSource get source;
/// Create a copy of GeneratedReview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratedReviewCopyWith<GeneratedReview> get copyWith => _$GeneratedReviewCopyWithImpl<GeneratedReview>(this as GeneratedReview, _$identity);

  /// Serializes this GeneratedReview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratedReview&&(identical(other.content, content) || other.content == content)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.starRating, starRating) || other.starRating == starRating)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,prompt,starRating,platform,createdAt,source);

@override
String toString() {
  return 'GeneratedReview(content: $content, prompt: $prompt, starRating: $starRating, platform: $platform, createdAt: $createdAt, source: $source)';
}


}

/// @nodoc
abstract mixin class $GeneratedReviewCopyWith<$Res>  {
  factory $GeneratedReviewCopyWith(GeneratedReview value, $Res Function(GeneratedReview) _then) = _$GeneratedReviewCopyWithImpl;
@useResult
$Res call({
 String content, String prompt, int starRating, ReviewPlatform platform, DateTime createdAt, ReviewGenerationSource source
});




}
/// @nodoc
class _$GeneratedReviewCopyWithImpl<$Res>
    implements $GeneratedReviewCopyWith<$Res> {
  _$GeneratedReviewCopyWithImpl(this._self, this._then);

  final GeneratedReview _self;
  final $Res Function(GeneratedReview) _then;

/// Create a copy of GeneratedReview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? prompt = null,Object? starRating = null,Object? platform = null,Object? createdAt = null,Object? source = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,starRating: null == starRating ? _self.starRating : starRating // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as ReviewPlatform,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ReviewGenerationSource,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneratedReview].
extension GeneratedReviewPatterns on GeneratedReview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneratedReview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneratedReview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneratedReview value)  $default,){
final _that = this;
switch (_that) {
case _GeneratedReview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneratedReview value)?  $default,){
final _that = this;
switch (_that) {
case _GeneratedReview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content,  String prompt,  int starRating,  ReviewPlatform platform,  DateTime createdAt,  ReviewGenerationSource source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneratedReview() when $default != null:
return $default(_that.content,_that.prompt,_that.starRating,_that.platform,_that.createdAt,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content,  String prompt,  int starRating,  ReviewPlatform platform,  DateTime createdAt,  ReviewGenerationSource source)  $default,) {final _that = this;
switch (_that) {
case _GeneratedReview():
return $default(_that.content,_that.prompt,_that.starRating,_that.platform,_that.createdAt,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content,  String prompt,  int starRating,  ReviewPlatform platform,  DateTime createdAt,  ReviewGenerationSource source)?  $default,) {final _that = this;
switch (_that) {
case _GeneratedReview() when $default != null:
return $default(_that.content,_that.prompt,_that.starRating,_that.platform,_that.createdAt,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneratedReview extends GeneratedReview {
  const _GeneratedReview({required this.content, required this.prompt, required this.starRating, required this.platform, required this.createdAt, this.source = ReviewGenerationSource.ai}): super._();
  factory _GeneratedReview.fromJson(Map<String, dynamic> json) => _$GeneratedReviewFromJson(json);

@override final  String content;
@override final  String prompt;
@override final  int starRating;
@override final  ReviewPlatform platform;
@override final  DateTime createdAt;
@override@JsonKey() final  ReviewGenerationSource source;

/// Create a copy of GeneratedReview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratedReviewCopyWith<_GeneratedReview> get copyWith => __$GeneratedReviewCopyWithImpl<_GeneratedReview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratedReviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratedReview&&(identical(other.content, content) || other.content == content)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.starRating, starRating) || other.starRating == starRating)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,prompt,starRating,platform,createdAt,source);

@override
String toString() {
  return 'GeneratedReview(content: $content, prompt: $prompt, starRating: $starRating, platform: $platform, createdAt: $createdAt, source: $source)';
}


}

/// @nodoc
abstract mixin class _$GeneratedReviewCopyWith<$Res> implements $GeneratedReviewCopyWith<$Res> {
  factory _$GeneratedReviewCopyWith(_GeneratedReview value, $Res Function(_GeneratedReview) _then) = __$GeneratedReviewCopyWithImpl;
@override @useResult
$Res call({
 String content, String prompt, int starRating, ReviewPlatform platform, DateTime createdAt, ReviewGenerationSource source
});




}
/// @nodoc
class __$GeneratedReviewCopyWithImpl<$Res>
    implements _$GeneratedReviewCopyWith<$Res> {
  __$GeneratedReviewCopyWithImpl(this._self, this._then);

  final _GeneratedReview _self;
  final $Res Function(_GeneratedReview) _then;

/// Create a copy of GeneratedReview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? prompt = null,Object? starRating = null,Object? platform = null,Object? createdAt = null,Object? source = null,}) {
  return _then(_GeneratedReview(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,starRating: null == starRating ? _self.starRating : starRating // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as ReviewPlatform,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ReviewGenerationSource,
  ));
}


}

// dart format on
