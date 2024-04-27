import 'package:bab_alomda_assessment/core/constants/app_strings.dart';
import 'package:bab_alomda_assessment/features/stories/logic/story_cubit.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = StoryCubit.get(context);
    return SearchBar(
      controller: cubit.searchController,
      focusNode: cubit.searchFocusNode,
      leading: const Icon(Icons.search),
      hintText: AppStrings.search,
      onChanged: (value) => cubit.searchStories(),
    );
  }
}
