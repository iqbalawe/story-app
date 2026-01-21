import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/src/features/story/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';

part 'story_event.dart';
part 'story_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryBloc({required this.storyRepository}) : super(const StoryState()) {
    on<FetchStories>(
      _onFetchStories,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetchStories(
    FetchStories event,
    Emitter<StoryState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == StoryStatus.initial) {
        final stories = await storyRepository.getStories(page: 1, size: 10);
        return emit(
          state.copyWith(
            status: StoryStatus.success,
            stories: stories,
            hasReachedMax: false,
            page: 1,
          ),
        );
      }

      final nextPage = state.page + 1;
      final newStories = await storyRepository.getStories(
        page: nextPage,
        size: 10,
      );

      if (newStories.isEmpty) {
        emit(state.copyWith(hasReachedMax: true));
      } else {
        emit(
          state.copyWith(
            status: StoryStatus.success,
            stories: List.of(state.stories)..addAll(newStories),
            hasReachedMax: false,
            page: nextPage,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: StoryStatus.failure,
          errorMessage: e.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }

  final StoryRepository storyRepository;
}
