// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/tag_provider.dart';
import 'package:todo_reminder/ui/pages/setting_pages/premium.dart';
import 'package:todo_reminder/ui/screens/screens.dart';

import '../../widgets/widgets_bilal/listview.dart';

bool isCheck = false;

class Tags extends StatefulWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
// *****************************************************
//          For Premium User
// *****************************************************
  onTagClick(int index) {
    non_priority.add(priority[0]);
    non_priorityColor.add(priorityColor[0]);

    priorityColor.removeAt(0);
    priority.removeAt(0);

    priority.insert(0, non_priority[index]);
    priorityColor.insert(0, non_priorityColor[index]);

    non_priority.removeAt(index);
    non_priorityColor.removeAt(index);
  }

// *****************************************************
// *****************************************************

  List priority = ["Priority"];

  List priorityColor = [Colors.yellow];
  List<bool> con = List.generate(9, (index) => false);

  List non_priority = [
    "Important",
    "In Progress",
    "Deadline",
    "Family",
    "Trackback",
    "Science Project",
    "Work",
    "Not Critical",
    "Medium Priority"
  ];

  List non_priorityColor = [
    Colors.pink.shade300.withOpacity(0.6),
    Colors.pinkAccent.shade200.withOpacity(0.3),
    Colors.yellow.shade300.withOpacity(0.8),
    Colors.green.shade300.withOpacity(0.7),
    Colors.greenAccent.withOpacity(0.7),
    Colors.blueAccent.withOpacity(0.4),
    Colors.blue.shade300.withOpacity(0.5),
    Colors.purple.shade500.withOpacity(0.5),
    Colors.grey.shade500.withOpacity(0.9),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
              size: 20.sp,
            )),
        title: Text(
          "TAGS",
          style: TextStyle(
              fontSize: 19.sp,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              color: Colors.blue),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("Save",
                  style: TextStyle(
                    letterSpacing: 0.4,
                    color: Colors.blue.shade500,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ))),
        ],
      ),
      body: Column(
        children: [
          Consumer<TagProvider>(
            builder: (context, value, child) {
              return TagOption(
                color: priorityColor[0],
                ontap: () {
                  value.setTag("Priority");
                  Navigator.of(context).pop();
                },
                txt: priority[0],
                custom_switch: _switch(context, isCheck: false, ontap: () {
                  // setState(() {
                  //   con[0] = !con[0];
                  // });
                }),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 10.w),
                    child: Text(
                      "Upgrade to Any.do Premium for more tags & colors",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Container(
                          height: 30.h,
                          width: 20.w,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade500,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextButton(
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  "Upgrade",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ))),
                    ))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: non_priority.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TagOption(
                        color: non_priorityColor[index],
                        ontap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const Premium(),
                                  duration: const Duration(milliseconds: 700),
                                  type: PageTransitionType.fade,
                                  isIos: true));
                          // setState(() {
                          //   con[index] = !con[index];
                          //   if (con[index] == true) {
                          //     onTagClick(index);
                          //     con[index] = !con[index];
                          //   }
                          // });

                          // setState(() {});
                        },
                        txt: non_priority[index],
                        custom_switch:
                            _switch(context, isCheck: con[index], ontap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 700),
                                  child: const Premium(),
                                  type: PageTransitionType.fade,
                                  isIos: true));
                          // setState(() {
                          //   con[index] = !con[index];
                          // });
                        }));
                  }))
        ],
      ),
    );
  }

  Widget _switch(BuildContext context,
      {required bool isCheck, required VoidCallback ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 15.h,
        width: 15.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white)),
        child: Icon(
          Icons.check,
          color: isCheck ? Colors.white : Colors.transparent,
          size: 10.h,
        ),
      ),
    );
  }
}

class TagOption extends StatefulWidget {
  const TagOption(
      {Key? key,
      required this.ontap,
      required this.color,
      required this.txt,
      required this.custom_switch})
      : super(key: key);
  final Widget custom_switch;
  final VoidCallback ontap;
  final Color color;
  final String txt;

  @override
  State<TagOption> createState() => _TagOptionState();
}

class _TagOptionState extends State<TagOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: widget.color,
      child: ListTile(
        onTap: widget.ontap,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
        leading: widget.custom_switch,
        title: Text(
          widget.txt,
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
        trailing: IconButton(
            onPressed: widget.ontap,
            icon: Icon(
              CupertinoIcons.eyedropper,
              color: Colors.white,
              size: 20.sp,
            )),
      ),
    );
  }
}
