// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_detail_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoryDetailResponseModel {

 bool get error; String get message; StoryModel get story;
/// Create a copy of StoryDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryDetailResponseModelCopyWith<StoryDetailResponseModel> get copyWith => _$StoryDetailResponseModelCopyWithImpl<StoryDetailResponseModel>(this as StoryDetailResponseModel, _$identity);

  /// Serializes this StoryDetailResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDetailResponseModel&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.story, story) || other.story == story));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,story);

@override
String toString() {
  return 'StoryDetailResponseModel(error: $error, message: $message, story: $story)';
}


}

/// @nodoc
abstract mixin class $StoryDetailResponseModelCopyWith<$Res>  {
  factory $StoryDetailResponseModelCopyWith(StoryDetailResponseModel value, $Res Function(StoryDetailResponseModel) _then) = _$StoryDetailResponseModelCopyWithImpl;
@useResult
$Res call({
 bool error, String message, StoryModel story
});


$StoryModelCopyWith<$Res> get story;

}
/// @nodoc
class _$StoryDetailResponseModelCopyWithImpl<$Res>
    implements $StoryDetailResponseModelCopyWith<$Res> {
  _$StoryDetailResponseModelCopyWithImpl(this._self, this._then);

  final StoryDetailResponseModel _self;
  final $Res Function(StoryDetailResponseModel) _then;

/// Create a copy of StoryDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,Object? story = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as StoryModel,
  ));
}
/// Create a copy of StoryDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryModelCopyWith<$Res> get story {
  
  return $StoryModelCopyWith<$Res>(_self.story, (value) {
    return _then(_self.copyWith(story: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoryDetailResponseModel].
extension StoryDetailResponseModelPatterns on StoryDetailResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryDetailResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryDetailResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _StoryDetailResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryDetailResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoryDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String message,  StoryModel story)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryDetailResponseModel() when $default != null:
return $default(_that.error,_that.message,_that.story);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String message,  StoryModel story)  $default,) {final _that = this;
switch (_that) {
case _StoryDetailResponseModel():
return $default(_that.error,_that.message,_that.story);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String message,  StoryModel story)?  $default,) {final _that = this;
switch (_that) {
case _StoryDetailResponseModel() when $default != null:
return $default(_that.error,_that.message,_that.story);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoryDetailResponseModel implements StoryDetailResponseModel {
  const _StoryDetailResponseModel({required this.error, required this.message, required this.story});
  factory _StoryDetailResponseModel.fromJson(Map<String, dynamic> json) => _$StoryDetailResponseModelFromJson(json);

@override final  bool error;
@override final  String message;
@override final  StoryModel story;

/// Create a copy of StoryDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryDetailResponseModelCopyWith<_StoryDetailResponseModel> get copyWith => __$StoryDetailResponseModelCopyWithImpl<_StoryDetailResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryDetailResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryDetailResponseModel&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.story, story) || other.story == story));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,story);

@override
String toString() {
  return 'StoryDetailResponseModel(error: $error, message: $message, story: $story)';
}


}

/// @nodoc
abstract mixin class _$StoryDetailResponseModelCopyWith<$Res> implements $StoryDetailResponseModelCopyWith<$Res> {
  factory _$StoryDetailResponseModelCopyWith(_StoryDetailResponseModel value, $Res Function(_StoryDetailResponseModel) _then) = __$StoryDetailResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message, StoryModel story
});


@override $StoryModelCopyWith<$Res> get story;

}
/// @nodoc
class __$StoryDetailResponseModelCopyWithImpl<$Res>
    implements _$StoryDetailResponseModelCopyWith<$Res> {
  __$StoryDetailResponseModelCopyWithImpl(this._self, this._then);

  final _StoryDetailResponseModel _self;
  final $Res Function(_StoryDetailResponseModel) _then;

/// Create a copy of StoryDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,Object? story = null,}) {
  return _then(_StoryDetailResponseModel(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as StoryModel,
  ));
}

/// Create a copy of StoryDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryModelCopyWith<$Res> get story {
  
  return $StoryModelCopyWith<$Res>(_self.story, (value) {
    return _then(_self.copyWith(story: value));
  });
}
}

// dart format on
