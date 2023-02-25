import 'package:attendees/LoginScreen/provider/login_password_provider.dart';
import 'package:attendees/LoginScreen/view/login_screen.dart';
import 'package:attendees/ProfileScreen/view/profile_screen.dart';
import 'package:attendees/SignupScreen/view/signup_screen.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SelectionScreen extends StatelessWidget {
  SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(logo),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(166, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                      company: true,
                                    )));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 75),
                        child: Text("Company",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  // gradient: LinearGradient(
                  //     colors: [itemGradient2, itemGradient1])),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(166, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                      company: false,
                                    )));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 75),
                        child: Text("Employee",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
