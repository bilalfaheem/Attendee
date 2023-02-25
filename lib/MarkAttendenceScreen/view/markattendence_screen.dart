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
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryColorLight,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Image.asset(scanner),
          ),
          
        ],
      )),
    );
  }
}