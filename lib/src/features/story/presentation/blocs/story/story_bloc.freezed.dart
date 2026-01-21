// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryEvent()';
}


}

/// @nodoc
class $StoryEventCopyWith<$Res>  {
$StoryEventCopyWith(StoryEvent _, $Res Function(StoryEvent) __);
}


/// Adds pattern-matching-related methods to [StoryEvent].
extension StoryEventPatterns on StoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchStories value)?  fetchStories,TResult Function( _RefreshStories value)?  refreshStories,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchStories() when fetchStories != null:
return fetchStories(_that);case _RefreshStories() when refreshStories != null:
return refreshStories(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchStories value)  fetchStories,required TResult Function( _RefreshStories value)  refreshStories,}){
final _that = this;
switch (_that) {
case _FetchStories():
return fetchStories(_that);case _RefreshStories():
return refreshStories(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchStories value)?  fetchStories,TResult? Function( _RefreshStories value)?  refreshStories,}){
final _that = this;
switch (_that) {
case _FetchStories() when fetchStories != null:
return fetchStories(_that);case _RefreshStories() when refreshStories != null:
return refreshStories(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchStories,TResult Function()?  refreshStories,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchStories() when fetchStories != null:
return fetchStories();case _RefreshStories() when refreshStories != null:
return refreshStories();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchStories,required TResult Function()  refreshStories,}) {final _that = this;
switch (_that) {
case _FetchStories():
return fetchStories();case _RefreshStories():
return refreshStories();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchStories,TResult? Function()?  refreshStories,}) {final _that = this;
switch (_that) {
case _FetchStories() when fetchStories != null:
return fetchStories();case _RefreshStories() when refreshStories != null:
return refreshStories();case _:
  return null;

}
}

}

/// @nodoc


class _FetchStories implements StoryEvent {
  const _FetchStories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchStories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryEvent.fetchStories()';
}


}




/// @nodoc


class _RefreshStories implements StoryEvent {
  const _RefreshStories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshStories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryEvent.refreshStories()';
}


}




/// @nodoc
mixin _$StoryState {

 StoryStatus get status; List<Story> get stories; bool get hasReachedMax; String get errorMessage; int get page;
/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryStateCopyWith<StoryState> get copyWith => _$StoryStateCopyWithImpl<StoryState>(this as StoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.stories, stories)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(stories),hasReachedMax,errorMessage,page);

@override
String toString() {
  return 'StoryState(status: $status, stories: $stories, hasReachedMax: $hasReachedMax, errorMessage: $errorMessage, page: $page)';
}


}

/// @nodoc
abstract mixin class $StoryStateCopyWith<$Res>  {
  factory $StoryStateCopyWith(StoryState value, $Res Function(StoryState) _then) = _$StoryStateCopyWithImpl;
@useResult
$Res call({
 StoryStatus status, List<Story> stories, bool hasReachedMax, String errorMessage, int page
});




}
/// @nodoc
class _$StoryStateCopyWithImpl<$Res>
    implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._self, this._then);

  final StoryState _self;
  final $Res Function(StoryState) _then;

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? stories = null,Object? hasReachedMax = null,Object? errorMessage = null,Object? page = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoryStatus,stories: null == stories ? _self.stories : stories // ignore: cast_nullable_to_non_nullable
as List<Story>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryState].
extension StoryStatePatterns on StoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryState value)  $default,){
final _that = this;
switch (_that) {
case _StoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryState value)?  $default,){
final _that = this;
switch (_that) {
case _StoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoryStatus status,  List<Story> stories,  bool hasReachedMax,  String errorMessage,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryState() when $default != null:
return $default(_that.status,_that.stories,_that.hasReachedMax,_that.errorMessage,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoryStatus status,  List<Story> stories,  bool hasReachedMax,  String errorMessage,  int page)  $default,) {final _that = this;
switch (_that) {
case _StoryState():
return $default(_that.status,_that.stories,_that.hasReachedMax,_that.errorMessage,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoryStatus status,  List<Story> stories,  bool hasReachedMax,  String errorMessage,  int page)?  $default,) {final _that = this;
switch (_that) {
case _StoryState() when $default != null:
return $default(_that.status,_that.stories,_that.hasReachedMax,_that.errorMessage,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _StoryState implements StoryState {
  const _StoryState({this.status = StoryStatus.initial, final  List<Story> stories = const [], this.hasReachedMax = false, this.errorMessage = '', this.page = 1}): _stories = stories;
  

@override@JsonKey() final  StoryStatus status;
 final  List<Story> _stories;
@override@JsonKey() List<Story> get stories {
  if (_stories is EqualUnmodifiableListView) return _stories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stories);
}

@override@JsonKey() final  bool hasReachedMax;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  int page;

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryStateCopyWith<_StoryState> get copyWith => __$StoryStateCopyWithImpl<_StoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._stories, _stories)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_stories),hasReachedMax,errorMessage,page);

@override
String toString() {
  return 'StoryState(status: $status, stories: $stories, hasReachedMax: $hasReachedMax, errorMessage: $errorMessage, page: $page)';
}


}

/// @nodoc
abstract mixin class _$StoryStateCopyWith<$Res> implements $StoryStateCopyWith<$Res> {
  factory _$StoryStateCopyWith(_StoryState value, $Res Function(_StoryState) _then) = __$StoryStateCopyWithImpl;
@override @useResult
$Res call({
 StoryStatus status, List<Story> stories, bool hasReachedMax, String errorMessage, int page
});




}
/// @nodoc
class __$StoryStateCopyWithImpl<$Res>
    implements _$StoryStateCopyWith<$Res> {
  __$StoryStateCopyWithImpl(this._self, this._then);

  final _StoryState _self;
  final $Res Function(_StoryState) _then;

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? stories = null,Object? hasReachedMax = null,Object? errorMessage = null,Object? page = null,}) {
  return _then(_StoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoryStatus,stories: null == stories ? _self._stories : stories // ignore: cast_nullable_to_non_nullable
as List<Story>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
