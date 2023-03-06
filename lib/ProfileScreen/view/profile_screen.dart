import 'package:attendees/ProfileScreen/utils/ProfileTile/profile_tile.dart';
import 'package:attendees/Utils/Functions/logout_func.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 45),
            child: Image.asset(
              logo,
              height: 170,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  attendeesType == "company"
                      ? Container()
                      : ProfileTile(profile, attendeesName),
                  ProfileTile(
                      office,
                      attendeesType == "company"
                          ? attendeesName
                          : attendeesCompany),
                  ProfileTile(email, attendeesEmail),
                  ProfileTile(phone, attendeesPhone)
                ],
              )),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: primaryColorDark,
                      // shadowColor: Colors.transparent,
                      // onPrimary: itemGradient1Light,
                      // animationDuration: defaultAnimationDelay,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    logoutFunc(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    child: Text("Logout",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  )),
            ),
          )
        ],
      )),
    );
  }
}
