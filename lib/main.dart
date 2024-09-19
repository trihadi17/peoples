import 'package:flutter/material.dart';

// Pages
import 'package:peoples/pages/splash_page.dart';
import 'package:peoples/pages/signin_page.dart';
import 'package:peoples/pages/signup_page.dart';
import 'package:peoples/pages/main_page.dart';
import 'package:peoples/pages/detail_page.dart';
import 'package:peoples/pages/add_page.dart';
import 'package:peoples/pages/update_page.dart';

// Provider
import 'package:provider/provider.dart';

// Class Provider
import 'package:peoples/providers/people_provider.dart';

void main() {
  runApp(const PeoplesApp());
}

class PeoplesApp extends StatelessWidget {
  const PeoplesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PeopleProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/signin': (context) => SignInPage(),
          '/signup': (context) => SignUpPage(),
          '/main': (context) => Mainpage(),
          '/add': (context) => AddPage(),
        },
      ),
    );
  }
}
