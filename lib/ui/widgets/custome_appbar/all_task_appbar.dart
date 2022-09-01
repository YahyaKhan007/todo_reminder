// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/task_provider.dart';
import 'package:todo_reminder/ui/pages/pages.dart';
import 'package:todo_reminder/ui/widgets/widgets.dart';

import '../../screen_size.dart';

class AllTaskAppBar extends StatefulWidget {
  const AllTaskAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AllTaskAppBar> createState() => _AllTaskAppBarState();
}

class _AllTaskAppBarState extends State<AllTaskAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SH.init(context: context);
    SW.init(context: context);
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        ActionButton1(
            color: Colors.grey,
            ontap: () {
              Navigator.of(context)
                  .push(CustomePageRoute(child: const NotificationPage()));
            },
            icon: Icons.check_box_outlined),
        const SizedBox(
          width: 5,
        ),
        PopupMenuButton(
          icon: const Icon(
            Icons.more_horiz,
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
                  .copyWith(topRight: const Radius.circular(0))),
          elevation: 5,
          // },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Sort',
                  child: PopUpItem(
                    color: Colors.grey,
                    icon: CupertinoIcons.arrow_up_arrow_down,
                    ontap: () {
                      // CupertinoButton(child: child, onPressed: onPressed)

                      _sort(context, size: size);
                    },
                    text: "Sort",
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Filter',
                  child: PopUpItem(
                    color: Colors.grey,
                    icon: Icons.tornado_rounded,
                    ontap: () {
                      _filter(context, size: size);
                    },
                    text: "Filter",
                    isNew: true,
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Clear',
                  child: PopUpItem(
                    color: Colors.grey,
                    icon: CupertinoIcons.clear_circled,
                    ontap: () {},
                    text: "Clear",
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Import',
                  child: PopUpItem(
                    color: Colors.grey,
                    icon: Icons.calendar_today_outlined,
                    ontap: () {},
                    text: "Import",
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Upgrade',
                  child: PopUpItem(
                    color: Colors.yellow,
                    icon: Icons.shopping_basket_outlined,
                    ontap: () {
                      Navigator.of(context)
                          .push(CustomePageRoute(child: const Premium()));
                    },
                    text: "Upgrade",
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Moment',
                  child: PopUpItem(
                    color: Colors.green,
                    icon: CupertinoIcons.square_split_2x2_fill,
                    ontap: () {},
                    text: "Moment",
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.only(top: SH.seven),
                  value: 'Sort',
                  child: PopupMenuItem(
                    child: Row(children: [
                      Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        color: Colors.grey.shade400,
                        size: SH.eighteen,
                      ),
                      SizedBox(
                        width: SW.ten,
                      ),
                      Text(
                        "Last Sync: 19 mins ago",
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: SW.twelve),
                      )
                    ]),
                  )),
            ];
          },
        ),

        //     icon: Icons.do_disturb_on_sharp),
      ],
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black, fontSize: SW.fifteen),
      ),
      leading: Align(
          alignment: Alignment.centerRight,
          child: Consumer<TaskProvider>(
            builder: (context, value, child) {
              return IconButton(
                icon: Icon(
                  Icons.fitbit_rounded,
                  size: SH.twentyFive,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  print(size.height);
                  print(size.width);
                  value.setTaskBool(true);
                },
              );
            },
          )),
    );
  }

  _filter(BuildContext context, {Size? size}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
              type: MaterialType.transparency,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: size!.width,
                        // padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * 0.03),
                              Center(
                                child: Text("Filter by",
                                    style: TextStyle(
                                        fontSize: SW.twenty5,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: SW.twennty,
                                      vertical: SH.seven),
                                  height: SH.fourty,
                                  width: SW.hundred,
                                  padding: EdgeInsets.symmetric(
                                      vertical: SH.five, horizontal: SW.seven),
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Priority",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: SW.thirteen),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: SH.seven),
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: SW.fourty),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 3,
                                          color: Colors.grey.shade400)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CupertinoButton(
                                        child: Text("Clear filter",
                                            style: TextStyle(
                                                fontSize: SW.fourteen,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87)),
                                        onPressed: () {}),
                                    Container(
                                      height: SH.thirty,
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    CupertinoButton(
                                        child: Text(
                                          "Apply",
                                          style: TextStyle(
                                            letterSpacing: 0.3,
                                            fontSize: SW.fourteen,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onPressed: () {})
                                  ],
                                ),
                              )
                            ]))
                  ]));
        });
  }

  _sort(BuildContext context, {Size? size}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size!.width,
                  padding: EdgeInsets.symmetric(horizontal: SW.twennty),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        const Text("Sort",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(height: size.height * 0.02),
                        const Text("Reorder your tasks by",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54)),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: size.width,
                            height: 45,
                            margin: EdgeInsets.only(top: size.height * 0.03),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text("Time",
                                  style: TextStyle(
                                      letterSpacing: 0.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: size.width,
                            height: 45,
                            margin: EdgeInsets.only(
                                top: size.height * 0.03,
                                bottom: size.height * 0.03),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text("List",
                                  style: TextStyle(
                                      letterSpacing: 0.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                          ),
                        )
                      ]),
                )
              ],
            ),
          );
        });
  }
}

class PopUpItem extends StatelessWidget {
  final VoidCallback ontap;
  final Color color;
  final IconData icon;
  final String text;
  final bool? isNew;
  const PopUpItem({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.text,
    this.isNew,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 17,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            if (isNew != null)
              Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.red),
                child: const Center(
                    child: Text(
                  "NEW",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                )),
              ),
          ],
        ),
      ),
    );
  }
}
