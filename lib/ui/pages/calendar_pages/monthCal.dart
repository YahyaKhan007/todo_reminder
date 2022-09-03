import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todo_reminder/ui/pratice_screens/weekCal.dart';

class MonthCalendarPage extends StatelessWidget {
  const MonthCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      // allowViewNavigation: false,

      // allowDragAndDrop: true,
      // allowAppointmentResize: true,
      // showNavigationArrow: true,
      view: CalendarView.month,
      // onTap: calendarTapped,
      // controller: _controller,
      dataSource: MeetingDataSource(getDataSource()),

      firstDayOfWeek: 7,
      // showCurrentTimeIndicator: true,
      // monthViewSettings: MonthViewSettings(
      //     navigationDirection: MonthNavigationDirection.vertical),
    ));
  }
}
