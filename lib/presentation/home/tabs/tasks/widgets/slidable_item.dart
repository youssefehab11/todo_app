import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/core/utils/colors_manager.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/slidable_item_content.dart';

class SlidableItem extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  const SlidableItem({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              //borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
              autoClose: true,
              backgroundColor: ColorsManager.redColor,
              icon: Icons.delete,
              label: 'Delete',
            )
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              //borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
              autoClose: true,
              backgroundColor: theme.primaryColor,
              icon: Icons.edit,
              label: 'Edit',
            )
          ],
        ),
        child: SlidableItemContent(
          taskTitle: taskTitle,
          taskDescription: taskDescription,
        ),
      ),
    );
  }
}
