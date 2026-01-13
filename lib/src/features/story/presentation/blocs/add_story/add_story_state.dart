part of 'add_story_bloc.dart';

sealed class AddStoryState extends Equatable {
  const AddStoryState();

  @override
  List<Object> get props => [];
}

final class AddStoryInitial extends AddStoryState {}

final class AddStoryLoading extends AddStoryState {}

final class AddStorySuccess extends AddStoryState {
  final String message;
  const AddStorySuccess(this.message);
}

final class AddStoryFailure extends AddStoryState {
  final String message;
  const AddStoryFailure(this.message);
}
