import 'package:bab_alomda_assessment/features/stories/data/model/story_model.dart';
import 'package:bab_alomda_assessment/features/stories/data/repositories/new_york_times_stories_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/enums/enums.dart';
import '../../../core/utils/utils.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  final NewYorkTimesStoriesRepository _storyRepo;
  static StoryCubit get(BuildContext context) => BlocProvider.of(context);
  StoryCubit(this._storyRepo) : super(StoryInitialState());
  List<StoryModel> stories = [];
  List<StoryModel> searchedStories = [];
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  bool inSearchMode = false;
  List<StoryModel> get viewStories => inSearchMode ? searchedStories : stories;
  StoryDisplayStatus storyDisplayStatus = StoryDisplayStatus.list;
  StoryDisplayStatus get viewStoryDisplayStatus => storyDisplayStatus;

  Future<void> getTopStories() async {
    emit(StoryLoadingState());
    final result = await _storyRepo.getTopStories();
    result.fold((failure) {
      Utils.showToast(failure.message);
      emit(StoryErrorState(failure.message));
    }, (fetchedStories) {
      stories = fetchedStories;
      emit(StorySuccessState());
    });
  }

  Future<void> getFilterStories(String section) async {
    emit(StoryLoadingState());

    final result = await _storyRepo.getFilterStories(section);
    result.fold((failure) {
      Utils.showToast(failure.message);
      emit(StoryErrorState(failure.message));
    }, (fetchedStories) {
      stories = fetchedStories;
      emit(StorySuccessState());
    });
  }

  void changeStoriesDisplayStatus(StoryDisplayStatus newValue) {
    storyDisplayStatus = newValue;
    emit(ChangeStoryDisplayState());
  }

  void searchStories() {
    if (searchController.text.trim().isNotEmpty) {
      startSearching();
    } else {
      stopSearching();
    }
  }

  void startSearching() {
    final searchText = searchController.text.trim();

    searchedStories = stories
        .where((story) =>
            story.title.toLowerCase().contains(searchText) ||
            story.author.toLowerCase().contains(searchText))
        .toList();
    inSearchMode = true;
    emit(StartSearchState());
  }

  void stopSearching() {
    searchFocusNode.unfocus();
    inSearchMode = false;
    emit(FinishSearchState());
  }

  void onRefreshScreen() {
    searchController.clear();
    startSearching();
  }
}
