import 'package:attendees/EmployeeDetailScreen/provider/employee_detail_provider.dart';
import 'package:attendees/LoginScreen/provider/login_password_provider.dart';
import 'package:attendees/NavBarScreen/provider/navbar_provider.dart';
import 'package:attendees/NavBarScreen/view/navbar_screen.dart';
import 'package:attendees/NavBarScreen/view/office_navbar_screen.dart';
import 'package:attendees/SelectionScreen/view/selection_screen.dart';
import 'package:attendees/SignupScreen/provider/signup_password_provider.dart';
import 'package:attendees/Utils/Functions/shared_func.dart';
import 'package:attendees/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedFunc();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => LoginPasswordVisibilityProvider()),
          ChangeNotifierProvider(
              create: (_) => SignupPasswordVisibilityProvider()),
          ChangeNotifierProvider(create: (_) => NavbarProvider()),
          ChangeNotifierProvider(create: (_) => OfficeNavbarProvider()),
          ChangeNotifierProvider(create: (_) => EmployeeDetailProvider())
        ],
        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
            theme: ThemeData(fontFamily: GoogleFonts.nunito().fontFamily),
            home: attendeesType == "company"
                ? OfficeNavBarScreen()
                : attendeesType == "employee"
                    ? NavBarScreen()
                    : SelectionScreen(),
          );
        }));
  }
}
