import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_manager.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDate;
  final Function(DateTime) onDateChange;
  const Calendar({
    super.key,
    required this.focusedDate,
    required this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: EasyInfiniteDateTimeLine(
        firstDate: DateTime.now(),
        focusDate: focusedDate,
        lastDate: DateTime.now().add(const Duration(days: 365)),
        showTimelineHeader: false,
        itemBuilder: buildCalendarItem,
      ),
    );
  }

  Widget buildCalendarItem(
    BuildContext context,
    DateTime date,
    bool isSelected,
    Function() onTap,
  ) {
    return InkWell(
      onTap: () => onDateChange(date),
      child: Card(
        margin: const EdgeInsets.all(2),
        color: Theme.of(context).primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.getDayName,
              style: isSelected
                  ? LightTextStyles.text15WeightBold.copyWith(
                      color: ColorsManager.primaryColor,
                    )
                  : isLight(context)
                      ? LightTextStyles.text15WeightBold
                      : DarkTextStyles.text15WeightBold,
            ),
            Text(
              '${date.day}',
              style: isSelected
                  ? LightTextStyles.text15WeightBold.copyWith(
                      color: ColorsManager.primaryColor,
                    )
                  : isLight(context)
                      ? LightTextStyles.text15WeightBold
                      : DarkTextStyles.text15WeightBold,
            ),
          ],
        ),
      ),
    );
  }
}
