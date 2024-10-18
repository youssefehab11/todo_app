import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/styles.dart';

class SlidableItemContent extends StatelessWidget {
  const SlidableItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: taskItemHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 62,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor,
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Play Basketball',
                  style: LightTextStyles.text22WeightBold,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '10:30 AM',
                      style: LightTextStyles.text16WeightNormal,
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
              color: Theme.of(context).primaryColor,
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
