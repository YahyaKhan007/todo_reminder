// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/task_provider.dart';
import 'package:todo_reminder/ui/screens/main_calendar.dart';
import 'package:todo_reminder/ui/screens/screens.dart';
import 'package:todo_reminder/ui/pages/all_task_pages/grid_tasks.dart';
import 'package:todo_reminder/ui/widgets/bilal/taskcontainer.dart';
import 'package:todo_reminder/ui/widgets/scroll_to_hide/scroll_to_hide.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late ScrollController controller;
bool taskBool = false;
int _currentIndex = 0;
int _check = 0;

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    taskBool = false;
    _pageController = PageController();
    controller = ScrollController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  List<String> titles = ["All Tasks", "Next 7 Days"];
  final pages = [
    TaskScreens(),
    MainCalendar(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TaskProvider>(
        builder: (context, value, child) {
          return SizedBox.expand(
            child: PageView(
              dragStartBehavior: DragStartBehavior.down,
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: value.taskBool ? [MainTaskScreen()] : pages,
            ),
          );
        },
      ),

      // bottomSheet: BottomContainer(),
      bottomNavigationBar: ScrollToHide(
          controller: controller,
          child: Consumer<TaskProvider>(
            builder: (context, value, child) {
              return BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    index == 0
                        ? value.setCheck(value.check + 1)
                        : value.setCheck(-1);

                    if (value.check >= 1) {
                      value.setTaskBool(!value.taskBool);
                    } else if (index != 0) {
                      value.setCheck(-1);
                      value.setTaskBool(false);
                    }
                    _pageController.jumpToPage(index);

                    // setState(() {
                    //   _currentIndex = index;
                    // });
                  },
                  elevation: 0,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.checkmark_alt_circle_fill),
                        label: "Tasks"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.edit_calendar_outlined),
                        label: "Calendar"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: "Settings"),
                  ]);
            },
          )),
    );
  }
}
