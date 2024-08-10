import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

// Packages
import 'package:google_fonts/google_fonts.dart';

// Validator
import '../validators.dart';

class SignUpPage extends StatelessWidget {
  // visibility or no (password)
  bool invisibility = true;

  // loading widget status
  bool isLoading = false;

  // validasi
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Header
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/icon.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Register',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          header(),
        ],
      ),
    );
  }
}
