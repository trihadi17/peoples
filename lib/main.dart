import 'package:flutter/material.dart';

// Pages
import 'package:peoples/pages/splash_page.dart';
import 'package:peoples/pages/signin_page.dart';

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
      },
    );
  }
}
