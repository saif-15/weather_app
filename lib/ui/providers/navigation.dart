import 'package:flutter/cupertino.dart';

class Navigation with ChangeNotifier {
  int _selectedIndex = 0;

  set index(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int get index => _selectedIndex;
}
