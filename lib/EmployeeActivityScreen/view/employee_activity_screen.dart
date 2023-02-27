import 'package:attendees/EmployeeActivityScreen/utils/employee_activity_tile.dart';
import 'package:attendees/MarkAttendenceScreen/utils/markattendence_tile.dart';
import 'package:attendees/QrScreen/view/qr_screen.dart';
import 'package:attendees/Utils/colors.dart';
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QrScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20,bottom: 7),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: primaryColorLight,
                          borderRadius: BorderRadius.circular(30)),
                      child: PrettyQr(
                        elementColor: primaryColorDark,
                        // image: AssetImage(logo),
                        size: 80,
                        data: 'https://www.google.ru',
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
                                      builder: (context) =>
                                          QrScreen()));
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
          employeeActivityTile(true)
        ],
      )),
    );
  }
}
