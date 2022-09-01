import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/alltaskssearch.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/expansiontile.dart';

import '../../screen_size.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SW.init(context: context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            //height: size.height - 50,
            //color: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(SW.fifteen),
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                const CostomExpTile(txt21: "Today"),
                CostomExpTile(txt21: "Tomorrow"),
                CostomExpTile(txt21: "Upcoming"),
                CostomExpTile(txt21: "Someday"),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
