part of 'story_detail_bloc.dart';

@freezed
class StoryDetailState with _$StoryDetailState {
  const factory StoryDetailState.initial() = _Initial;
  const factory StoryDetailState.loading() = _Loading;
  const factory StoryDetailState.loaded(Story story) = _Loaded;
  const factory StoryDetailState.failure(String message) = _Failure;
}
