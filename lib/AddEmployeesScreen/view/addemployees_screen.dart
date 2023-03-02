import 'package:attendees/AddEmployeesScreen/function/add_employee_func.dart';
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
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  TextEditingController addNameController = TextEditingController();
  TextEditingController addEmailController = TextEditingController();
  TextEditingController addPhoneController = TextEditingController();
  TextEditingController addPasswordController = TextEditingController();

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
                key: addFormKey,
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
                        controller: addNameController,
                        maxLength: 15,
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9-]"))
                        ],
                        decoration: new InputDecoration(
                          hintText: 'Name',
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
                          if (addApiValidation == false) {
                            if (value == null || value.isEmpty)
                              return "Company Name";
                            else if (value.length < 3) {
                              return "Company Name";
                            } else {
                              return null;
                            }
                          } else if (addApiValidation == true) {
                            if (addApiStatus == "4") {
                              return "Name Already Exist";
                            } else if (addApiStatus == "1") {
                              return null;
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: addEmailController,
                        maxLength: 20,
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
                          if (addApiValidation == false) {
                            if (value == null || value.isEmpty) {
                              return "Enter Email";
                            } else if (value.length < 7) {
                              return "Enter Email";
                            } else {
                              return null;
                            }
                          } else if (addApiValidation == true) {
                            if (addApiStatus == "0") {
                              return "failed";
                            } else if (addApiStatus == "1") {
                              return null;
                            } else if (addApiStatus == "2") {
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
                        controller: addPhoneController,
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
                          if (addApiValidation == false) {
                            if (value == null || value.isEmpty)
                              return "Contact Number";
                            else if (value.length < 11) {
                              return "Contact Number";
                            } else {
                              return null;
                            }
                          } else if (addApiValidation == true) {
                            if (addApiStatus == "0") {
                              return "failed";
                            } else if (addApiStatus == "1") {
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
                          controller: addPasswordController,
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
                            if (addApiValidation == false) {
                              if (value == null || value.isEmpty)
                                return "Enter Password";
                              else if (value.length < 8) {
                              return "Min length 8";
                            } 
                              else {
                                return null;
                              }
                            } else if (addApiValidation == true) {
                              if (addApiStatus == "0") {
                                return "failed";
                              } else if (addApiStatus == "1") {
                                return null;
                              }
                            }
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
                              addEmployeeFunction(
                                  context,
                                  addFormKey,
                                  addNameController.text.toString(),
                                  addEmailController.text.toString(),
                                  addPhoneController.text.toString(),
                                  addPasswordController.text.toString());
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
