import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget employeeActivityTile(
    bool checkIn, String name, String status, String date) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  status,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('hh:mm a').format(DateTime.parse(date)),
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ],
    ),
  );
}
