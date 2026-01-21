part of 'story_bloc.dart';

enum StoryStatus { initial, success, failure }

class StoryState extends Equatable {
  const StoryState({
    this.status = StoryStatus.initial,
    this.stories = const <Story>[],
    this.hasReachedMax = false,
    this.errorMessage = '',
    this.page = 1,
  });

  final StoryStatus status;
  final List<Story> stories;
  final bool hasReachedMax;
  final String errorMessage;
  final int page;

  StoryState copyWith({
    StoryStatus? status,
    List<Story>? stories,
    bool? hasReachedMax,
    String? errorMessage,
    int? page,
  }) => StoryState(
    status: status ?? this.status,
    stories: stories ?? this.stories,
    hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    errorMessage: errorMessage ?? this.errorMessage,
    page: page ?? this.page,
  );

  @override
  List<Object> get props => [
    status,
    stories,
    hasReachedMax,
    errorMessage,
    page,
  ];
}
