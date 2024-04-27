import 'package:bab_alomda_assessment/core/helper/enums/enums.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/stories_cards.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/stories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/loading_screen.dart';
import '../../../logic/story_cubit.dart';

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = StoryCubit.get(context);
    return Expanded(
      child: BlocBuilder<StoryCubit, StoryState>(
        builder: (context, state) {
          if (state is StoryLoadingState) return const LoadingScreen();
          return cubit.viewStoryDisplayStatus == StoryDisplayStatus.list
              ? StoriesListView(stories: cubit.viewStories)
              : StoriesCards(stories: cubit.viewStories);
        },
      ),
    );
  }
}
