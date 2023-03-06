import 'dart:convert';
import 'package:attendees/Utils/Models/activity_model/activity_model.dart';
import 'package:attendees/Utils/Models/all_employee/all_employee.dart';
import 'package:attendees/Utils/Models/employee_activity_model/employee_activity_model.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:http/http.dart' as https;

List<EmployeeActivityModel> employeeActivityList = [];

Future<List> getEmployeeActivityFunc(
    String address, String company, String id) async {
  final response = await https
      .post(Uri.parse("${baseAddress}${address}.php"), body: {company: id});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    var dataStatus = data[0]["status"].toString();
    // ["status"].toString();
    if (dataStatus == "1") {
      employeeActivityList.clear();
      var dataResponse = data[0]["response"];
      for (Map i in dataResponse) {
        employeeActivityList.add(EmployeeActivityModel.fromJson(i));
      }
    } else {
      employeeActivityList.clear();
      print(employeeActivityList.length);
    }
    return employeeActivityList;
  } else {
    return employeeActivityList;
  }
}
