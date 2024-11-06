import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/core/utils/colors_manager.dart';
import 'package:todo_app/database/models/task_model.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/slidable_item_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnSlidableActionTaskPressed = Function(TaskDM task);

class SlidableItem extends StatelessWidget {
  final TaskDM task;
  final OnSlidableActionTaskPressed onDeleteTaskPressed;
  final OnSlidableActionTaskPressed onEditTaskPressed;
  const SlidableItem({
    super.key,
    required this.task,
    required this.onDeleteTaskPressed,
    required this.onEditTaskPressed,
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
              onPressed: (context) {
                onDeleteTaskPressed(task);
              },
              autoClose: true,
              backgroundColor: ColorsManager.redColor,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
            )
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                onEditTaskPressed(task);
              },
              autoClose: true,
              backgroundColor: theme.primaryColor,
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.edit,
            )
          ],
        ),
        child: SlidableItemContent(
          task: task,
        ),
      ),
    );
  }
}
