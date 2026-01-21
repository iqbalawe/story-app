part of 'story_detail_bloc.dart';

@freezed
abstract class StoryDetailEvent with _$StoryDetailEvent {
  const factory StoryDetailEvent.fetchStoryDetail(String id) =
      _FetchStoryDetail;
}
