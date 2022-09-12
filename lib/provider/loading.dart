import 'package:flutter/foundation.dart';

class Loading extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  bool _signup = false;
  bool get signup => _signup;

  void setSignup(value) {
    _signup = value;
    notifyListeners();
  }

  //     counter for animated contaner
  int _counter = 2;
  int get counter => _counter;

  void setCounter(value) {
    _counter = value;
    notifyListeners();
  }
}
