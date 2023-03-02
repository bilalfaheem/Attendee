import 'dart:convert';
import 'package:attendees/Utils/Models/all_employee/all_employee.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:http/http.dart' as https;

List<AllEmployee> allEmployeeList = [];

Future<List> getAllEmployee() async {
  final response = await https.post(
      Uri.parse("${baseAddress}employee_list.php"),
      body: {"company_id": attendeesId});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    var dataStatus = data["status"].toString();
    if (dataStatus == "1") {
      allEmployeeList.clear();
      var dataResponse = data["response"];
      for (Map i in dataResponse) {
        allEmployeeList.add(AllEmployee.fromJson(i));
      }
    } else {
      allEmployeeList.clear();
      print(allEmployeeList.length);
    }
    return allEmployeeList;
  } else {
    return allEmployeeList;
  }
}
