part of 'add_story_bloc.dart';

sealed class AddStoryEvent extends Equatable {
  const AddStoryEvent();

  @override
  List<Object> get props => [];
}

class UploadStory extends AddStoryEvent {
  const UploadStory({
    required this.file,
    required this.description,
    this.lat,
    this.lon,
  });

  final File file;
  final String description;
  final double? lat;
  final double? lon;

  @override
  List<Object> get props => [file, description, lat!, lon!];
}
