import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';

class SlidableItemContent extends StatelessWidget {
  const SlidableItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Play Basketball',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '10:30 AM',
                      style: Theme.of(context).textTheme.displaySmall,
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
