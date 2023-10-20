import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class signin extends StatefulWidget {
  @override
  signinScreen createState() => signinScreen();
}

class signinScreen extends State<signin> {
  var emailID = "";
  bool valid_email = false;
  var pass = "";
  bool valid_pass = false;

  signInAPI() async {
    var url = "https://snapkaro.com/eazyrooms_staging/api/userlogin";
    final response = await http.post(Uri.parse(url),
        body: {"user_email": emailID, "user_password": pass});

    if (response.statusCode == 200) {
      // var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(response);
      // setState(() {
      //   userData = jsonResponse;
      // });
      Navigator.pushNamed(context, '/dashboard',
          arguments: {'email': emailID});
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
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mediaQuery.size.height * 0.4,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    mediaQuery.size.width * 0.11),
                                topLeft: Radius.circular(
                                    mediaQuery.size.width * 0.11)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 2,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),
                          height: mediaQuery.size.height * 0.9,
                          width: mediaQuery.size.width,
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      top: mediaQuery.size.height *
                                          0.04, // increase size
                                      bottom: mediaQuery.size.width * 0.05),
                                  child: Center(
                                    child: Text(
                                      "Sign In",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              mediaQuery.size.width * 0.05,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),

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
                                          fontSize:
                                              mediaQuery.size.width * 0.035,
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
                                    emailID = text;
                                    bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(emailID);
                                    if (emailValid == true) {
                                      setState(() {
                                        valid_email = true;
                                        emailID = text;
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
                                    contentPadding:
                                        EdgeInsets.only(left: 5, top: 0),
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
                                          fontSize:
                                              mediaQuery.size.width * 0.035,
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
                                    pass = text;
                                    if (pass.length != 0) {
                                      setState(() {
                                        valid_pass = true;
                                        pass = text;
                                      });
                                    } else {
                                      setState(() {
                                        valid_pass = false;
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
                                    contentPadding:
                                        EdgeInsets.only(left: 5, top: 0),
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
                                            valid_pass == true) {
                                          signInAPI();
                                        } else {
                                          final snackBar = SnackBar(
                                              duration:
                                                  const Duration(seconds: 1),
                                              content: Text(
                                                  'Enter valid EmailID or Password'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
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
                                                  top: mediaQuery.size.width *
                                                      0.04),
                                              child: Text(
                                                "Sing In",
                                                textAlign: TextAlign.center,
                                              ))))),
                            ],
                          ))
                    ]))));
  }
}
