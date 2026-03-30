// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_ai_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenAiResponseDto {

 List<OpenAiOutputDto> get output;
/// Create a copy of OpenAiResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenAiResponseDtoCopyWith<OpenAiResponseDto> get copyWith => _$OpenAiResponseDtoCopyWithImpl<OpenAiResponseDto>(this as OpenAiResponseDto, _$identity);

  /// Serializes this OpenAiResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenAiResponseDto&&const DeepCollectionEquality().equals(other.output, output));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(output));

@override
String toString() {
  return 'OpenAiResponseDto(output: $output)';
}


}

/// @nodoc
abstract mixin class $OpenAiResponseDtoCopyWith<$Res>  {
  factory $OpenAiResponseDtoCopyWith(OpenAiResponseDto value, $Res Function(OpenAiResponseDto) _then) = _$OpenAiResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<OpenAiOutputDto> output
});




}
/// @nodoc
class _$OpenAiResponseDtoCopyWithImpl<$Res>
    implements $OpenAiResponseDtoCopyWith<$Res> {
  _$OpenAiResponseDtoCopyWithImpl(this._self, this._then);

  final OpenAiResponseDto _self;
  final $Res Function(OpenAiResponseDto) _then;

/// Create a copy of OpenAiResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? output = null,}) {
  return _then(_self.copyWith(
output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as List<OpenAiOutputDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenAiResponseDto].
extension OpenAiResponseDtoPatterns on OpenAiResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenAiResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenAiResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenAiResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _OpenAiResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenAiResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _OpenAiResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OpenAiOutputDto> output)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenAiResponseDto() when $default != null:
return $default(_that.output);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OpenAiOutputDto> output)  $default,) {final _that = this;
switch (_that) {
case _OpenAiResponseDto():
return $default(_that.output);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OpenAiOutputDto> output)?  $default,) {final _that = this;
switch (_that) {
case _OpenAiResponseDto() when $default != null:
return $default(_that.output);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenAiResponseDto extends OpenAiResponseDto {
  const _OpenAiResponseDto({final  List<OpenAiOutputDto> output = const <OpenAiOutputDto>[]}): _output = output,super._();
  factory _OpenAiResponseDto.fromJson(Map<String, dynamic> json) => _$OpenAiResponseDtoFromJson(json);

 final  List<OpenAiOutputDto> _output;
@override@JsonKey() List<OpenAiOutputDto> get output {
  if (_output is EqualUnmodifiableListView) return _output;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_output);
}


/// Create a copy of OpenAiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenAiResponseDtoCopyWith<_OpenAiResponseDto> get copyWith => __$OpenAiResponseDtoCopyWithImpl<_OpenAiResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenAiResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAiResponseDto&&const DeepCollectionEquality().equals(other._output, _output));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_output));

@override
String toString() {
  return 'OpenAiResponseDto(output: $output)';
}


}

/// @nodoc
abstract mixin class _$OpenAiResponseDtoCopyWith<$Res> implements $OpenAiResponseDtoCopyWith<$Res> {
  factory _$OpenAiResponseDtoCopyWith(_OpenAiResponseDto value, $Res Function(_OpenAiResponseDto) _then) = __$OpenAiResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<OpenAiOutputDto> output
});




}
/// @nodoc
class __$OpenAiResponseDtoCopyWithImpl<$Res>
    implements _$OpenAiResponseDtoCopyWith<$Res> {
  __$OpenAiResponseDtoCopyWithImpl(this._self, this._then);

  final _OpenAiResponseDto _self;
  final $Res Function(_OpenAiResponseDto) _then;

/// Create a copy of OpenAiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? output = null,}) {
  return _then(_OpenAiResponseDto(
output: null == output ? _self._output : output // ignore: cast_nullable_to_non_nullable
as List<OpenAiOutputDto>,
  ));
}


}


/// @nodoc
mixin _$OpenAiOutputDto {

 String get type; List<OpenAiContentDto> get content;
/// Create a copy of OpenAiOutputDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenAiOutputDtoCopyWith<OpenAiOutputDto> get copyWith => _$OpenAiOutputDtoCopyWithImpl<OpenAiOutputDto>(this as OpenAiOutputDto, _$identity);

  /// Serializes this OpenAiOutputDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenAiOutputDto&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.content, content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'OpenAiOutputDto(type: $type, content: $content)';
}


}

