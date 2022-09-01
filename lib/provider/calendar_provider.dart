import 'package:flutter/foundation.dart';

class CalendarProvider extends ChangeNotifier {
  int _calendarIndex = 0;

  int get calendarIndex => _calendarIndex;

  void setCalenderIndex(int value) {
    _calendarIndex = value;
    notifyListeners();
  }
}
