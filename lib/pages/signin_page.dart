import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Text('Sign In Page'),
      ),
    );
  }
}
