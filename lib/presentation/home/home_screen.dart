import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/default_app_bar.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/add_task_bottom_sheet.dart';
import 'package:todo_app/presentation/home/tabs/settings/setting_tab.dart';
import 'package:todo_app/presentation/home/tabs/tasks/tasks_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  GlobalKey<TasksTabState> tasksTapKey = GlobalKey<TasksTabState>();
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    tabs = [
      TasksTab(key: tasksTapKey),
      const SettingsTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: selectedIndex == 0
            ? AppLocalizations.of(context)!.appbarTasksTitle
            : AppLocalizations.of(context)!.appbarSettingsTitle,
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: '',
            )
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddNewTaskPressed,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  void onAddNewTaskPressed() async {
    await showTaskBottomSheet(context);
    tasksTapKey.currentState?.getTasks();
  }
}
