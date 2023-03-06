import 'package:attendees/EmployeeActivityScreen/utils/employee_activity_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget employeeActivityWidget(
    bool company, String name, String date, iteration) {
  return Column(
    children: [
      Text(
        DateFormat('dd MMM yyy').format(DateTime.parse("${date} 22:02:34")),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      SizedBox(
        height: 7,
      ),
      ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: iteration.length,
          reverse: true,
          // detailList.reviews?.length,
          itemBuilder: (BuildContext context, int i) {
            return employeeActivityTile(
                iteration[i].status.toString().toLowerCase() == "checkin"
                    ? true
                    : false,
                company ? iteration[i].name.toString() : name,
                iteration[i].status.toString(),
                iteration[i].createdAt.toString());
          })
    ],
  );
}
