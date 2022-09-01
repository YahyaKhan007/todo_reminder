// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/add_grocery_condition.dart';
import 'package:todo_reminder/provider/task_provider.dart';
import 'package:todo_reminder/ui/widgets/add_item/bottom_sheet.dart';

import '../../screen_size.dart';
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
    SW.init(context: context);
    SH.init(context: context);
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
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(31, 167, 161, 161),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: "Search for tasks, events, etc...",
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
                            fontSize: size.width * 0.050,
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
  List name = [];
  List list = [
    Container(
      height: 30,
      width: 30,
      color: Colors.red,
    ),
    Container(
      height: 30,
      width: 30,
      color: Colors.green,
    ),
    Container(
      height: 30,
      width: 30,
      color: Colors.yellow,
    ),
    Container(
      height: 30,
      width: 30,
      color: Colors.purple,
    )
  ];

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
                ? Stack(children: [
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
                        top: size.height * 0.01,
                        left: size.width - 260,
                        child: CircleAvatar(
                          radius: 10,
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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(10.0),
      )),
      builder: (context) {
        return Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: -SW.fifteen,
                child: Container(
                  width: SW.sixty,
                  height: SH.seven,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                )),
            SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: SH.twenty,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SH.twenty),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        // color: Colors.red,
                        width: SW.three100,
                        height: 40,
                        child: Center(
                          child: Text(
                            ("Grocery List"),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: SW.twenty5,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Popmenu(txt: "Rename"),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Popmenu(txt: "Start from scratch"),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Popmenu(txt: "Convert to regular list"),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Popmenu(txt: "Export list"),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Popmenu(txt: "Print list"),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Popmenu(txt: "Delete list"),
                          ),
                        ],
                        child: const Icon(
                          Icons.more_vert,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SH.hundred,
                ),
                const Image(image: AssetImage("assets/images/bg.png")),
                SizedBox(
                  height: SH.seventy,
                ),
                Text("Your list is empty",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: SW.twennty,
                      fontWeight: FontWeight.w300,
                    )),
                const Icon(
                  Icons.arrow_downward_sharp,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: SH.twenty2,
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
            padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SW.fifteen, vertical: SH.five),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextField(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: SW.seventeen),
                                maxLines: 4,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Create a new list",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600,
                                      fontSize: SW.seventeen),
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
                                        fontSize: SW.fifteen),
                                  ),
                                  const SizedBox(
                                    width: 10,
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
                                      fontSize: SW.fifteen,
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
                                      fontSize: SW.fifteen,
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