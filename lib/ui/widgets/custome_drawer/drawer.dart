import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/ui/data/data.dart';
import 'package:todo_reminder/ui/screens/screens.dart';
import 'package:todo_reminder/provider/calendar_provider.dart';

import '../../screens/main_calendar.dart';

class CalendarDrawer extends StatefulWidget {
  const CalendarDrawer({Key? key}) : super(key: key);

  @override
  State<CalendarDrawer> createState() => _CalendarDrawerState();
}

class _CalendarDrawerState extends State<CalendarDrawer> {
  final pagesTitle = const ["All Tasks", "Notifications", "Calls", "Contacts"];

  final ValueNotifier<String> title = ValueNotifier("All Tasks");

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Consumer<CalendarProvider>(builder: (context, value, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "CALENDAR VIEW",
                    style: TextStyle(letterSpacing: 0.3, fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () {
                      value.setCalenderIndex(0);

                      Navigator.of(context).pop();
                    },
                    child: _items(
                      context,
                      Icons.view_agenda_outlined,
                      "Agenda",
                      Colors.black,
                      null,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      value.setCalenderIndex(1);

                      Navigator.of(context).pop();
                    },
                    child: _items(context, Icons.view_day_outlined, "Day",
                        Colors.black, null),
                  ),
                  InkWell(
                    onTap: () {
                      value.setCalenderIndex(2);
                      Navigator.of(context).pop();
                    },
                    child: _items(context, Icons.view_week_outlined, "3 Day",
                        Colors.black, null),
                  ),
                  InkWell(
                    onTap: () {
                      value.setCalenderIndex(3);
                      Navigator.of(context).pop();
                    },
                    child: _items(context, Icons.view_week_outlined, "Week",
                        Colors.black, null),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 25.h),
                    child: Text(
                      "VISIBLE CALENDARS",
                      style: TextStyle(letterSpacing: 0.3, fontSize: 14.sp),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: DrawerData.visibleCal.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {},
                              child: _items(
                                  context,
                                  DrawerData.icons[index],
                                  DrawerData.visibleCal[index],
                                  DrawerData.colors[index],
                                  25.sp),
                            );
                          }))
                ]);
          })),
    );
  }

  Widget _items(
    BuildContext context,
    icon,
    text,
    Color? color,
    double? size,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color ?? Colors.black,
              size: size ?? 24.w,
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 13.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
