import 'package:bab_alomda_assessment/core/styling/app_spacing.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/cards_list_switch.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/drop_down_fllter_list.dart';
import 'package:bab_alomda_assessment/features/stories/ui/widgets/home/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.appPadding,
          vertical: AppSpacing.mediumPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Expanded(child: SearchBarWidget()),
                SizedBox(width: AppSpacing.smallPadding.w),
                const DropDownFilterList()
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.defaultPadding),
          const CardsListSwitch()
        ],
      ),
    );
  }
}
