import 'dart:async';
import 'dart:convert';

import 'package:attendees/NavBarScreen/view/navbar_screen.dart';
import 'package:attendees/NavBarScreen/view/office_navbar_screen.dart';
import 'package:attendees/Utils/Functions/login_shared_func.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

bool addApiValidation = false;
String addApiStatus = "c";

Future<void> addEmployeeFunction(context, addFormKey, String name, String email,
    String phone, String password) async {
  addApiValidation = false;
  if (addFormKey.currentState!.validate()) {
    final response =
        await post(Uri.parse('${baseAddress}employee_create.php'), body: {
      "company_id": attendeesId,
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });

    if (response.statusCode == 200) {
      print("login Api Func hitttttttttttttttttttt");
      final data = jsonDecode(response.body.toString());

      print('Post Succesfull');
      final addDataStatus = data["status"].toString();
      print("Status $addDataStatus");

      addApiStatus = addDataStatus;
      addApiValidation = true;

// validation
      addFormKey.currentState!.validate();

      if (addDataStatus == '1') {
        Navigator.pop(context);
      } else if (addDataStatus == "0") {
        print("some thing has gone wrong");
        addFormKey.currentState!.validate();
        // return Profile_List;
      }
    } else {
      print('failed');
      addFormKey.currentState!.validate();
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