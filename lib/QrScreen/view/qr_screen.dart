import 'package:attendees/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';



class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Center(
        child: Container(
          width: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                      // margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: primaryColorLight,
                          borderRadius: BorderRadius.circular(30)),
                      child: PrettyQr(
                        elementColor: primaryColorDark,
                        // image: AssetImage(logo),
                        size: 200,
                        data: 'https://www.google.ru',
                        roundEdges: true,
                      ),
                    ),Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                                   margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: primaryColorLight,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(child: Text("Company Name",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: primaryColorDark),))
                                ),
                      ],
                    ),
            ],
          ),
        ),
      )),
    );
  }
}