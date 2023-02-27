import 'package:attendees/AddEmployeesScreen/view/addemployees_screen.dart';
import 'package:attendees/EmployeeActivityScreen/utils/employee_activity_tile.dart';
import 'package:attendees/EmployeesScreen/utils/employee_tile.dart';
import 'package:attendees/MarkAttendenceScreen/utils/markattendence_tile.dart';
import 'package:attendees/QrScreen/view/qr_screen.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddEmployeeScreen()));
                },
                child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(children: [
                  Image.asset(
                    logo,
                    height: 120,
                  ),
                  Center(
                      child: Container(
                        // margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                          
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                                primary: primaryColorDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddEmployeeScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("  Add  ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: primaryColorLight,
                                              shape: BoxShape.circle,
                                            ),child: Center(child: Icon(Icons.add,color: primaryColorDark,)),
                                          )
                                ],
                              ),
                            )),
                      ),
                    )
                ])),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "All Employees",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          employeeTile(context,"Ahsan Junaid")
        ],
      )),
    );
  }
}
