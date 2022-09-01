import 'package:flutter/foundation.dart';

class AddGrocerryProvider extends ChangeNotifier {
  bool _addGrocerry = false;
  bool get addGrocery => _addGrocerry;

  void setAddGrocerryCondition(bool value) {
    _addGrocerry = value;
    notifyListeners();
  }
}
