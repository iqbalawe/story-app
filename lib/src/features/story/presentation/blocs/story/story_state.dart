part of 'story_bloc.dart';

sealed class StoryState extends Equatable {
  const StoryState();

  @override
  List<Object> get props => [];
}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StoryLoaded extends StoryState {
  const StoryLoaded(this.stories);

  final List<Story> stories;

  @override
  List<Object> get props => [stories];
}

final class StoryError extends StoryState {
  const StoryError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
