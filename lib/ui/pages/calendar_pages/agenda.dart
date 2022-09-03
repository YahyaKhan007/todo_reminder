// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../pratice_screens/weekCal.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  bool showTableCalendar = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  showTableCalendar = !showTableCalendar;
                });
              },
              child: Icon(
                showTableCalendar
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 17.sp,
              ),
            ),
            Visibility(
                visible: showTableCalendar,
                child: SizedBox(
                  height: 160.h,
                  child: TableCalendar(
                    shouldFillViewport: true,
                    calendarStyle: const CalendarStyle(
                        // tableBorder: TableBorder.all(color: Colors.black)
                        ),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    headerVisible: false,
                  ),
                )),

            Expanded(
              child: SfCalendar(
                allowDragAndDrop: true,
                allowAppointmentResize: true,
                showNavigationArrow: true,
                view: CalendarView.day,
                // onTap: calendarTapped,
                // controller: _controller,
                dataSource: MeetingDataSource(getDataSource()),

                firstDayOfWeek: 7,
                showCurrentTimeIndicator: true,
                // monthViewSettings: MonthViewSettings(
                //     navigationDirection: MonthNavigationDirection.vertical),
              ),
            )
            // initialSelectedDate: DateTime(2022, 09, 02),
            // initialDisplayDate: DateTime(2022, 09, 02),
          ],
        ),
      ),
    );
  }
}
