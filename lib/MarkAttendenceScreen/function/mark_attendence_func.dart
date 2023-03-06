import 'dart:convert';
import 'package:attendees/Utils/constant.dart';
import 'package:http/http.dart' as https;

Future markAttendenceFunc(String id, String code) async {
  final response = await https.post(Uri.parse("${baseAddress}qr_scan.php"),
      body: {"user_id": id, "qr_code": code});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
    var dataStatus = data["status"].toString();
    var dataMsg = data["message"].toString();
    // ["status"].toString();
    if (dataStatus == "200") {
      return dataMsg;
    } else if (dataStatus == "201") {
      return dataMsg;
    } else if (dataStatus == "400") {
      return dataMsg;
    } else {
      return dataMsg;
    }
  } else {
    return "dataMsg";
  }
}
