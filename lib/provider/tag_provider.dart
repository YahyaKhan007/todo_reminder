import 'package:flutter/foundation.dart';

class TagProvider extends ChangeNotifier {
  final List _tag = [];

  List get tag => _tag;

  void setTag(value) {
    if (_tag.length != 1) {
      _tag.add(value);
    }

    notifyListeners();
  }

  void remTag(value) {
    _tag.removeAt(value);
    notifyListeners();
  }
}
