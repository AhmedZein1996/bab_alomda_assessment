import 'package:bab_alomda_assessment/core/helper/enums/enums.dart';
import 'package:bab_alomda_assessment/core/styling/app_colors.dart';
import 'package:bab_alomda_assessment/core/styling/app_spacing.dart';
import 'package:bab_alomda_assessment/features/stories/data/model/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/cached_network_image.dart';
import '../../../../../core/widgets/default_text.dart';
import '../../../../../core/widgets/network_image_shimmer.dart';

class ListStoryWidget extends StatelessWidget {
  final StoryModel storyModel;
  final Orientation orientation;
  final VoidCallback onTab;
  const ListStoryWidget(
      {super.key,
      required this.storyModel,
      required this.onTab,
      required this.orientation});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: onTab,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.mediumPadding),
            child: Row(
              children: [
                CachedNetworkImageWidget(
                    imgUrl: storyModel.multimedia == null
                        ? ''
                        : storyModel.multimedia!
                            .firstWhere((media) =>
                                media.format ==
                                ImageFormat.largeThumbnail.value)
                            .imageUrl,
                    width: orientation == Orientation.portrait ? 120.w : 120,
                    height: orientation == Orientation.portrait ? 100.h : 100,
                    onErrorWidget: kNetworkImageOnErrorWidget),
                SizedBox(width: AppSpacing.appPadding.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                          text: storyModel.title,
                          isCenter: false,
                          color: AppColors.headlineTextColor,
                          fontSize: orientation == Orientation.portrait
                              ? 14.sp
                              : 22.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: AppSpacing.smallerPadding.h),
                      DefaultText(
                        text: storyModel.author,
                        isCenter: false,
                        maxLines: 1,
                        color: AppColors.authorTextColor,
                        fontSize:
                            orientation == Orientation.portrait ? 12.sp : 20.sp,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
