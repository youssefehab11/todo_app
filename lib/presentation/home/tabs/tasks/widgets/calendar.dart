import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/provider/app_provider.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          //`selectedDate` the new date selected.
        },
        headerProps: const EasyHeaderProps(showHeader: false),
        dayProps: EasyDayProps(
          todayStyle: CustomDayStyle(
            context: context,
            isSelected: false,
            hasBorder: true,
            provider: provider
          ),
          dayStructure: DayStructure.dayStrDayNum,
          activeDayStyle: CustomDayStyle(
            context: context,
            isSelected: true,
            provider: provider
          ),
          inactiveDayStyle: CustomDayStyle(
            context: context,
            isSelected: false,
            provider: provider
          ),
        ),
      ),
    );
  }
}

class CustomDayStyle extends DayStyle {
  CustomDayStyle({
    required BuildContext context,
    bool hasBorder = false,
    required bool isSelected,
    required AppProvider provider,
  }) : super(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.primary,
            border: hasBorder
                ? Border.all(color: Theme.of(context).primaryColor)
                : null,
          ),
          dayNumStyle: isSelected
              ? LightTextStyles.text15WeightBold.copyWith(color: Theme.of(context).primaryColor)
              : checkCurrentTheme(context) ? LightTextStyles.text15WeightBold : DarkTextStyles.text15WeightBold,
          dayStrStyle: isSelected
              ? LightTextStyles.text15WeightBold.copyWith(color: Theme.of(context).primaryColor)
              : checkCurrentTheme(context) ? LightTextStyles.text15WeightBold : DarkTextStyles.text15WeightBold,
        );
}
