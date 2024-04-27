import 'package:bab_alomda_assessment/core/styling/app_spacing.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/card_story_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/navigator/navigator.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../data/model/story_model.dart';

class StoriesCards extends StatelessWidget {
  final List<StoryModel> stories;
  const StoriesCards({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            childAspectRatio: .9,
            crossAxisSpacing: AppSpacing.smallPadding,
            mainAxisSpacing: AppSpacing.smallPadding),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.smallPadding,
            vertical: AppSpacing.smallPadding),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return CardStoryWidget(
            storyModel: stories[index],
            onTab: () => AppNavigator.pushNamed(AppRoutes.storiesDetails,
                arguments: stories[index]),
          );
        },
      ),
    );
  }
}
