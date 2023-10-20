import 'package:flutter/material.dart';

class mainLogin extends StatefulWidget {
  @override
  mainLoginScreen createState() => mainLoginScreen();
}

class mainLoginScreen extends State<mainLogin> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Center(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: mediaQuery.size.width * 0.04),
              child: Image.asset(
                ('assets/images/img1.jpg'),
                width: mediaQuery.size.width * 0.85,
                height: mediaQuery.size.height * 0.5,
                fit: BoxFit.fill,
              )),
          Padding(
              padding: EdgeInsets.only(top: mediaQuery.size.width * 0.2),
              child: Text(
                "Best Way to invest your money",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.only(
                  bottom: mediaQuery.size.height * 0.01,
                  top: mediaQuery.size.height * 0.07),
              child: InkWell(
                  onTap: () async {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1879C0),
                        borderRadius:
                            BorderRadius.circular(mediaQuery.size.width * 0.03),
                        border: Border.all(color: Colors.grey, width: 1),
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
          Padding(
              padding: EdgeInsets.only(
                  bottom: mediaQuery.size.height * 0.03,
                  top: mediaQuery.size.height * 0.02),
              child: InkWell(
                  onTap: () async {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(mediaQuery.size.width * 0.03),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      width: mediaQuery.size.width * 0.8,
                      height: mediaQuery.size.height * 0.07,
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: mediaQuery.size.width * 0.04),
                          child: Text(
                            "Sing In",
                            textAlign: TextAlign.center,
                          ))))),
        ],
      ))
    ])));
  }
}
