import 'package:flutter/foundation.dart';

class SettingButtonsProvider extends ChangeNotifier {
  // dynamic theme button
  bool _dynamicTheme = false;
  String _dynamicText = "Off";

  bool get dynamicTheme => _dynamicTheme;
  String get dynamicText => _dynamicText;

  setDynamicButton(value) {
    _dynamicTheme = value;
    if (value == true) {
      _dynamicText = "On";
    } else {
      _dynamicText = "Off";
    }
    notifyListeners();
  }

  // Quick add bar button
  bool _quickAdd = false;
  String _quickAddText = "Hide";

  bool get quickAdd => _quickAdd;
  String get quickAddText => _quickAddText;

  setQuickAdd(value) {
    _quickAdd = value;
    if (value == true) {
      _quickAddText = "Show";
    } else {
      _quickAddText = "Hide";
    }
    notifyListeners();
  }

  // shake button
  bool _shakeButton = false;
  String _shakeButtonText = "Off";

  bool get shakeButton => _shakeButton;
  String get shakeButtonText => _shakeButtonText;

  setShakeButton(value) {
    _shakeButton = value;
    if (value == true) {
      _shakeButtonText = "On";
    } else {
      _shakeButtonText = "Off";
    }
    notifyListeners();
  }

  // smart Grocerry List
  bool _smartGrocerry = false;
  String _smartGrocerryText = "Off";

  bool get smartGrocerry => _smartGrocerry;
  String get smartGrocerryText => _smartGrocerryText;

  setSmartGrocerry(value) {
    _smartGrocerry = value;
    if (value == true) {
      _smartGrocerryText = "On";
    } else {
      _smartGrocerryText = "Off";
    }
    notifyListeners();
  }

  // Time Detection
  bool _timeDetect = false;
  String _timeDetectText = "Off";

  bool get timeDetect => _timeDetect;
  String get timeDetectText => _timeDetectText;

  setTimeDetectText(value) {
    _timeDetect = value;
    if (value == true) {
      _timeDetectText = "On";
    } else {
      _timeDetectText = "Off";
    }
    notifyListeners();
  }

// Event Remider
  bool _eventRemind = false;
  String _eventRemindText = "Off";

  bool get eventRemind => _eventRemind;
  String get eventRemindText => _eventRemindText;

  setEventReminder(value) {
    _eventRemind = value;
    if (value == true) {
      _eventRemindText = "On";
    } else {
      _eventRemindText = "Off";
    }
    notifyListeners();
  }

  // completed task
  bool _compTask = false;
  String _compTaskText = "Off";

  bool get compTask => _compTask;
  String get compTaskText => _compTaskText;

  setComletedTask(value) {
    _compTask = value;
    if (value == true) {
      _compTaskText = "On";
    } else {
      _compTaskText = "Off";
    }
    notifyListeners();
  }
}
