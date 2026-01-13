import 'package:story_app/src/features/story/domain/entities/story.dart';

abstract class StoryRepository {
  Future<List<Story>> getStories();
  Future<Story> getStoryDetail(String id);
}
