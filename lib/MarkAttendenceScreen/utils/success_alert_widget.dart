import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendees/Utils/colors.dart';

void successAlert(BuildContext context, msg) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Color.fromARGB(255, 237, 241, 250).withOpacity(0.4),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          // width: ,
          height: 210,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(logo, width: 120, height: 100),
              ]),
              Material(
                color: Colors.white,
                child: Text(msg,
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                        fontSize: 22,
                        color: primaryColorDark,
                        fontWeight: FontWeight.w600)),
              ),
              //  Material(
              //   color: navBarColor,
              //   child: Text("You have successfully pay your rent.",
              //       maxLines: 2,
              //       style: GoogleFonts.ubuntu(
              //           fontSize: 14.5, color: greyColor)),
              // ),
              // Container(
              //   height: 60,
              //   child: Expanded(
              //     child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                   backgroundColor: primaryColorDark ,
              //                   padding: EdgeInsets.symmetric(
              //                       vertical: 0, horizontal: 60),
              //                   //  MaterialStatePropertyAll(EdgeInsets.all(50)),
              //                   textStyle: TextStyle(
              //                       fontSize: 20, fontWeight: FontWeight.w500),
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(60))),
              //               onPressed: () {
              //                 // paymentFailedAlert(context, "Error_msg");
              //               },
              //               child: Text(
              //                 "View E-Receipt",
              //                 style: TextStyle(
              //                     fontSize: 17,
              //                     color:  Colors.white,
              //                     fontWeight: FontWeight.bold),
              //               )),
              //   ),
              // ),
              // ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               backgroundColor: greyColor,
              //               padding: EdgeInsets.symmetric(
              //                   vertical: 18, horizontal: 120),
              //               //  MaterialStatePropertyAll(EdgeInsets.all(50)),
              //               textStyle: TextStyle(
              //                   fontSize: 20, fontWeight: FontWeight.w500),
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(60))),
              //           onPressed: () {
              //             // paymentFailedAlert(context, "Error_msg");
              //           },
              //           child: Text(
              //             "Cancel",
              //             style: TextStyle(
              //                 fontSize: 17,
              //                 color:  Colors.black,
              //                 fontWeight: FontWeight.bold),
              //           ))
            ],
          ),
          //  SizedBox.expand(child: FlutterLogo()),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
