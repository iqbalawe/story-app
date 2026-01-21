import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/features/story/domain/domain.dart';

part 'add_story_event.dart';
part 'add_story_state.dart';
part 'add_story_bloc.freezed.dart';

class AddStoryBloc extends Bloc<AddStoryEvent, AddStoryState> {
  AddStoryBloc(this.repository) : super(const AddStoryState.initial()) {
    on<_UploadStory>((event, emit) async {
      emit(const AddStoryState.loading());

      try {
        final message = await repository.addStory(
          event.file,
          event.description,
          lat: event.lat,
          lon: event.lon,
        );
        emit(AddStoryState.success(message));
      } catch (e) {
        final errorMessage = e.toString().replaceAll('Exception: ', '');
        emit(AddStoryState.failure(errorMessage));
      }
    });
  }

  final StoryRepository repository;
}
