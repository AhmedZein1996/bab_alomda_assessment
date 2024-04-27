import 'package:bab_alomda_assessment/core/helper/enums/enums.dart';
import 'package:bab_alomda_assessment/core/styling/app_spacing.dart';
import 'package:bab_alomda_assessment/features/stories/data/model/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/cached_network_image.dart';
import '../../../../../core/widgets/default_text.dart';
import '../../../../../core/widgets/network_image_shimmer.dart';

class CardStoryWidget extends StatelessWidget {
  final StoryModel storyModel;
  final VoidCallback onTab;
  const CardStoryWidget(
      {super.key, required this.storyModel, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.mediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImageWidget(
                  imgUrl: storyModel.multimedia == null
                      ? ''
                      : storyModel.multimedia!
                          .firstWhere((media) =>
                              media.format == ImageFormat.largeThumbnail.value)
                          .imageUrl,
                  height: 120,
                  onErrorWidget: kNetworkImageOnErrorWidget),
              SizedBox(height: 8.w),
              if (storyModel.title.isNotEmpty)
                Expanded(
                  child: DefaultText(
                    text: storyModel.title * 3,
                    maxLines: 2,
                    isCenter: false,
                  ),
                ),
              if (storyModel.author.isNotEmpty)
                Expanded(
                  child: DefaultText(
                      text: storyModel.author,
                      isCenter: false,
                      maxLines: 1,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                )
            ],
          ),
        ),
      ),
    );
  }
}
