// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/add_grocery_condition.dart';
import 'package:todo_reminder/provider/task_provider.dart';
import 'package:todo_reminder/ui/widgets/add_item/bottom_sheet.dart';

import '../../widgets/bilal/taskcontainer.dart';
import '../../widgets/widgets_bilal/grocerypopmenu.dart';

class MainTaskScreen extends StatefulWidget {
  const MainTaskScreen({Key? key}) : super(key: key);

  @override
  State<MainTaskScreen> createState() => _MainTaskScreenState();
}

class _MainTaskScreenState extends State<MainTaskScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Consumer<TaskProvider>(
      builder: (context, value, child) {
        return Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Container(
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: const Color.fromARGB(31, 167, 161, 161),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 15.sp,
                          ),
                          labelText: "Search for tasks, events, etc...",
                          labelStyle: TextStyle(fontSize: 14.sp),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    children: [
                      TaskContainer(
                        txt: 'All Tasks',
                        color: Colors.black,
                        icon: Icons.list_alt,
                        ontap: () {
                          value.setPageIndex(0);
                          value.setTaskBool(!value.taskBool);
                          // Navigator.of(context)
                          //     .push(CustomePageRoute(child: const HomePage()));
                        },
                      ),
                      const Spacer(),
                      TaskContainer(
                        color: Colors.black,
                        txt: "Next 7 Days",
                        icon: Icons.calendar_month,
                        ontap: () {
                          value.setPageIndex(1);

                          // Navigator.of(context).pop();
                          value.setTaskBool(!value.taskBool);
                          // Navigator.of(context)
                          //     .push(CustomePageRoute(child: const HomePage()));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    children: [
                      Text(
                        "My Lists",
                        style: TextStyle(
                            fontSize: 17.h,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.68,
                    width: size.width,
                    //color: Colors.red,
                    child: GridViewTask(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

class GridViewTask extends StatelessWidget {
  GridViewTask({Key? key}) : super(key: key);

  List<String> title = ["Person", "Work", "Grocery List"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<TaskProvider>(builder: ((context, value, child) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 1.7,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          scrollDirection: Axis.vertical,
          itemCount: title.length + 1,
          itemBuilder: (BuildContext context, index) {
            return index != title.length
                ? Stack(alignment: Alignment.topRight, children: [
                    TaskContainer(
                      txt: title[index],
                      ontap: () {
                        if (title[index] == "Grocery List") {
                          _showModalBottomSheet(context);
                        } else {
                          value.setPageIndex(2);
                          value.setTaskBool(!value.taskBool);
                        }
                      },
                      color: Colors.black,
                    ),
                    Positioned(
                        top: 5.h,
                        right: 10.w,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: Colors.grey.shade200,
                          child: FittedBox(
                            child: Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: size.width * 0.03),
                            ),
                          ),
                        )),
                    Positioned(
                        top: size.height * 0.07,
                        left: size.width - 385,
                        child: Icon(
                          Icons.shopping_basket,
                          color: (title[index] == "Grocery List")
                              ? Colors.grey.shade400
                              : Colors.white,
                          size: size.width * 0.04,
                        ))
                  ])
                : TaskContainer(
                    color: Colors.blue,
                    txt: "Add",
                    icon: Icons.add,
                    ontap: () {
                      _task(context, size);
                    },
                  );
          });
    }));
  }

  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(10.0.h),
      )),
      builder: (context) {
        return Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: -15.h,
                child: Container(
                  width: 60.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                )),
            SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            ("Grocery List"),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        iconSize: 15.sp,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Popmenu(txt: "Rename"),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Popmenu(txt: "Start from scratch"),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Popmenu(txt: "Convert to regular list"),
                          ),
                          PopupMenuItem(
                            value: 4,
                            child: Popmenu(txt: "Export list"),
                          ),
                          PopupMenuItem(
                            value: 5,
                            child: Popmenu(txt: "Print list"),
                          ),
                          PopupMenuItem(
                            value: 6,
                            child: Popmenu(txt: "Delete list"),
                          ),
                        ],
                        child: Icon(
                          Icons.more_vert,
                          size: 25.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                const Image(image: AssetImage("assets/images/bg.png")),
                SizedBox(
                  height: 70.h,
                ),
                Text("Your list is empty",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                    )),
                const Icon(
                  Icons.arrow_downward_sharp,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 22.h,
                ),
                const BottomContainer()
              ]),
            )
          ],
        );
      },
    );
  }

  _task(BuildContext context, Size size) {
    return showDialog(
      context: context,
      builder: (context) {
        return Material(
          // color: Colors.white,
          type: MaterialType.transparency,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: size.height * 0.28,
                  // width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextField(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17.sp),
                                maxLines: 4,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Create a new list",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.sp),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Grocerry list",
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Consumer<AddGrocerryProvider>(
                                    builder: (context, value, child) {
                                      return Switch(
                                          value: value.addGrocery,
                                          onChanged: (val) {
                                            value.setAddGrocerryCondition(val);
                                          });
                                    },
                                  ),
                                ],
                              ),
                            ]),
                      ),

                      // Divider(thickness: 1,
                      // color: ,
                      // ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                              height: 30,
                              width: 3,
                              color: Colors.grey.shade400,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
