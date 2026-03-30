// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_genie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewGenieState {

 String get query; List<String> get recentQueries; List<Product> get searchResults; Product? get selectedProduct; int get starRating; ReviewPlatform get platform; GeneratedReview? get generatedReview; bool get isSearching; bool get isGenerating; String? get searchError; String? get generationError;
/// Create a copy of ReviewGenieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewGenieStateCopyWith<ReviewGenieState> get copyWith => _$ReviewGenieStateCopyWithImpl<ReviewGenieState>(this as ReviewGenieState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewGenieState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.recentQueries, recentQueries)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.starRating, starRating) || other.starRating == starRating)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.generatedReview, generatedReview) || other.generatedReview == generatedReview)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.searchError, searchError) || other.searchError == searchError)&&(identical(other.generationError, generationError) || other.generationError == generationError));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(recentQueries),const DeepCollectionEquality().hash(searchResults),selectedProduct,starRating,platform,generatedReview,isSearching,isGenerating,searchError,generationError);

@override
String toString() {
  return 'ReviewGenieState(query: $query, recentQueries: $recentQueries, searchResults: $searchResults, selectedProduct: $selectedProduct, starRating: $starRating, platform: $platform, generatedReview: $generatedReview, isSearching: $isSearching, isGenerating: $isGenerating, searchError: $searchError, generationError: $generationError)';
}


}

