part of 'add_story_bloc.dart';

@freezed
abstract class AddStoryEvent with _$AddStoryEvent {
  const factory AddStoryEvent.uploadStory({
    required File file,
    required String description,
    double? lat,
    double? lon,
  }) = _UploadStory;
}
