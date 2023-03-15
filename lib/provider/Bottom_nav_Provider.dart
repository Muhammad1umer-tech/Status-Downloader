import 'package:flutter/material.dart';


class Bottom_Navigation_Bar extends ChangeNotifier {
  int _currentIndex = 0;

  int get CurrentIndex {
    return _currentIndex;
  }
  void changeIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}