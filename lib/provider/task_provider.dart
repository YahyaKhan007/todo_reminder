import 'package:flutter/foundation.dart';

class TaskProvider extends ChangeNotifier {
  bool _taskBool = false;
  bool get taskBool => _taskBool;

  void setTaskBool(bool value) {
    _taskBool = value;
    notifyListeners();
  }

//    Check

  int _check = 0;
  int get check => _check;

  void setCheck(int value) {
    _check = value;
    notifyListeners();
  }

  //  task index

  int _pagesIndex = 0;
  int get pageIndex => _pagesIndex;

  void setPageIndex(value) {
    _pagesIndex = value;
    notifyListeners();
  }

  //

  final List<String> _titles = ["All Tasks", "Next 7 Days", "Personal"];

  List get title => _titles;
}
