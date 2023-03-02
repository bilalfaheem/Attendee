import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MarkAttendenceTile(bool checkIn) {
  return Container(
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
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: primaryColorLight),
              child: Image.asset(checkIn ? checkin : checkout,
                  height: 40, color: orange),
            ),
            Text(
              checkIn ? "Check In" : "Check out",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "12:03 Pm",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ],
    ),
  );
}
