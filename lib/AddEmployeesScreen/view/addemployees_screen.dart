import 'package:attendees/EmployeeActivityScreen/view/employee_activity_screen.dart';
import 'package:attendees/LoginScreen/view/login_screen.dart';
import 'package:attendees/SignupScreen/provider/signup_password_provider.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddEmployeeScreen extends StatelessWidget {
  AddEmployeeScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> Sign_Form_Key = GlobalKey<FormState>();
  TextEditingController Sign_Email_Controller = TextEditingController();
  TextEditingController Sign_phone_Controller = TextEditingController();
  TextEditingController Sign_Password_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(children: [
                  Image.asset(
                    logo,
                    height: 200,
                  ),
                  Container(
                      child: Text(
                    "Add Employee",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  )),
                ])),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: Sign_Form_Key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: Sign_Email_Controller,
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        decoration: new InputDecoration(
                          hintText: 'Email',
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: maroon, width: 2.0),
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
                          // if (Sign_Api_Validation == false) {
                          //   if (value == null || value.isEmpty)
                          //     return "Enter Mobile Number";
                          //   else if (value.length < 11) {
                          //     return "Enter Correct Number";
                          //   } else {
                          //     return null;
                          //   }
                          // } else if (Sign_Api_Validation == true) {
                          //   if (Sign_Api_Status == "404") {
                          //     return "Failed";
                          //   } else if (Sign_Api_Status == "200") {
                          //     return null;
                          //   }
                          // }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: Sign_phone_Controller,
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: new InputDecoration(
                          hintText: 'Mobile Number',
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: maroon, width: 2.0),
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
                          // if (Sign_Api_Validation == false) {
                          //   if (value == null || value.isEmpty)
                          //     return "Enter Mobile Number";
                          //   else if (value.length < 11) {
                          //     return "Enter Correct Number";
                          //   } else {
                          //     return null;
                          //   }
                          // } else if (Sign_Api_Validation == true) {
                          //   if (Sign_Api_Status == "404") {
                          //     return "Failed";
                          //   } else if (Sign_Api_Status == "200") {
                          //     return null;
                          //   }
                          // }
                        },
                      ),
                    ),
                    Consumer<SignupPasswordVisibilityProvider>(
                        builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: TextFormField(
                          obscureText: value.visible,
                          controller: Sign_Password_Controller,
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
                              borderSide: BorderSide(color: maroon, width: 2.0),
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
                            // if (Sign_Api_Validation == false) {
                            //   if (value == null || value.isEmpty)
                            //     return "Enter Password";
                            //   else {
                            //     return null;
                            //   }
                            // } else if (Sign_Api_Validation == true) {
                            //   if (Sign_Api_Status == "404") {
                            //     return "Failed";
                            //   } else if (Sign_Api_Status == "200") {
                            //     return null;
                            //   }
                            // }
                          },
                        ),
                      );
                    }),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: primaryColorDark,
                                // shadowColor: Colors.transparent,
                                // onPrimary: itemGradient1Light,
                                // animationDuration: defaultAnimationDelay,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EmployeeActivityScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 50),
                              child: Text("Add",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            )),
                      ),
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
