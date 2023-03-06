import 'package:attendees/EmployeeActivityScreen/utils/employee_activity_widget.dart';
import 'package:attendees/EmployeeDetailScreen/function/employee_activity_func.dart';
import 'package:attendees/MarkAttendenceScreen/function/mark_attendence_func.dart';
import 'package:attendees/MarkAttendenceScreen/utils/markattendence_tile.dart';
import 'package:attendees/MarkAttendenceScreen/utils/success_alert_widget.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

String _scanBarcode = 'Unknown';

class MarkAttendenceScreen extends StatefulWidget {
  const MarkAttendenceScreen({super.key});

  @override
  State<MarkAttendenceScreen> createState() => _MarkAttendenceScreenState();
}

class _MarkAttendenceScreenState extends State<MarkAttendenceScreen> {
  Future<void> scanQr() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#004b99', 'Cancel', true, ScanMode.QR);
      if (barcodeScanRes != "-1") {
        print("qr scanned");
        final mark = await markAttendenceFunc(attendeesId, barcodeScanRes);
        successAlert(context, mark);
        // scanApiFunc(context, barcodeScanRes.toString());
        // ScanApiFunc(context, barcodeScanRes.toString(),
        //     Credential_List.first.response!.walletId.toString());
      } else {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Profile2()));
      }
      print("$barcodeScanRes barcodeScannnnResult");
      print("barcodeScannnnResult");
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      print(
          "qr scannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn Qr Scan $_scanBarcode");
      _scanBarcode = barcodeScanRes;
    });
  }

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
                  scanQr();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: primaryColorLight,
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(scanner,
                      height: 100, color: primaryColorDark),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Attendence",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
              future: getEmployeeActivityFunc(
                  "my_activity", "user_id", attendeesId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: primaryColorDark,
                      ))
                    ],
                  );
                } else if (snapshot.hasData) {
                  return Column(children: [
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: employeeActivityList.length,
                        reverse: true,
                        // detailList.reviews?.length,
                        itemBuilder: (BuildContext context, int i) {
                          return employeeActivityWidget(
                              false,
                              attendeesName,
                              employeeActivityList[i].activityDate.toString(),
                              employeeActivityList[i].activityList);
                          // Text(
                          //     allActivityList[i].activityDate.toString());
                        }),
                  ]);
                } else {
                  return Container();
                }
              }),
        ],
      )),
    );
  }
}
