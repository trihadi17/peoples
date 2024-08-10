import 'package:flutter/material.dart';

// Pages
import 'package:peoples/pages/splash_page.dart';
import 'package:peoples/pages/signin_page.dart';
import 'package:peoples/pages/signup_page.dart';
import 'package:peoples/pages/main_page.dart';
import 'package:peoples/pages/detail_page.dart';
import 'package:peoples/pages/add_page.dart';
import 'package:peoples/pages/update_page.dart';

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
        '/detail': (context) => DetailPage(),
        '/add': (context) => AddPage(),
        '/update': (context) => UpdatePage(),
      },
    );
  }
}
