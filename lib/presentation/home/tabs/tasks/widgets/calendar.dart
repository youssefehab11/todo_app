import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
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
              context: context, isSelected: false, hasBorder: true),
          dayStructure: DayStructure.dayStrDayNum,
          activeDayStyle: CustomDayStyle(
            context: context,
            isSelected: true,
          ),
          inactiveDayStyle: CustomDayStyle(
            context: context,
            isSelected: false,
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
  }) : super(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.primary,
            border: hasBorder
                ? Border.all(color: Theme.of(context).primaryColor)
                : null,
          ),
          dayNumStyle: isSelected
              ? Theme.of(context).textTheme.labelSmall
              : Theme.of(context).textTheme.titleSmall,
          dayStrStyle: isSelected
              ? Theme.of(context).textTheme.labelSmall
              : Theme.of(context).textTheme.titleSmall,
        );
}
