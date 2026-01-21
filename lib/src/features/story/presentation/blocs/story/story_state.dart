part of 'story_bloc.dart';

enum StoryStatus { initial, success, failure }

@freezed
abstract class StoryState with _$StoryState {
  const factory StoryState({
    @Default(StoryStatus.initial) StoryStatus status,
    @Default([]) List<Story> stories,
    @Default(false) bool hasReachedMax,
    @Default('') String errorMessage,
    @Default(1) int page,
  }) = _StoryState;
}
