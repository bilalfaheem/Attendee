import 'package:attendees/EmployeeActivityScreen/utils/employee_activity_widget.dart';
import 'package:attendees/EmployeeDetailScreen/function/employee_activity_func.dart';
import 'package:attendees/EmployeeDetailScreen/provider/employee_detail_provider.dart';
import 'package:attendees/EmployeeActivityScreen/function/all_activity_func.dart';
import 'package:attendees/QrScreen/view/qr_screen.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeDetailScreen extends StatelessWidget {
  String name, email, password, id;
  EmployeeDetailScreen(
      {required this.name,
      required this.email,
      required this.password,
      required this.id});

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
                      MaterialPageRoute(builder: (context) => QrScreen()));
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
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             AddEmployeeScreen()));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("  Details  ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ],
                                ),
                              )),
                        ),
                      )
                    ])),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: EdgeInsets.fromLTRB(20, 20, 5, 20),
            decoration: BoxDecoration(
              color: primaryColorLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Text(
                        ":",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "$email",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Consumer<EmployeeDetailProvider>(
                        builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // value.visible
                          //     ? Text(
                          //         "$password",
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 20,
                          //         ),
                          //       )
                          //     : Text(""),
                          GestureDetector(
                              onTap: () {
                                value.visibiltyFunc();
                              },
                              child: Icon(value.visible
                                  ? Icons.visibility_off
                                  : Icons.visibility))
                        ],
                      );
                    })
                  ],
                ),
                // Expanded(
                //   child: Column(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Icon(Icons.visibility)
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Activities",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          FutureBuilder(
              future: getEmployeeActivityFunc("my_activity", "user_id", id),
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
                  return Column(children: [
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: employeeActivityList.length,
                        reverse: true,
                        // detailList.reviews?.length,
                        itemBuilder: (BuildContext context, int i) {
                          return employeeActivityWidget(
                              false,
                              name,
                              employeeActivityList[i].activityDate.toString(),
                              employeeActivityList[i].activityList);
                          // Text(
                          //     allActivityList[i].activityDate.toString());
                        }),
                  ]);
                } else {
                  return Container();
                }
              }),
          // employeeTile("Ahsan Junaid")
        ],
      )),
    );
  }
}
