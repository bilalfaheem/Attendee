import 'package:attendees/QrScreen/view/qr_screen.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';


class EmployeeDetailScreeb extends StatelessWidget {
  const EmployeeDetailScreeb({super.key});

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
            margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 25,
            vertical: 15),
            decoration: BoxDecoration(color: primaryColorLight,
            borderRadius: BorderRadius.circular(20),),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Name:",style: TextStyle(
                      color: greyColor,
                      fontSize: 20,
                      
                    ),)
                  ],
                )
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
          // employeeTile("Ahsan Junaid")
        ],
      )),
    );
  }
}
