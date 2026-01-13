import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/src/features/story/domain/entities/story.dart';
import 'package:story_app/src/features/story/domain/repositories/story_repository.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryBloc({required this.storyRepository}) : super(StoryInitial()) {
    on<FetchStories>((event, emit) async {
      emit(StoryLoading());
      try {
        final stories = await storyRepository.getStories();
        emit(StoryLoaded(stories));
      } catch (e) {
        emit(StoryError(e.toString().replaceAll('Exception: ', '')));
      }
    });
  }

  final StoryRepository storyRepository;
}
