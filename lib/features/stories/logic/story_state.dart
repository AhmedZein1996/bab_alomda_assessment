part of 'story_cubit.dart';

@immutable
abstract class StoryState {}

class StoryInitialState extends StoryState {}

class StoryLoadingState extends StoryState {}

class StorySuccessState extends StoryState {}

class StoryErrorState extends StoryState {}
