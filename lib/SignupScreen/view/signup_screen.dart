import 'package:attendees/LoginScreen/view/login_screen.dart';
import 'package:attendees/SignupScreen/function/signup_func.dart';
import 'package:attendees/SignupScreen/provider/signup_password_provider.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                logo,
                height: 220,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: signUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: signupNameController,
                        maxLength: 15,
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9-]"))
                        ],
                        decoration: new InputDecoration(
                          hintText: 'Company',
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
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
                          if (signupApiValidation == false) {
                            if (value == null || value.isEmpty)
                              return "Company Name";
                            else if (value.length < 3) {
                              return "Company Name";
                            } else {
                              return null;
                            }
                          } else if (signupApiValidation == true) {
                            if (signupApiStatus == "4") {
                              return "Name Already Exist";
                            } else if (signupApiStatus == "1") {
                              return null;
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: signupEmailController,
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9!#@%&*+-/=?^_`{|}~]"))
                        ],
                        decoration: new InputDecoration(
                          hintText: 'Email',
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
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
                          if (signupApiValidation == false) {
                            if (value == null || value.isEmpty) {
                              return "Enter Email";
                            } else if (value.length < 7) {
                              return "Enter Email";
                            } else {
                              return null;
                            }
                          } else if (signupApiValidation == true) {
                            if (signupApiStatus == "0") {
                              return "failed";
                            } else if (signupApiStatus == "1") {
                              return null;
                            } else if (signupApiStatus == "2") {
                              return "Email Already Exist";
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: signupPhoneController,
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: new InputDecoration(
                          hintText: 'Contact Number',
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
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
                          if (signupApiValidation == false) {
                            if (value == null || value.isEmpty)
                              return "Contact Number";
                            else if (value.length < 11) {
                              return "Contact Number";
                            } else {
                              return null;
                            }
                          } else if (signupApiValidation == true) {
                            if (signupApiStatus == "0") {
                              return "failed";
                            } else if (signupApiStatus == "1") {
                              return null;
                            }
                          }
                        },
                      ),
                    ),
                    Consumer<SignupPasswordVisibilityProvider>(
                        builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: TextFormField(
                          obscureText: value.visible,
                          controller: signupPasswordController,
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
                            if (signupApiValidation == false) {
                              if (value == null || value.isEmpty)
                                return "Enter Password";
                              else {
                                return null;
                              }
                            } else if (signupApiValidation == true) {
                              if (signupApiStatus == "0") {
                                return "failed";
                              } else if (signupApiStatus == "1") {
                                return null;
                              }
                            }
                          },
                        ),
                      );
                    }),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account  ",
                            style: TextStyle(fontSize: 18, color: greyColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColorDark),
                            ),
                          )
                        ],
                      ),
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
                            signupFunction(
                                context,
                                signUpFormKey,
                                signupNameController.text.toString(),
                                signupEmailController.text.toString(),
                                signupPhoneController.text.toString(),
                                signupPasswordController.text.toString());
                          },
                          child: Padding(
                            padding: EdgeInsets.all(14),
                            child: Text("Signup",
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
