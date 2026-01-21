import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/features/story/data/data.dart';

part 'story_response_model.freezed.dart';
part 'story_response_model.g.dart';

@freezed
abstract class StoryResponseModel with _$StoryResponseModel {
  const factory StoryResponseModel({
    required bool error,
    required String message,
    required List<StoryModel> listStory,
  }) = _StoryResponseModel;

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseModelFromJson(json);
}