/// @nodoc
abstract mixin class $ReviewGenieStateCopyWith<$Res>  {
  factory $ReviewGenieStateCopyWith(ReviewGenieState value, $Res Function(ReviewGenieState) _then) = _$ReviewGenieStateCopyWithImpl;
@useResult
$Res call({
 String query, List<String> recentQueries, List<Product> searchResults, Product? selectedProduct, int starRating, ReviewPlatform platform, GeneratedReview? generatedReview, bool isSearching, bool isGenerating, String? searchError, String? generationError
});


$ProductCopyWith<$Res>? get selectedProduct;$GeneratedReviewCopyWith<$Res>? get generatedReview;

}
/// @nodoc
class _$ReviewGenieStateCopyWithImpl<$Res>
    implements $ReviewGenieStateCopyWith<$Res> {
  _$ReviewGenieStateCopyWithImpl(this._self, this._then);

  final ReviewGenieState _self;
  final $Res Function(ReviewGenieState) _then;

/// Create a copy of ReviewGenieState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? recentQueries = null,Object? searchResults = null,Object? selectedProduct = freezed,Object? starRating = null,Object? platform = null,Object? generatedReview = freezed,Object? isSearching = null,Object? isGenerating = null,Object? searchError = freezed,Object? generationError = freezed,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,recentQueries: null == recentQueries ? _self.recentQueries : recentQueries // ignore: cast_nullable_to_non_nullable
as List<String>,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<Product>,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as Product?,starRating: null == starRating ? _self.starRating : starRating // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as ReviewPlatform,generatedReview: freezed == generatedReview ? _self.generatedReview : generatedReview // ignore: cast_nullable_to_non_nullable
as GeneratedReview?,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,searchError: freezed == searchError ? _self.searchError : searchError // ignore: cast_nullable_to_non_nullable
as String?,generationError: freezed == generationError ? _self.generationError : generationError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReviewGenieState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get selectedProduct {
    if (_self.selectedProduct == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.selectedProduct!, (value) {
    return _then(_self.copyWith(selectedProduct: value));
  });
}/// Create a copy of ReviewGenieState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneratedReviewCopyWith<$Res>? get generatedReview {
    if (_self.generatedReview == null) {
    return null;
  }

  return $GeneratedReviewCopyWith<$Res>(_self.generatedReview!, (value) {
    return _then(_self.copyWith(generatedReview: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewGenieState].
extension ReviewGenieStatePatterns on ReviewGenieState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewGenieState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewGenieState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewGenieState value)  $default,){
final _that = this;
switch (_that) {
case _ReviewGenieState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewGenieState value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewGenieState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  List<String> recentQueries,  List<Product> searchResults,  Product? selectedProduct,  int starRating,  ReviewPlatform platform,  GeneratedReview? generatedReview,  bool isSearching,  bool isGenerating,  String? searchError,  String? generationError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewGenieState() when $default != null:
return $default(_that.query,_that.recentQueries,_that.searchResults,_that.selectedProduct,_that.starRating,_that.platform,_that.generatedReview,_that.isSearching,_that.isGenerating,_that.searchError,_that.generationError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  List<String> recentQueries,  List<Product> searchResults,  Product? selectedProduct,  int starRating,  ReviewPlatform platform,  GeneratedReview? generatedReview,  bool isSearching,  bool isGenerating,  String? searchError,  String? generationError)  $default,) {final _that = this;
switch (_that) {
case _ReviewGenieState():
return $default(_that.query,_that.recentQueries,_that.searchResults,_that.selectedProduct,_that.starRating,_that.platform,_that.generatedReview,_that.isSearching,_that.isGenerating,_that.searchError,_that.generationError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  List<String> recentQueries,  List<Product> searchResults,  Product? selectedProduct,  int starRating,  ReviewPlatform platform,  GeneratedReview? generatedReview,  bool isSearching,  bool isGenerating,  String? searchError,  String? generationError)?  $default,) {final _that = this;
switch (_that) {
case _ReviewGenieState() when $default != null:
return $default(_that.query,_that.recentQueries,_that.searchResults,_that.selectedProduct,_that.starRating,_that.platform,_that.generatedReview,_that.isSearching,_that.isGenerating,_that.searchError,_that.generationError);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewGenieState extends ReviewGenieState {
  const _ReviewGenieState({this.query = '', final  List<String> recentQueries = const <String>[], final  List<Product> searchResults = const <Product>[], this.selectedProduct, this.starRating = 5, this.platform = ReviewPlatform.naverReceipt, this.generatedReview, this.isSearching = false, this.isGenerating = false, this.searchError, this.generationError}): _recentQueries = recentQueries,_searchResults = searchResults,super._();
  

@override@JsonKey() final  String query;
 final  List<String> _recentQueries;
@override@JsonKey() List<String> get recentQueries {
  if (_recentQueries is EqualUnmodifiableListView) return _recentQueries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentQueries);
}

 final  List<Product> _searchResults;
@override@JsonKey() List<Product> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override final  Product? selectedProduct;
@override@JsonKey() final  int starRating;
@override@JsonKey() final  ReviewPlatform platform;
@override final  GeneratedReview? generatedReview;
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  bool isGenerating;
@override final  String? searchError;
@override final  String? generationError;

/// Create a copy of ReviewGenieState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewGenieStateCopyWith<_ReviewGenieState> get copyWith => __$ReviewGenieStateCopyWithImpl<_ReviewGenieState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewGenieState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._recentQueries, _recentQueries)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.starRating, starRating) || other.starRating == starRating)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.generatedReview, generatedReview) || other.generatedReview == generatedReview)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.searchError, searchError) || other.searchError == searchError)&&(identical(other.generationError, generationError) || other.generationError == generationError));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_recentQueries),const DeepCollectionEquality().hash(_searchResults),selectedProduct,starRating,platform,generatedReview,isSearching,isGenerating,searchError,generationError);

@override
String toString() {
  return 'ReviewGenieState(query: $query, recentQueries: $recentQueries, searchResults: $searchResults, selectedProduct: $selectedProduct, starRating: $starRating, platform: $platform, generatedReview: $generatedReview, isSearching: $isSearching, isGenerating: $isGenerating, searchError: $searchError, generationError: $generationError)';
}


}

/// @nodoc
abstract mixin class _$ReviewGenieStateCopyWith<$Res> implements $ReviewGenieStateCopyWith<$Res> {
  factory _$ReviewGenieStateCopyWith(_ReviewGenieState value, $Res Function(_ReviewGenieState) _then) = __$ReviewGenieStateCopyWithImpl;
@override @useResult
$Res call({
 String query, List<String> recentQueries, List<Product> searchResults, Product? selectedProduct, int starRating, ReviewPlatform platform, GeneratedReview? generatedReview, bool isSearching, bool isGenerating, String? searchError, String? generationError
});


@override $ProductCopyWith<$Res>? get selectedProduct;@override $GeneratedReviewCopyWith<$Res>? get generatedReview;

}
/// @nodoc
class __$ReviewGenieStateCopyWithImpl<$Res>
    implements _$ReviewGenieStateCopyWith<$Res> {
  __$ReviewGenieStateCopyWithImpl(this._self, this._then);

  final _ReviewGenieState _self;
  final $Res Function(_ReviewGenieState) _then;

/// Create a copy of ReviewGenieState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? recentQueries = null,Object? searchResults = null,Object? selectedProduct = freezed,Object? starRating = null,Object? platform = null,Object? generatedReview = freezed,Object? isSearching = null,Object? isGenerating = null,Object? searchError = freezed,Object? generationError = freezed,}) {
  return _then(_ReviewGenieState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,recentQueries: null == recentQueries ? _self._recentQueries : recentQueries // ignore: cast_nullable_to_non_nullable
as List<String>,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<Product>,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as Product?,starRating: null == starRating ? _self.starRating : starRating // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as ReviewPlatform,generatedReview: freezed == generatedReview ? _self.generatedReview : generatedReview // ignore: cast_nullable_to_non_nullable
as GeneratedReview?,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,searchError: freezed == searchError ? _self.searchError : searchError // ignore: cast_nullable_to_non_nullable
as String?,generationError: freezed == generationError ? _self.generationError : generationError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReviewGenieState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get selectedProduct {
    if (_self.selectedProduct == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.selectedProduct!, (value) {
    return _then(_self.copyWith(selectedProduct: value));
  });
}/// Create a copy of ReviewGenieState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneratedReviewCopyWith<$Res>? get generatedReview {
    if (_self.generatedReview == null) {
    return null;
  }

  return $GeneratedReviewCopyWith<$Res>(_self.generatedReview!, (value) {
    return _then(_self.copyWith(generatedReview: value));
  });
}
}

// dart format on
