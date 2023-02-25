import 'package:attendees/ProfileScreen/utils/ProfileTile/profile_tile.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.asset(
            logo,
            height: 200,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [ProfileTile(), ProfileTile()],
              ))
        ],
      )),
    );
  }
}
