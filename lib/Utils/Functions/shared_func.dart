import 'package:attendees/Utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

sharedFunc() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  attendeesId = pref.getString("attendeesId").toString();
  attendeesName = pref.getString("attendeesName").toString();
  attendeesPhone = pref.getString("attendeesPhone").toString();
  attendeesEmail = pref.getString("attendeesEmail").toString();
  attendeesQr = pref.getString("attendeesQr").toString();
  attendeesType = pref.getString("attendeesType").toString();
  print(attendeesId +
      attendeesName +
      attendeesPhone +
      attendeesEmail +
      attendeesQr +
      attendeesType);
}
