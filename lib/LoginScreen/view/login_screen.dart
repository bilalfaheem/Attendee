import 'package:attendees/LoginScreen/function/login_func.dart';
import 'package:attendees/LoginScreen/provider/login_password_provider.dart';
import 'package:attendees/NavBarScreen/view/navbar_screen.dart';
import 'package:attendees/NavBarScreen/view/office_navbar_screen.dart';
import 'package:attendees/ProfileScreen/view/profile_screen.dart';
import 'package:attendees/SelectionScreen/view/selection_screen.dart';
import 'package:attendees/SignupScreen/view/signup_screen.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  bool company;
  LoginScreen({required this.company});
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Image.asset(
                  logo,
                  height: 250,
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller: loginEmailController,
                      // maxLength: 11,
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9!#@%&*+-/=?^_`{|}~]"))
                      ],
                      decoration: new InputDecoration(
                        hintText: 'Email',
                        counterText: "",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: primaryColorDark, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: highlightGrey, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromARGB(220, 247, 123, 114),
                              width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromARGB(220, 247, 123, 114),
                              width: 2.0),
                        ),
                        // errorStyle: InputDecoration.collapsed(hintText: hintText)
                      ),
                      validator: (value) {
                        if (loginApiValidation == false) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          } else if (value.length < 7) {
                            return "Enter Email";
                          } else {
                            return null;
                          }
                        } else if (loginApiValidation == true) {
                          if (loginApiStatus == "0") {
                            return "failed";
                          } else if (loginApiStatus == "1") {
                            return null;
                          } else {
                            return "Failed";
                          }
                        }
                      },
                    ),
                    Consumer<LoginPasswordVisibilityProvider>(
                        builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsets.only(top: 30, bottom: 20),
                        child: TextFormField(
                          obscureText: value.visible,
                          controller: loginPasswordController,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(186, 0, 0, 0)),
                          decoration: new InputDecoration(
                            hintText: 'Password',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  value.VisibiltyFunc();
                                },
                                child: value.visible
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: primaryColorDark, width: 2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(220, 247, 123, 114),
                                  width: 2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(220, 247, 123, 114),
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: highlightGrey, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (loginApiValidation == false) {
                              if (value == null || value.isEmpty) {
                                return "Enter Password";
                              } else if (value.length < 3) {
                                return "Enter Password";
                              } else {
                                return null;
                              }
                            } else if (loginApiValidation == true) {
                              if (loginApiStatus == "0") {
                                return "failed";
                              } else if (loginApiStatus == "1") {
                                return null;
                              } else {
                                return "Failed";
                              }
                            }
                          },
                        ),
                      );
                    }),
                    company
                        ? Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Create an account  ",
                                  style:
                                      TextStyle(fontSize: 18, color: greyColor),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()));
                                  },
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: primaryColorDark),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(
                            height: 60,
                          ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      // gradient: LinearGradient(
                      //     colors: [itemGradient2, itemGradient1])),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: primaryColorDark,
                              // shadowColor: Colors.transparent,
                              // onPrimary: itemGradient1Light,
                              // animationDuration: defaultAnimationDelay,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => NavBarScreen()));
                            loginFunction(
                                context,
                                loginFormKey,
                                loginEmailController.text.toString(),
                                company ? "company" : "employee",
                                loginPasswordController.text.toString());
                          },
                          child: Padding(
                            padding: EdgeInsets.all(14),
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
