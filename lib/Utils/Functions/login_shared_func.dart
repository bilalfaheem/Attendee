import 'package:attendees/Utils/Functions/shared_func.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loginSharedFunc(String id, String name, String phone, String email,
    String qr, String type) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("attendeesId", id);
  pref.setString("attendeesName", name);
  pref.setString("attendeesPhone", phone);
  pref.setString("attendeesEmail", email);
  pref.setString("attendeesQr", qr);
  pref.setString("attendeesType", type);
  sharedFunc();
}
