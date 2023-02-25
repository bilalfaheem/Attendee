import 'package:attendees/NavBarScreen/provider/navbar_provider.dart';
import 'package:attendees/NavBarScreen/utils/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final navbarProvider = Provider.of<NavbarProvide>(context);
    return Scaffold(
      body: Stack(
        children: [
          Consumer<NavbarProvider>(builder: (context, value, child) {
            return screens[value.screen];
          }),
          //  screens[selectedIndex],
          Positioned(
              // bottom: 1,
              child: navBar(context))
        ],
      ),
    );
  }
}