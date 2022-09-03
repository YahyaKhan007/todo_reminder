import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/pages/gloabal_pages/Assetsscreen.dart';
import 'package:todo_reminder/ui/widgets/widgets.dart';

import 'floating_action_button.dart';

class EventOrTaskAdder extends StatelessWidget {
  const EventOrTaskAdder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showButtons(context);
  }

  showButtons(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: EdgeInsets.only(bottom: 75.h, right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            _showbottomsheet2(context);
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 7.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.w)),
                              child: Text(
                                "Task",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        ActionFloatingButton(
                            color: Colors.blue,
                            iconColor: Colors.white,
                            radius: 20.r,
                            icon: Icons.check_box,
                            ontap: () {})
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 7.h),
                            // height: 35,
                            // width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.w)),
                            child: Text(
                              "Event",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w600),
                            )),
                        SizedBox(
                          width: 15.w,
                        ),
                        ActionFloatingButton(
                            color: Colors.blue,
                            iconColor: Colors.white,
                            radius: 25.r,
                            icon: Icons.calendar_month_outlined,
                            ontap: () {})
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  _showbottomsheet2(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        )),
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return const AssetScreen();
          });
        });
  }
}
