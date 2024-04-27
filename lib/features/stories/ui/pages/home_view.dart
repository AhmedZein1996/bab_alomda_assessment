import 'package:bab_alomda_assessment/core/widgets/default_app_bar.dart';
import 'package:bab_alomda_assessment/features/stories/logic/story_cubit.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/home_header.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/stories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: BlocListener<StoryCubit, StoryState>(
        listenWhen: (previous, current) => current is StoryErrorState,
        listener: (context, state) {
          if (state is StoryErrorState) {
            Utils.showToast(state.message);
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            StoryCubit.get(context).onRefreshScreen();
            await StoryCubit.get(context).getTopStories();
          },
          child: const Column(
            children: [
              HomeHeader(),
              StoriesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
