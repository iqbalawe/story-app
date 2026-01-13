part of 'story_detail_bloc.dart';

sealed class StoryDetailState extends Equatable {
  const StoryDetailState();

  @override
  List<Object> get props => [];
}

final class StoryDetailInitial extends StoryDetailState {}

final class StoryDetailLoading extends StoryDetailState {}

final class StoryDetailLoaded extends StoryDetailState {
  const StoryDetailLoaded(this.story);

  final Story story;

  @override
  List<Object> get props => [story];
}

final class StoryDetailFailure extends StoryDetailState {
  const StoryDetailFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
