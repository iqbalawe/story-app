import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/src/features/story/domain/entities/story.dart';
import 'package:story_app/src/features/story/domain/repositories/story_repository.dart';

part 'story_detail_event.dart';
part 'story_detail_state.dart';

class StoryDetailBloc extends Bloc<StoryDetailEvent, StoryDetailState> {
  StoryDetailBloc(this.repository) : super(StoryDetailInitial()) {
    on<FetchStoryDetail>((event, emit) async {
      emit(StoryDetailLoading());
      try {
        final story = await repository.getStoryDetail(event.id);
        emit(StoryDetailLoaded(story));
      } catch (e) {
        emit(StoryDetailFailure(e.toString().replaceAll('Exception: ', '')));
      }
    });
  }

  final StoryRepository repository;
}
