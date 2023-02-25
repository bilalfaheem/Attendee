import 'package:attendees/MarkAttendenceScreen/view/markattendence_screen.dart';
import 'package:attendees/ProfileScreen/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';

final screens = [
MarkAttendenceScreen(),
ProfileScreen(),
ProfileScreen(),
];

class NavbarProvider with ChangeNotifier {
  int _screen = 0;
  get screen => _screen;

  void changeScreen(int index) {
    _screen = index;
    notifyListeners();
  }
}
