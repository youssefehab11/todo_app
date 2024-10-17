import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/default_app_bar.dart';
import 'package:todo_app/presentation/home/tabs/settings/setting_tab.dart';
import 'package:todo_app/presentation/home/tabs/tasks/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = const[
    TasksTab(),
    SettingsTab(),
  ];
  String appBarTitle = 'To Do List';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  DefaultAppBar(title: appBarTitle),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
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

          onTap: (value){
            selectedIndex = value;
            appBarTitle = value == 0 ? 'To Do List': 'Settings';
            setState(() {});
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
}
