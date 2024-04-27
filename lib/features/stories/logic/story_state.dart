part of 'story_cubit.dart';

@immutable
abstract class StoryState {}

class StoryInitialState extends StoryState {}

class StoryLoadingState extends StoryState {}

class StorySuccessState extends StoryState {}

class StoryErrorState extends StoryState {
  final String message;

  StoryErrorState(this.message);
}

class ChangeStoryDisplayState extends StoryState {}

class StartSearchState extends StoryState {}

class FinishSearchState extends StoryState {}
