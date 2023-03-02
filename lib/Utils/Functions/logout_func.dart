import 'dart:async';
import 'package:attendees/SelectionScreen/view/selection_screen.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

logoutFunc(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
  attendeesId = "null";
  attendeesName = "null";
  attendeesPhone = "null";
  attendeesEmail = "null";
  attendeesQr = "null";
  attendeesType = "null";
   attendeesCompany = "null";

  Timer(
      Duration(milliseconds: 500),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SelectionScreen()),
          ((route) => false)));
  return true;
}
