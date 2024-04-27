import 'package:bab_alomda_assessment/features/stories/data/model/story_model.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/list_story_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/navigator/navigator.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/styling/app_spacing.dart';

class StoriesListView extends StatelessWidget {
  final List<StoryModel> stories;

  const StoriesListView({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ListView.separated(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.smallPadding,
              vertical: AppSpacing.smallPadding),
          itemBuilder: (context, index) => ListStoryWidget(
                storyModel: stories[index],
                onTab: () => AppNavigator.pushNamed(AppRoutes.storiesDetails,
                    arguments: stories[index]),
                orientation: orientation,
              ),
          separatorBuilder: (context, index) =>
              SizedBox(height: AppSpacing.smallerPadding.h),
          itemCount: stories.length),
    );
  }
}
