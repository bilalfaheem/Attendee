import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget ProfileTile() {
  return Container(
    margin: EdgeInsets.only(top: 15),
    child: ListTile(
      horizontalTitleGap: 10,
      selected: false,
      contentPadding: EdgeInsets.symmetric(
          horizontal: 15, vertical: 3),
      leading: Image.asset(
        Phone,
        color: maroon,
        height: 30,
      ),
      title: Text(
        "Company Name",
        // Single_User_List[0].ownerCnic.toString(),

        // User_login_Cnic,
        //   "${Profile_List[0].ownerCnic
        // }",
        // ownerCnic}",
        // "${User_Login_Data["full_name"]}",
        // style: GoogleFonts.ubuntu(
        //     fontSize: _size.height * 0.025, color: Colors.black)
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      tileColor: highlightLightGrey,
    ),
  );
}
