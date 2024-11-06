import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/colors_manager.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/dialog_utils.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/database/collections/tasks_collection.dart';
import 'package:todo_app/database/models/task_model.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SlidableItemContent extends StatelessWidget {
  final TaskDM task;
  const SlidableItemContent({super.key, required this.task});

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
              color: task.state == true
                  ? ColorsManager.greenColor
                  : theme.primaryColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  task.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: task.state == true
                      ? LightTextStyles.text20WeightBold
                          .copyWith(color: ColorsManager.greenColor)
                      : LightTextStyles.text20WeightBold,
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
                      task.description!,
                      style: isLight(context)
                          ? LightTextStyles.text15WeightBold
                          : DarkTextStyles.text15WeightBold,
                    ),
                  ],
                )
              ],
            ),
          ),
          getTaskState(task, context)
        ],
      ),
    );
  }

  Widget getTaskState(TaskDM task, BuildContext context) {
    if (task.state == true) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '${AppLocalizations.of(context)!.done}!',
          style: LightTextStyles.text20WeightBold
              .copyWith(color: ColorsManager.greenColor),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          doneIconPressed(task, context);
        },
        child: Container(
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
        ),
      );
    }
  }

  void doneIconPressed(TaskDM task, BuildContext context) async {
    TasksCollection tasksCollection = TasksCollection();
    String userId = context.read<AppAuthProvider>().authUser!.uid;
    try {
      showLoadingDialog(context);
      task.state = true;
      await tasksCollection.editTaskInFireStore(userId, task);
      if (context.mounted) hideLoadingDialog(context);
    } catch (e) {
      task.state = false;
      if (context.mounted) {
        hideLoadingDialog(context);
        showMessageDialog(
          context,
          message: AppLocalizations.of(context)!.somethingWentWrong,
          posActionTitle: AppLocalizations.of(context)!.ok,
        );
      }
    }
  }
}
