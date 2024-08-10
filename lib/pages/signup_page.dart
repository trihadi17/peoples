import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

// Packages
import 'package:google_fonts/google_fonts.dart';

// Validator
import '../validators.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Text('Sign Up Page'),
      ),
    );
  }
}
