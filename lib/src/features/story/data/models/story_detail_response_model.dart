import 'package:story_app/src/features/story/data/models/story_model.dart';

class StoryDetailResponseModel {
  StoryDetailResponseModel({
    required this.error,
    required this.message,
    required this.story,
  });

  final bool error;
  final String message;
  final StoryModel story;

  factory StoryDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      StoryDetailResponseModel(
        error: json['error'],
        message: json['message'],
        story: StoryModel.fromJson(json['story']),
      );
}
