import 'package:attendees/AddEmployeesScreen/view/addemployees_screen.dart';
import 'package:attendees/EmployeeActivityScreen/view/employee_activity_screen.dart';
import 'package:attendees/EmployeesScreen/view/employee_screen.dart';
import 'package:attendees/MarkAttendenceScreen/view/markattendence_screen.dart';
import 'package:attendees/ProfileScreen/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';

final screens = [MarkAttendenceScreen(), ProfileScreen()];

class NavbarProvider with ChangeNotifier {
  int _screen = 0;
  get screen => _screen;

  void changeScreen(int index) {
    _screen = index;
    notifyListeners();
  }
}

final officeScreens = [
  EmployeeActivityScreen(),
  EmployeeScreen(),
  ProfileScreen()
];

class OfficeNavbarProvider with ChangeNotifier {
  int _screen = 0;
  get screen => _screen;

  void changeScreen(int index) {
    _screen = index;
    notifyListeners();
  }
}
