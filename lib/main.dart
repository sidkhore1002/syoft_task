import 'package:flutter/material.dart';
import 'package:syoft_task/dashboard.dart';
import 'package:syoft_task/main-login.dart';
import 'package:syoft_task/onboarding.dart';
import 'package:syoft_task/signup.dart';
import 'package:syoft_task/singin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget defaultScreen = onboarding();

  runApp(MaterialApp(
    theme: ThemeData(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => defaultScreen,
      '/mainLogin': (context) => mainLogin(),
      '/signup': (context) => signup(),
      '/signin': (context) => signin(),
      '/dashboard': (context) => dashboard(),
    },
  )

  );
}
