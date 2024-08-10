import 'dart:async';
import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Timer
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushNamedAndRemoveUntil(
          context, '/signin', (route) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Peo",
                  style: blackTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  "ple's",
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
