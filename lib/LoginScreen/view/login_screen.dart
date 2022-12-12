import 'package:attendees/LoginScreen/provider/login_password_provider.dart';
import 'package:attendees/ProfileScreen/view/profile_screen.dart';
import 'package:attendees/SignupScreen/view/signup_screen.dart';
import 'package:attendees/Utils/colors.dart';
import 'package:attendees/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> Login_Form_Key = GlobalKey<FormState>();
  TextEditingController Login_Phone_Controller = TextEditingController();
  TextEditingController Login_Password_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Logo),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: Login_Form_Key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller: Login_Phone_Controller,
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                        // if (Login_Api_Validation == false) {
                        //   if (value == null || value.isEmpty)
                        //     return "Enter Mobile Number";
                        //   else if (value.length < 11) {
                        //     return "Enter Correct Number";
                        //   } else {
                        //     return null;
                        //   }
                        // } else if (Login_Api_Validation == true) {
                        //   if (Login_Api_Status == "404") {
                        //     return "Failed";
                        //   } else if (Login_Api_Status == "200") {
                        //     return null;
                        //   }
                        // }
                      },
                    ),
                    Consumer<LoginPasswordVisibilityProvider>(
                        builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsets.only(top: 30, bottom: 20),
                        child: TextFormField(
                          obscureText: value.visible,
                          controller: Login_Password_Controller,
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
                            // if (Login_Api_Validation == false) {
                            //   if (value == null || value.isEmpty)
                            //     return "Enter Password";
                            //   else {
                            //     return null;
                            //   }
                            // } else if (Login_Api_Validation == true) {
                            //   if (Login_Api_Status == "404") {
                            //     return "Failed";
                            //   } else if (Login_Api_Status == "200") {
                            //     return null;
                            //   }
                            // }
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
                            "Create an account  ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(170, 0, 0, 0)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: maroon),
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
                              primary: Color.fromARGB(166, 0, 0, 0),
                              // shadowColor: Colors.transparent,
                              // onPrimary: itemGradient1Light,
                              // animationDuration: defaultAnimationDelay,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()));
                            // Login_Api_Func(
                            //     context,
                            //     Login_Form_Key,
                            //     Login_Phone_Controller.text.toString(),
                            //     Login_Password_Controller.text.toString());
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
