part of 'add_story_bloc.dart';

@freezed
class AddStoryState with _$AddStoryState {
  const factory AddStoryState.initial() = _Initial;
  const factory AddStoryState.loading() = _Loading;
  const factory AddStoryState.success(String message) = _Success;
  const factory AddStoryState.failure(String message) = _Failure;
}