/// @nodoc
abstract mixin class $OpenAiOutputDtoCopyWith<$Res>  {
  factory $OpenAiOutputDtoCopyWith(OpenAiOutputDto value, $Res Function(OpenAiOutputDto) _then) = _$OpenAiOutputDtoCopyWithImpl;
@useResult
$Res call({
 String type, List<OpenAiContentDto> content
});




}
/// @nodoc
class _$OpenAiOutputDtoCopyWithImpl<$Res>
    implements $OpenAiOutputDtoCopyWith<$Res> {
  _$OpenAiOutputDtoCopyWithImpl(this._self, this._then);

  final OpenAiOutputDto _self;
  final $Res Function(OpenAiOutputDto) _then;

/// Create a copy of OpenAiOutputDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? content = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<OpenAiContentDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenAiOutputDto].
extension OpenAiOutputDtoPatterns on OpenAiOutputDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenAiOutputDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenAiOutputDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenAiOutputDto value)  $default,){
final _that = this;
switch (_that) {
case _OpenAiOutputDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenAiOutputDto value)?  $default,){
final _that = this;
switch (_that) {
case _OpenAiOutputDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  List<OpenAiContentDto> content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenAiOutputDto() when $default != null:
return $default(_that.type,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  List<OpenAiContentDto> content)  $default,) {final _that = this;
switch (_that) {
case _OpenAiOutputDto():
return $default(_that.type,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  List<OpenAiContentDto> content)?  $default,) {final _that = this;
switch (_that) {
case _OpenAiOutputDto() when $default != null:
return $default(_that.type,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenAiOutputDto implements OpenAiOutputDto {
  const _OpenAiOutputDto({this.type = '', final  List<OpenAiContentDto> content = const <OpenAiContentDto>[]}): _content = content;
  factory _OpenAiOutputDto.fromJson(Map<String, dynamic> json) => _$OpenAiOutputDtoFromJson(json);

@override@JsonKey() final  String type;
 final  List<OpenAiContentDto> _content;
@override@JsonKey() List<OpenAiContentDto> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}


/// Create a copy of OpenAiOutputDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenAiOutputDtoCopyWith<_OpenAiOutputDto> get copyWith => __$OpenAiOutputDtoCopyWithImpl<_OpenAiOutputDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenAiOutputDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAiOutputDto&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._content, _content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_content));

@override
String toString() {
  return 'OpenAiOutputDto(type: $type, content: $content)';
}


}

/// @nodoc
abstract mixin class _$OpenAiOutputDtoCopyWith<$Res> implements $OpenAiOutputDtoCopyWith<$Res> {
  factory _$OpenAiOutputDtoCopyWith(_OpenAiOutputDto value, $Res Function(_OpenAiOutputDto) _then) = __$OpenAiOutputDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, List<OpenAiContentDto> content
});




}
/// @nodoc
class __$OpenAiOutputDtoCopyWithImpl<$Res>
    implements _$OpenAiOutputDtoCopyWith<$Res> {
  __$OpenAiOutputDtoCopyWithImpl(this._self, this._then);

  final _OpenAiOutputDto _self;
  final $Res Function(_OpenAiOutputDto) _then;

/// Create a copy of OpenAiOutputDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? content = null,}) {
  return _then(_OpenAiOutputDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<OpenAiContentDto>,
  ));
}


}


/// @nodoc
mixin _$OpenAiContentDto {

 String get type; String? get text;
/// Create a copy of OpenAiContentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenAiContentDtoCopyWith<OpenAiContentDto> get copyWith => _$OpenAiContentDtoCopyWithImpl<OpenAiContentDto>(this as OpenAiContentDto, _$identity);

  /// Serializes this OpenAiContentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenAiContentDto&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text);

@override
String toString() {
  return 'OpenAiContentDto(type: $type, text: $text)';
}


}

/// @nodoc
abstract mixin class $OpenAiContentDtoCopyWith<$Res>  {
  factory $OpenAiContentDtoCopyWith(OpenAiContentDto value, $Res Function(OpenAiContentDto) _then) = _$OpenAiContentDtoCopyWithImpl;
@useResult
$Res call({
 String type, String? text
});




}
/// @nodoc
class _$OpenAiContentDtoCopyWithImpl<$Res>
    implements $OpenAiContentDtoCopyWith<$Res> {
  _$OpenAiContentDtoCopyWithImpl(this._self, this._then);

  final OpenAiContentDto _self;
  final $Res Function(OpenAiContentDto) _then;

/// Create a copy of OpenAiContentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? text = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenAiContentDto].
extension OpenAiContentDtoPatterns on OpenAiContentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenAiContentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenAiContentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenAiContentDto value)  $default,){
final _that = this;
switch (_that) {
case _OpenAiContentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenAiContentDto value)?  $default,){
final _that = this;
switch (_that) {
case _OpenAiContentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenAiContentDto() when $default != null:
return $default(_that.type,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String? text)  $default,) {final _that = this;
switch (_that) {
case _OpenAiContentDto():
return $default(_that.type,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _OpenAiContentDto() when $default != null:
return $default(_that.type,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenAiContentDto implements OpenAiContentDto {
  const _OpenAiContentDto({this.type = '', this.text});
  factory _OpenAiContentDto.fromJson(Map<String, dynamic> json) => _$OpenAiContentDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String? text;

/// Create a copy of OpenAiContentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenAiContentDtoCopyWith<_OpenAiContentDto> get copyWith => __$OpenAiContentDtoCopyWithImpl<_OpenAiContentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenAiContentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAiContentDto&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text);

@override
String toString() {
  return 'OpenAiContentDto(type: $type, text: $text)';
}


}

/// @nodoc
abstract mixin class _$OpenAiContentDtoCopyWith<$Res> implements $OpenAiContentDtoCopyWith<$Res> {
  factory _$OpenAiContentDtoCopyWith(_OpenAiContentDto value, $Res Function(_OpenAiContentDto) _then) = __$OpenAiContentDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String? text
});




}
/// @nodoc
class __$OpenAiContentDtoCopyWithImpl<$Res>
    implements _$OpenAiContentDtoCopyWith<$Res> {
  __$OpenAiContentDtoCopyWithImpl(this._self, this._then);

  final _OpenAiContentDto _self;
  final $Res Function(_OpenAiContentDto) _then;

/// Create a copy of OpenAiContentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? text = freezed,}) {
  return _then(_OpenAiContentDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
