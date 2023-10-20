import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  @override
  signupScreen createState() => signupScreen();
}

class signupScreen extends State<signup> {
  var name = "";
  var phone = "";
  var email = "";
  var pass = "";
  var userData = null;
  bool valid_email = false;

  signupAPI() async {
    var url = "https://snapkaro.com/eazyrooms_staging/api/user_registeration";

    final response = await http.post(Uri.parse(url), body: {
      "user_firstname": name,
      "user_email": email,
      "user_phone": phone,
      "user_password": pass,
      "user_lastname": " hi",
      "user_city": "Hyderabad",
      "user_zipcode": "500072"
    });

    // var response = await http.get(url);
    if (response.statusCode == 200) {
      // var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(response);
      Navigator.pushNamed(context, '/signin');

      // setState(() {
      //   userData = jsonResponse;
      // });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Color(0xff1879C0),
        resizeToAvoidBottomInset: false, // set it to false

        body: SafeArea(
            child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              SizedBox(
                height: mediaQuery.size.height * 0.2,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(mediaQuery.size.width * 0.11),
                        topLeft: Radius.circular(mediaQuery.size.width * 0.11)),
                    // borderRadius: BorderRadius.all(
                    //     Radius.circular(mediaQuery.size.width * 0.11)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 2,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  height: mediaQuery.size.height * 0.97,
                  width: mediaQuery.size.width,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: mediaQuery.size.height *
                                  0.04, // increase size
                              bottom: mediaQuery.size.width * 0.15),
                          child: Center(
                            child: Text(
                              "Create Account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: mediaQuery.size.width * 0.05,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: mediaQuery.size.width * 0.1,
                                bottom: mediaQuery.size.height * 0.01),
                            child: Text(
                              "Full Name",
                              style: TextStyle(
                                  fontSize: mediaQuery.size.width * 0.035,
                                  color: Colors.black),
                              textAlign: TextAlign.start,
                            ),
                          )),
                      Container(
                        width: mediaQuery.size.width * 0.8,
                        height: mediaQuery.size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          onChanged: (text) {
                            if (text.length != 0) {
                              setState(() {
                                name = text;
                              });
                            }
                          },
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: mediaQuery.size.width * 0.04,
                              color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5, top: 0),
                          ),
                        ),
                      ),

                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: mediaQuery.size.width * 0.06,
                                left: mediaQuery.size.width * 0.1,
                                bottom: mediaQuery.size.height * 0.01),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontSize: mediaQuery.size.width * 0.035,
                                  color: Colors.black),
                              textAlign: TextAlign.start,
                            ),
                          )),
                      Container(
                        width: mediaQuery.size.width * 0.8,
                        height: mediaQuery.size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          onChanged: (text) {
                            if (text.length != 0) {
                              setState(() {
                                phone = text;
                              });
                            }
                          },
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: mediaQuery.size.width * 0.04,
                              color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5, top: 0),
                          ),
                        ),
                      ),

                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: mediaQuery.size.width * 0.06,
                                left: mediaQuery.size.width * 0.1,
                                bottom: mediaQuery.size.height * 0.01),
                            child: Text(
                              "Email Address",
                              style: TextStyle(
                                  fontSize: mediaQuery.size.width * 0.035,
                                  color: Colors.black),
                              textAlign: TextAlign.start,
                            ),
                          )),
                      Container(
                        width: mediaQuery.size.width * 0.8,
                        height: mediaQuery.size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          onChanged: (text) {
                            email = text;
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email);
                            if (emailValid == true) {
                              setState(() {
                                valid_email = true;
                                email = text;
                              });
                            } else {
                              setState(() {
                                valid_email = false;
                              });
                            }
                          },
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: mediaQuery.size.width * 0.04,
                              color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5, top: 0),
                          ),
                        ),
                      ),

                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: mediaQuery.size.width * 0.06,
                                left: mediaQuery.size.width * 0.1,
                                bottom: mediaQuery.size.height * 0.01),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: mediaQuery.size.width * 0.035,
                                  color: Colors.black),
                              textAlign: TextAlign.start,
                            ),
                          )),
                      Container(
                        width: mediaQuery.size.width * 0.8,
                        height: mediaQuery.size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          onChanged: (text) {
                            if (text.length != 0) {
                              setState(() {
                                pass = text;
                              });
                            }
                          },
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: mediaQuery.size.width * 0.04,
                              color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5, top: 0),
                          ),
                        ),
                      ),

                      // button
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: mediaQuery.size.height * 0.01,
                              top: mediaQuery.size.height * 0.07),
                          child: InkWell(
                              onTap: () async {
                                if (valid_email == true &&
                                    name.length != 0 &&
                                    phone.length != 0 &&
                                    pass.length != 0) {
                                  signupAPI();
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff1879C0),
                                    borderRadius: BorderRadius.circular(
                                        mediaQuery.size.width * 0.03),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  width: mediaQuery.size.width * 0.8,
                                  height: mediaQuery.size.height * 0.07,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: mediaQuery.size.width * 0.04),
                                      child: Text(
                                        "Sing Up",
                                        textAlign: TextAlign.center,
                                      ))))),
                    ],
                  ))
            ]))));
  }
}
