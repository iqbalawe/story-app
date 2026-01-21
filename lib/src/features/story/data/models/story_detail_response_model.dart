import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/features/story/data/models/story_model.dart';

part 'story_detail_response_model.freezed.dart';
part 'story_detail_response_model.g.dart';

@freezed
abstract class StoryDetailResponseModel with _$StoryDetailResponseModel {
  const factory StoryDetailResponseModel({
    required bool error,
    required String message,
    required StoryModel story,
  }) = _StoryDetailResponseModel;

  factory StoryDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailResponseModelFromJson(json);
}
