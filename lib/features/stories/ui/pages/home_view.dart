import 'package:bab_alomda_assessment/core/widgets/default_app_bar.dart';
import 'package:bab_alomda_assessment/features/stories/logic/story_cubit.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/home_header.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/stories_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          StoryCubit.get(context)
            ..getTopStories()
            ..onRefreshScreen();
        },
        child: const Column(
          children: [
            HomeHeader(),
            StoriesWidget(),
          ],
        ),
      ),
    );
  }
}
