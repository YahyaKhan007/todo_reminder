import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/task_provider.dart';
import 'package:todo_reminder/ui/pages/all_task_pages/next7days.dart';
import 'package:todo_reminder/ui/pages/all_task_pages/all_tasks.dart';
import 'package:todo_reminder/ui/widgets/widgets.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/personal.dart';

import '../screen_size.dart';
import '../widgets/add_item/bottom_sheet.dart';

class TaskScreens extends StatefulWidget {
  const TaskScreens({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskScreens> createState() => _TaskScreensState();
}

final GlobalKey<ScaffoldState> calScafoldKey = GlobalKey();
final GlobalKey<ScaffoldState> allTask = GlobalKey();

class _TaskScreensState extends State<TaskScreens> {
  List taskPages = const [AllTasks(), Next7Days(), Personal()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        bottomSheet: const BottomContainer(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(53.h),
            child: Consumer<TaskProvider>(
              builder: (context, value, child) {
                return AllTaskAppBar(
                  title: value.title[value.pageIndex],
                );
              },
            )),
        body: Consumer<TaskProvider>(builder: (context, value, child) {
          return taskPages[value.pageIndex];
        }));
  }
}
