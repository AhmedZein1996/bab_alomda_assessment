import 'package:bab_alomda_assessment/core/constants/app_strings.dart';
import 'package:bab_alomda_assessment/core/widgets/default_text.dart';
import 'package:bab_alomda_assessment/features/stories/logic/story_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/enums/enums.dart';

class DropDownFilterList extends StatelessWidget {
  const DropDownFilterList({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      child: const Row(
        children: [
          Icon(Icons.filter_alt),
          DefaultText(text: AppStrings.filter, fontWeight: FontWeight.w500)
        ],
      ),
      itemBuilder: (BuildContext context) => SectionFilter.values.map((filter) {
        return PopupMenuItem<String>(
          value: filter.value,
          child: Text(filter.value),
        );
      }).toList(),
      onSelected: (String value) {
        StoryCubit.get(context).getFilterStories(value);
      },
    );
  }
}
