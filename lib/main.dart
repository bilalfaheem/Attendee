import 'package:attendees/LoginScreen/provider/login_password_provider.dart';
import 'package:attendees/LoginScreen/view/login_screen.dart';
import 'package:attendees/SignupScreen/provider/signup_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ],
        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
            home: LoginScreen(),
          );
        }));
  }
}
