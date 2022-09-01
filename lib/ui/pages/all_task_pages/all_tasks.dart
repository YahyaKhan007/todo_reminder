import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/expansiontile.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            //height: size.height - 50,
            //color: Colors.red,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                const CostomExpTile(txt21: "Today"),
                const CostomExpTile(txt21: "Tomorrow"),
                const CostomExpTile(txt21: "Upcoming"),
                const CostomExpTile(txt21: "Someday"),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
