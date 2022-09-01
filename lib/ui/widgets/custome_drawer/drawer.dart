import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Consumer<CalendarProvider>(builder: (context, value, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "CALENDAR VIEW",
                    style: TextStyle(letterSpacing: 0.3, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 15,
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
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 25),
                    child: Text(
                      "VISIBLE CALENDARS",
                      style: TextStyle(letterSpacing: 0.3, fontSize: 14),
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
                                  25),
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
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color ?? Colors.black,
              size: size ?? 25,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
