import 'dart:async';
import 'dart:convert';

import 'package:attendees/NavBarScreen/view/navbar_screen.dart';
import 'package:attendees/NavBarScreen/view/office_navbar_screen.dart';
import 'package:attendees/Utils/Functions/login_shared_func.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

bool loginApiValidation = false;
String loginApiStatus = "c";

Future<void> loginFunction(
    context, loginFormKey, String email, String type, String password) async {
  loginApiValidation = false;
  if (loginFormKey.currentState!.validate()) {
    final response = await post(Uri.parse('${baseAddress}login.php'), body: {
      "email": email,
      "type": type,
      "password": password,
    });

    if (response.statusCode == 200) {
      print("login Api Func hitttttttttttttttttttt");
      final data = jsonDecode(response.body.toString());

      print('Post Succesfull');
      final loginDataStatus = data["status"].toString();
      print("Status $loginDataStatus");

      loginApiStatus = loginDataStatus;
      loginApiValidation = true;

// validation
      loginFormKey.currentState!.validate();

      if (loginDataStatus == '1') {
        // loginSharedFunc(id, name, phone, email, qr, type)
        // print(data["response"]["id"].toString());
        // print(data["response"]["name"].toString());
        // print(data["response"]["phone"].toString());
        // print(data["response"]["email"].toString());
        // print(data["response"]["qr_code"].toString());
        // print(data["response"]["user_type"].toString());
        loginSharedFunc(
            data["response"]["id"].toString(),
            data["response"]["name"].toString(),
            data["response"]["phone"].toString(),
            data["response"]["email"].toString(),
            data["response"]["qr_code"].toString(),
            data["response"]["user_type"].toString(),
            data["response"]["company"].toString()
            );
        // loginFunc(
        //     data.first["response"]["id"].toString(),
        //     data.first["response"]["name"].toString(),
        //     data.first["response"]["email"].toString(),
        //     data.first["response"]["phone"].toString());

        Timer(Duration(seconds: 1), () {
          print(
              "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Successful login>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => type == "company"
                      ? OfficeNavBarScreen()
                      : NavBarScreen()),
              ((route) => false));
        });
      } else if (loginDataStatus == "0") {
        print("some thing has gone wrong");
        loginFormKey.currentState!.validate();
        // return Profile_List;
      }
    } else {
      print('failed');
      loginFormKey.currentState!.validate();
    }
  }
}
