import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/data/anydo_tip.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool notify = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 30.h,
            ),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25.sp,
                      color: Colors.blue,
                    )),
                Column(
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                notify = false;
                              });
                            },
                            child: Text("ANY.DO TIPS",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: notify
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade800))),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 3.h,
                          width: 80.w,
                          color: notify ? Colors.grey.shade300 : Colors.blue,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                notify = true;
                              });
                            },
                            child: Text("NOTIFICATIONS",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: notify
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade400,
                                ))),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 3.h,
                          width: 90.w,
                          color: notify ? Colors.blue : Colors.grey.shade300,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: (notify) ? const Notifications() : const Tips())
        ],
      ),
    );
  }
}

class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: Tip.title.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: TipContainer(
                buttonTxt: Tip.buttonTxt[index],
                title: Tip.title[index],
                subTitle: Tip.subtitle[index],
                onContainerCLick: () {},
                onDissmiss: () {},
              ),
            );
          }),
    );
  }
}

class TipContainer extends StatelessWidget {
  final VoidCallback onDissmiss;
  final VoidCallback onContainerCLick;

  final String buttonTxt;
  final String title;
  final String subTitle;

  const TipContainer(
      {Key? key,
      required this.buttonTxt,
      required this.title,
      required this.subTitle,
      required this.onDissmiss,
      required this.onContainerCLick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        children: [
          InkWell(
            onTap: onContainerCLick,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 160.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(
                      "assets/images/Capture.PNG",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.blueAccent.shade200, BlendMode.modulate)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.w),
                    topRight: Radius.circular(5.w)),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.h, left: 20.w, right: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4.h),
            child: Container(
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: onContainerCLick,
                      child: Text(buttonTxt,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp)),
                    ),
                    TextButton(
                      onPressed: onDissmiss,
                      child: Text("Dismiss",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp)),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 80.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Nothing new here",
              style: TextStyle(fontSize: 25.sp, color: Colors.grey.shade400),
            )
          ],
        ),
      ),
    );
  }
}
