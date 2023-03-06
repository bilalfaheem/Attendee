import 'package:attendees/EmployeeActivityScreen/function/all_activity_func.dart';
import 'package:attendees/EmployeeActivityScreen/utils/employee_activity_tile.dart';
import 'package:attendees/EmployeeActivityScreen/utils/employee_activity_widget.dart';
import 'package:attendees/MarkAttendenceScreen/utils/markattendence_tile.dart';
import 'package:attendees/QrScreen/view/qr_screen.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmployeeActivityScreen extends StatelessWidget {
  const EmployeeActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print(attendeesQr);
                      print(attendeesId);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QrScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 7),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: primaryColorLight,
                          borderRadius: BorderRadius.circular(30)),
                      child: PrettyQr(
                        elementColor: primaryColorDark,
                        // image: AssetImage(logo),
                        size: 80,
                        data: attendeesQr,
                        errorCorrectLevel: QrErrorCorrectLevel.M,
                        roundEdges: true,
                      ),
                    ),
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
                                    builder: (context) => QrScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("  Qr  ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: primaryColorLight,
                                //     shape: BoxShape.circle,
                                //   ),child: Center(child: Icon(Icons.add,color: primaryColorDark,)),
                                // )
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ],
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
          // employeeActivityTile(true),
          FutureBuilder(
              future:
                  getAllActivityFunc("all_activity", "company_id", attendeesId),
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
                        itemCount: allActivityList.length,
                        reverse: true,
                        // detailList.reviews?.length,
                        itemBuilder: (BuildContext context, int i) {
                          return employeeActivityWidget(
                              true,
                              "",
                              allActivityList[i].activityDate.toString(),
                              allActivityList[i].activityList);
                          // Text(
                          //     allActivityList[i].activityDate.toString());
                        }),
                  ]);
                } else {
                  return Container();
                }
              }),
        ],
      )),
    );
  }
}

// [
//   {
//     activity_date:"2023-03-02",
//     activity_list: [
//             {
//                 "id": "1",
//                 "status": "checkin",
//                 "is_late": "0",
//                 "user_id": "1",
//                 "date": "2023-03-02",
//                 "time": "22:31:20",
//                 "created_at": "2022-12-11 18:09:24",
//                 "company_id": "1",
//                 "name": "test",
//                 "email": "test@gmail.com",
//                 "phone": "123456789",
//                 "password": "123"
//             },
//             {
//                 "id": "1",
//                 "status": "breakin",
//                 "is_late": "0",
//                 "user_id": "1",
//                 "date": "2023-03-02",
//                 "time": "22:31:20",
//                 "created_at": "2022-12-11 18:09:24",
//                 "company_id": "1",
//                 "name": "test",
//                 "email": "test@gmail.com",
//                 "phone": "123456789",
//                 "password": "123"
//             },
//             {
//                 "id": "1",
//                 "status": "breakout",
//                 "is_late": "0",
//                 "user_id": "1",
//                 "date": "2023-03-02",
//                 "time": "22:31:20",
//                 "created_at": "2022-12-11 18:09:24",
//                 "company_id": "1",
//                 "name": "test",
//                 "email": "test@gmail.com",
//                 "phone": "123456789",
//                 "password": "123"
//             },
//             {
//                 "id": "1",
//                 "status": "checkout",
//                 "is_late": "0",
//                 "user_id": "1",
//                 "date": "2023-03-02",
//                 "time": "22:31:20",
//                 "created_at": "2022-12-11 18:09:24",
//                 "company_id": "1",
//                 "name": "test",
//                 "email": "test@gmail.com",
//                 "phone": "123456789",
//                 "password": "123"
//             }
//         ]},
//   {
//     activity_date:"2023-03-02",
//     activity_list: [
//             {
//                 "id": "1",
//                 "status": "checkin",
//                 "is_late": "1",
//                 "user_id": "1",
//                 "date": "2023-03-01",
//                 "time": "29:41:23",
//                 "created_at": "2022-12-11 18:09:24",
//                 "company_id": "1",
//                 "name": "test",
//                 "email": "test@gmail.com",
//                 "phone": "123456789",
//                 "password": "123"
//             },
//             {
//                 "id": "1",
//                 "status": "breakin",
//                 "is_late": "0",
//                 "user_id": "1",
//                 "date": "2023-03-01",
//                 "time": "29:41:23",
//                 "created_at": "2022-12-11 18:09:24",
//                 "company_id": "1",
//                 "name": "test",
//                 "email": "test@gmail.com",
//                 "phone": "123456789",
//                 "password": "123"
//             },
//             {
//                 "id": "1",
//                 "status": "breakout",
//                 "is_late": "1",
//                 "user_id": "1",
//                 "date": "2023-03-01",
//                 "time": "29:41:23",
//                 "created_at": "2022-12-11 18:09:24",
//                 "company_id": "1",
//                 "name": "test",
//                 "email": "test@gmail.com",
//                 "phone": "123456789",
//                 "password": "123"
//             },
//             {
//                 "id": "1",
//                 "status": "checkout",
//                 "is_late": "0",
//                 "user_id": "1",
//                 "date": "2023-03-01",
//                 "time": "29:41:23",
//                 "created_at": "2022-12-11 18:09:24",
//                 "company_id": "1",
//                 "name": "test",
//                 "email": "test@gmail.com",
//                 "phone": "123456789",
//                 "password": "123"
//             }
//         ]
//         }
//     ]
