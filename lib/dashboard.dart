import 'dart:math';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  @override
  dashboardScreen createState() => dashboardScreen();
}

class dashboardScreen extends State<dashboard> {
  var emailID;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    emailID = ModalRoute.of(context)?.settings.arguments;

    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Color(0xff1879C0),
        resizeToAvoidBottomInset: false, // set it to false

        body: SafeArea(
            child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Center(
                  child: Padding(
                      padding:
                          EdgeInsets.only(top: mediaQuery.size.height * 0.1),
                      child: Text(
                        "Wecome... \n ${emailID['email']} ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: mediaQuery.size.width * 0.065),
                      )),
                ))));
  }
}
