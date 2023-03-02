import 'package:attendees/NavBarScreen/provider/navbar_provider.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget navBar(context) {
  // final navBarProvider = Provider.of<NavbarProvide>(context, listen: false);
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 19, horizontal: 19),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0,
              spreadRadius: 1.0,
              offset: Offset(-1.0, -1.0)),
        ], color: navBarColor, borderRadius: BorderRadius.circular(20)),
        child: Consumer<NavbarProvider>(builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  value.changeScreen(0);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  // margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                  decoration: BoxDecoration(
                      color: value.screen == 0
                          ? primaryColorDark
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Image.asset(
                        home,
                        color:
                            value.screen == 0 ? Colors.white : primaryColorDark,
                        height: 20,
                      ),
                      Text(
                        "  Home",
                        style: TextStyle(
                            color: value.screen == 0
                                ? Colors.white
                                : primaryColorDark,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  value.changeScreen(1);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  // margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                  decoration: BoxDecoration(
                      color: value.screen == 1
                          ? primaryColorDark
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Image.asset(
                        profile,
                        color:
                            value.screen == 1 ? Colors.white : primaryColorDark,
                        height: 20,
                      ),
                      Text(
                        "  Profile",
                        style: TextStyle(
                            color: value.screen == 1
                                ? Colors.white
                                : primaryColorDark,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    ],
  );
}
