import 'package:attendees/MarkAttendenceScreen/utils/markattendence_tile.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MarkAttendenceScreen extends StatelessWidget {
  const MarkAttendenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                   color: primaryColorLight,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Image.asset(scanner,height: 100,color:primaryColorDark),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Text("Attendence",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600),),
              ),
            ],
          ),
          MarkAttendenceTile(true),
          MarkAttendenceTile(false)
        ],
      )),
    );
  }
}