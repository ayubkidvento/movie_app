import 'package:flutter/material.dart';

class ValueProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  changeInndex(int x) {
    _index = x;
    notifyListeners();
  }
}
