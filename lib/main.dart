import 'package:attendees/LoginScreen/provider/login_password_provider.dart';
import 'package:attendees/NavBarScreen/provider/navbar_provider.dart';
import 'package:attendees/SelectionScreen/view/selection_screen.dart';
import 'package:attendees/SignupScreen/provider/signup_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginPasswordVisibilityProvider()),
          ChangeNotifierProvider(create: (_) => SignupPasswordVisibilityProvider()),
          ChangeNotifierProvider(create: (_) => NavbarProvider())
        ],
        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily:  GoogleFonts.nunito().fontFamily
            ),
            home: SelectionScreen(),
          );
        }));
  }
}
