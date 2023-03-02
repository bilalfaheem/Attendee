import 'dart:async';
import 'dart:convert';

import 'package:attendees/NavBarScreen/view/navbar_screen.dart';
import 'package:attendees/NavBarScreen/view/office_navbar_screen.dart';
import 'package:attendees/Utils/Functions/login_shared_func.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

bool signupApiValidation = false;
String signupApiStatus = "c";

Future<void> signupFunction(
    context, signupFormKey,String name, String email, String phone, String password) async {
  signupApiValidation = false;
  if (signupFormKey.currentState!.validate()) {
    final response = await post(Uri.parse('${baseAddress}signup.php'), body: {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });

    if (response.statusCode == 200) {
      print("login Api Func hitttttttttttttttttttt");
      final data = jsonDecode(response.body.toString());

      print('Post Succesfull');
      final signupDataStatus = data["status"].toString();
      print("Status $signupDataStatus");

      signupApiStatus = signupDataStatus;
      signupApiValidation = true;

// validation
      signupFormKey.currentState!.validate();

      if (signupDataStatus == '1') {
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
            "company",
            "null");

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
                  builder: (context) =>OfficeNavBarScreen()),
              ((route) => false));
        });
      } else if (signupDataStatus == "0") {
        print("some thing has gone wrong");
        signupFormKey.currentState!.validate();
        // return Profile_List;
      }
    } else {
      print('failed');
      signupFormKey.currentState!.validate();
    }
  }
}

// {
//     "status": 1,
//     "message": "Successfully Company Created",
//     "response": {
//         "id": "6",
//         "name": "company",
//         "phone": "678902345",
//         "employee_count": null,
//         "email": "company@gmail.com",
//         "password": "cGFraXN0YW4=",
//         "qr_code": "Z2ZnNjQwMGZjZTVjNGY1YjkuNTU1MjUxMzM=",
//         "created_at": "2023-03-03 00:45:41",
//         "updated_at": null,
//         "is_active": "0"
//     }
// }