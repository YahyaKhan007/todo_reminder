import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarProvider extends ChangeNotifier {
  final CalendarController _controller = CalendarController();

  int _calendarIndex = 0;

  int get calendarIndex => _calendarIndex;

  void setCalenderIndex(int value) {
    _calendarIndex = value;
    notifyListeners();
  }
}
