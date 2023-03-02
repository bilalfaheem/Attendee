import 'package:attendees/NavBarScreen/provider/navbar_provider.dart';
import 'package:attendees/NavBarScreen/utils/office_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfficeNavBarScreen extends StatelessWidget {
  const OfficeNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final navbarProvider = Provider.of<NavbarProvide>(context);
    return Scaffold(
      body: Stack(
        children: [
          Consumer<OfficeNavbarProvider>(builder: (context, value, child) {
            return officeScreens[value.screen];
          }),
          //  screens[selectedIndex],
          Positioned(
              // bottom: 1,
              child: officeNavBar(context))
        ],
      ),
    );
  }
}
