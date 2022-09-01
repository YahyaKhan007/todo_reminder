import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/calendar_provider.dart';
import 'package:todo_reminder/ui/pratice_screens/day.dart';
import 'package:todo_reminder/ui/pages/calendar_pages/agenda.dart';
import 'package:todo_reminder/ui/screens/screens.dart';
import 'package:todo_reminder/ui/widgets/event_task_adder.dart';
import 'package:todo_reminder/ui/widgets/widgets.dart';

import '../widgets/custome_appbar/calendarAppBar.dart';

class MainCalendar extends StatefulWidget {
  // final int calendarIndex;
  const MainCalendar({
    Key? key,
  }) : super(key: key);

  @override
  State<MainCalendar> createState() => _MainCalendarState();
}

class _MainCalendarState extends State<MainCalendar> {
  List calendarPages = [Agenda(), const Day(), Container(), Container()];
  List calendarPageTitles = ["Agenda", "Day", "3 Days", "Week"];

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<CalendarProvider>(context, listen: false);
    return Scaffold(
      key: calScafoldKey,
      drawer: const CalendarDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(53),
          child: Consumer<CalendarProvider>(
            builder: (context, value, child) {
              return CalendarAppBar(
                  title: calendarPageTitles[value.calendarIndex]);
            },
          )),
      body: Consumer<CalendarProvider>(
        builder: (context, value, child) {
          return calendarPages[value.calendarIndex];
        },
      ),
      floatingActionButton: ActionFloatingButton(
          color: Colors.blue.shade500,
          icon: Icons.add,
          iconColor: Colors.white,
          ontap: () {
            EventOrTaskAdder.showButtons(context);
          },
          radius: 25),
    );
  }
}
