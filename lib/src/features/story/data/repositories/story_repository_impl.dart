import 'dart:io';

import 'package:story_app/src/features/story/data/datasources/story_remote_datasource.dart';
import 'package:story_app/src/features/story/domain/entities/story.dart';
import 'package:story_app/src/features/story/domain/repositories/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  StoryRepositoryImpl({required this.remoteDatasource});

  final StoryRemoteDatasource remoteDatasource;

  @override
  Future<List<Story>> getStories() async {
    final storyModels = await remoteDatasource.getAllStories();

    return storyModels
        .map(
          (model) => Story(
            id: model.id,
            name: model.name,
            description: model.description,
            photoUrl: model.photoUrl,
            createdAt: model.createdAt,
          ),
        )
        .toList();
  }

  @override
  Future<Story> getStoryDetail(String id) async {
    final story = await remoteDatasource.getStoryDetail(id);

    return Story(
      id: story.id,
      name: story.name,
      description: story.description,
      photoUrl: story.photoUrl,
      createdAt: story.createdAt,
      lat: story.lat,
      lon: story.lon,
    );
  }

  @override
  Future<String> addStory(
    File file,
    String description,
    double? lat,
    double? lon,
  ) async {
    return await remoteDatasource.addStory(file, description, lat, lon);
  }
}
