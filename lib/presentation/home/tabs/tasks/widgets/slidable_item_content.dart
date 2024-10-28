import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';

class SlidableItemContent extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  const SlidableItemContent(
      {super.key, required this.taskTitle, required this.taskDescription});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: taskItemHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.primaryColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  taskTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: LightTextStyles.text20WeightBold,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      size: 16,
                      color: isLight(context) ? Colors.black : Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      taskDescription,
                      style: isLight(context)
                          ? LightTextStyles.text15WeightBold
                          : DarkTextStyles.text15WeightBold,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 69,
            height: 34,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.primaryColor,
            ),
            child: const Icon(
              Icons.check,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
