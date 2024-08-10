import 'package:flutter/material.dart';
import 'package:peoples/pages/signup_page.dart';

// Pages
import 'package:peoples/pages/splash_page.dart';
import 'package:peoples/pages/signin_page.dart';
import 'package:peoples/pages/main_page.dart';

void main() {
  runApp(const PeoplesApp());
}

class PeoplesApp extends StatelessWidget {
  const PeoplesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/main': (context) => Mainpage(),
      },
    );
  }
}
