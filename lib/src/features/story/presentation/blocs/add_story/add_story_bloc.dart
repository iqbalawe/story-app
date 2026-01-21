import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/src/features/story/domain/domain.dart';

part 'add_story_event.dart';
part 'add_story_state.dart';

class AddStoryBloc extends Bloc<AddStoryEvent, AddStoryState> {
  AddStoryBloc(this.repository) : super(AddStoryInitial()) {
    on<UploadStory>((event, emit) async {
      emit(AddStoryLoading());
      try {
        final message = await repository.addStory(
          event.file,
          event.description,
          lat: event.lat,
          lon: event.lon,
        );
        emit(AddStorySuccess(message));
      } catch (e) {
        emit(AddStoryFailure(e.toString().replaceAll('Exception: ', '')));
      }
    });
  }

  final StoryRepository repository;
}
