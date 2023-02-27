import 'package:attendees/EmployeeDetailScreen/view/employee_detail_screen.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget employeeTile(context,String name) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => EmployeeDetailScreen(name: name, email: "email", password: "password")));
    },
    child: Container(
      margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: primaryColorLight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 8, left: 8),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Text(
                    name[0],
                    style: TextStyle(
                        color: primaryColorDark,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
