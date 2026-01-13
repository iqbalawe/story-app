part of 'story_detail_bloc.dart';

sealed class StoryDetailEvent extends Equatable {
  const StoryDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchStoryDetail extends StoryDetailEvent {
  const FetchStoryDetail(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
