import 'package:bab_alomda_assessment/core/exports/exports.dart';
import 'package:bab_alomda_assessment/core/helper/enums/enums.dart';
import 'package:bab_alomda_assessment/features/stories/logic/story_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListSwitch extends StatelessWidget {
  const CardsListSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = StoryCubit.get(context);
    return BlocSelector<StoryCubit, StoryState, StoryDisplayStatus>(
      selector: (state) => cubit.viewStoryDisplayStatus,
      builder: (context, storyDisplayStatus) {
        return Row(
          children: [
            SizedBox(
              width: 30.0,
              child: IconButton(
                  highlightColor: AppColors.appBGColor,
                  onPressed: () {
                    cubit.changeStoriesDisplayStatus(StoryDisplayStatus.list);
                  },
                  icon: Icon(
                    Icons.view_list_rounded,
                    color: storyDisplayStatus == StoryDisplayStatus.list
                        ? AppColors.appOrangeColor
                        : AppColors.appBlackColor,
                  )),
            ),
            SizedBox(
              width: 30.0,
              child: IconButton(
                  highlightColor: AppColors.appBGColor,
                  onPressed: () {
                    cubit.changeStoriesDisplayStatus(StoryDisplayStatus.cards);
                  },
                  icon: Icon(
                    Icons.grid_view_sharp,
                    color: storyDisplayStatus == StoryDisplayStatus.cards
                        ? AppColors.appOrangeColor
                        : AppColors.appBlackColor,
                  )),
            ),
          ],
        );
      },
    );
  }
}
