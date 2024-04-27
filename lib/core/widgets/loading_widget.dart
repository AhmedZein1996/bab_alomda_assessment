import 'package:bab_alomda_assessment/core/widgets/spinkitcircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_strings.dart';
import '../styling/app_colors.dart';
import '../styling/app_spacing.dart';
import 'default_text.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpinKitCircle(color: AppColors.appBlackColor),
          const SizedBox(height: AppSpacing.defaultSpacingBetweenElements),
          DefaultText(
              text: AppStrings.loading,
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp)),
        ],
      ),
    );
  }
}
