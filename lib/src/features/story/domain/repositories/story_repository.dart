import 'dart:io';

import 'package:story_app/src/features/story/domain/entities/story.dart';

abstract class StoryRepository {
  Future<List<Story>> getStories({
    int page = 1,
    int size = 10,
    int location = 0,
  });
  Future<Story> getStoryDetail(String id);
  Future<String> addStory(
    File file,
    String description, {
    double? lat,
    double? lon,
  });
}
