import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todo_reminder/provider/calendar_provider.dart';

class WeekCalendarPage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const WeekCalendarPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WeekCalendarPageState createState() => _WeekCalendarPageState();
}

class _WeekCalendarPageState extends State<WeekCalendarPage> {
  final CalendarController _controller = CalendarController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CalendarProvider>(context, listen: true);
    calendarTapped(CalendarTapDetails calendarTapDetails) {
      if (prov.calendarIndex == 0 || prov.calendarIndex == 1) {
        _controller.view = CalendarView.day;
      } else if (prov.calendarIndex == 2) {
        _controller.view = CalendarView.week;
      } else {
        _controller.view = CalendarView.month;
      }
    }

    return Scaffold(
        body: SfCalendar(
      allowDragAndDrop: true,
      allowAppointmentResize: true,
      showNavigationArrow: true,
      onTap: calendarTapped,
      controller: _controller,
      view: CalendarView.week,
      dataSource: MeetingDataSource(getDataSource()),

      firstDayOfWeek: 7,
      // showCurrentTimeIndicator: true,
      // monthViewSettings: MonthViewSettings(
      //     navigationDirection: MonthNavigationDirection.vertical),
    )
        // initialSelectedDate: DateTime(2022, 09, 02),
        // initialDisplayDate: DateTime(2022, 09, 02),
        );
  }
}

List<Appointment> getDataSource() {
  final List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: "birthday",
      color: Colors.blue));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
