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
  SectionFilter? currentSearchFilter;

  Future<void> getTopStories() async {
    emit(StoryLoadingState());

    final result = await _storyRepo.getTopStories();
    result.fold((failure) {
      Utils.showToast(failure.message);
      emit(StoryErrorState());
    }, (fetchedStories) {
      stories.addAll(fetchedStories);
      emit(StorySuccessState());
    });
  }

  Future<void> getFilterStories(SectionFilter section) async {
    emit(StoryLoadingState());

    final result = await _storyRepo.getFilterStories(section.value);
    result.fold((failure) {
      Utils.showToast(failure.message);
      emit(StoryErrorState());
    }, (fetchedStories) {
      stories.addAll(fetchedStories);
      emit(StorySuccessState());
    });
  }

  // Future searchAthletes() async {
  //   searchFocusNode.unfocus();
  //   if (searchController.text.trim().isNotEmpty) {
  //     emit(HomeLoadingState());
  //     final searchText = searchController.text.trim();
  //     final result = await _homeRepo.searchAthletes(searchText);
  //     result.fold((l) {
  //       Utils.showToast(l.message);
  //       emit(HomeErrorState());
  //     }, (athletesResult) {
  //       searchedStories = athletesResult.toList();
  //       inSearchMode = true;
  //       emit(HomeSuccessState());
  //     });
  //   }
  // }
  //
  //
  // void onSearchFieldChanged(String text) {
  //   if (text.isEmpty) {
  //     inSearchMode = false;
  //     emit(HomeSuccessState());
  //     searchFocusNode.unfocus();
  //   }
  // }
  //
  //
  // void onSearchFilterChanged(SectionFilter searchFilter) {
  //   changeSearchFilter(searchFilter);
  //   final sortFunction = (currentSearchFilter == SectionFilter.rating)
  //       ? sortAthletesByRating
  //       : sortAthletesByDate;
  //   stories = sortFunction(stories.toList()).toList();
  //   searchedStories = sortFunction(searchedStories.toList()).toList();
  //   emit(HomeSuccessState());
  // }
  //
  // void changeSearchFilter(SectionFilter searchFilter) {
  //   currentSearchFilter = searchFilter;
  //   emit(HomeSuccessState());
  // }
  //
  // List<AthleteModel> sortAthletesByRating(List<AthleteModel> athletesList) {
  //   return athletesList..sort((a, b) => b.likesCount.compareTo(a.likesCount));
  // }
  //
  // List<AthleteModel> sortAthletesByDate(List<AthleteModel> athletesList) {
  //   return athletesList
  //     ..sort((a, b) => b.createdAt.millisecondsSinceEpoch
  //         .compareTo(a.createdAt.millisecondsSinceEpoch));
  // }
}
