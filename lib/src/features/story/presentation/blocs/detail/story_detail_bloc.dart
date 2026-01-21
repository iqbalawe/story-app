import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/features/story/domain/domain.dart';

part 'story_detail_bloc.freezed.dart';
part 'story_detail_event.dart';
part 'story_detail_state.dart';

class StoryDetailBloc extends Bloc<StoryDetailEvent, StoryDetailState> {
  StoryDetailBloc(this.repository) : super(const StoryDetailState.initial()) {
    on<_FetchStoryDetail>((event, emit) async {
      emit(const StoryDetailState.loading());

      try {
        final story = await repository.getStoryDetail(event.id);
        emit(StoryDetailState.loaded(story));
      } catch (e) {
        final errorMessage = e.toString().replaceAll('Exception: ', '');
        emit(StoryDetailState.failure(errorMessage));
      }
    });
  }

  final StoryRepository repository;
}
