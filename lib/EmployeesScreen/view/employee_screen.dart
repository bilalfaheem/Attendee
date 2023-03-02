import 'package:attendees/AddEmployeesScreen/view/addemployees_screen.dart';
import 'package:attendees/EmployeeActivityScreen/utils/employee_activity_tile.dart';
import 'package:attendees/EmployeesScreen/function/all_employee_func.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddEmployeeScreen()));
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
                                        ),
                                        child: Center(
                                            child: Icon(
                                          Icons.add,
                                          color: primaryColorDark,
                                        )),
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
            FutureBuilder(
                future: getAllEmployee(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: primaryColorDark,
                        ))
                      ],
                    );
                  } else if (snapshot.hasData) {
                    return Column(
                      children: [
                      allEmployeeList.length == 0
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: primaryColorDark),
                              child: Text("No Employee Yet",
                                  style: TextStyle(
                                      // fontSize: constraints.maxHeight * 0.09,
                                      color: primaryColorDark)),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                               physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: allEmployeeList.length,
                              reverse: true,
                              // detailList.reviews?.length,
                              itemBuilder: (BuildContext context, int i) {
                                return employeeTile(
                                    context, allEmployeeList[i].name.toString(), allEmployeeList[i].email.toString(), allEmployeeList[i].password.toString());
                              }),
                              SizedBox(height: 110,)
                    ]);
                  } else {
                    return Container();
                  }
                }),
          ],
        )),
      ),
    );
  }
}
