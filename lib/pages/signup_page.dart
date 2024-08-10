import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

// Packages
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Validator
import '../validators.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // visibility or no (password)
  bool invisibility = true;
  bool invisibilityConfirm = true;

  // loading widget status
  bool isLoading = false;

  // validasi
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Varible FlutterToast
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    // inisialisasi fluttertoas dengan BuildContext
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    // Header
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: 40,
          right: 40,
          top: 50,
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
              'Sign Up',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    // Fullname Input
    Widget fullNameInput() {
      return TextFormField(
        controller: _fullNameController,
        validator: (value) {
          return validateText(value, 'full name');
        },
        // validasi ketika apa (contoh ketika diketik atau selalu)
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        style: blackTextStyle.copyWith(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteGreyColor,
          // content padding digunakan ukuran pada konten input
          contentPadding: const EdgeInsets.only(
            right: 15,
            bottom: 15,
            top: 15,
          ),

          // Prefix digunakan sebagai jika ada widget optional, saat ini digunakan untuk padding content
          prefix: SizedBox(
            width: 15,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: GoogleFonts.nunito(
            fontSize: 12,
            color: Color(0xffFF314A),
          ),
          hintText: 'Full Name',
          hintStyle: GoogleFonts.nunito(
            fontSize: 14,
            color: Color(0xffA9A9A9),
          ),
        ),
      );
    }

    // Email
    Widget emailInput() {
      return TextFormField(
        controller: _emailController,
        validator: (value) {
          return validateEmail(value);
        },
        // validasi ketika apa (contoh ketika diketik atau selalu)
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        style: blackTextStyle.copyWith(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteGreyColor,
          // content padding digunakan ukuran pada konten input
          contentPadding: const EdgeInsets.only(
            right: 15,
            bottom: 15,
            top: 15,
          ),

          // Prefix digunakan sebagai jika ada widget optional, saat ini digunakan untuk padding content
          prefix: SizedBox(
            width: 15,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: GoogleFonts.nunito(
            fontSize: 12,
            color: Color(0xffFF314A),
          ),
          hintText: 'Email',
          hintStyle: GoogleFonts.nunito(
            fontSize: 14,
            color: Color(0xffA9A9A9),
          ),
        ),
      );
    }

    // PASSWORD
    Widget passwordInput() {
      return TextFormField(
        controller: _passwordController,
        validator: (value) {
          return validateText(value, 'password');
        },
        // validasi ketika apa (contoh ketika diketik atau selalu)
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: invisibility,
        keyboardType: TextInputType.text,
        style: blackTextStyle.copyWith(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                invisibility = !invisibility;
              });
            },
            child: invisibility
                ? Icon(
                    Icons.visibility_off,
                    color: Color(0xffA9A9A9),
                  )
                : Icon(
                    Icons.visibility,
                    color: Color(0xffA9A9A9),
                  ),
          ),
          filled: true,
          fillColor: whiteGreyColor,
          // content padding digunakan ukuran pada konten input
          contentPadding: const EdgeInsets.only(
            bottom: 15,
            top: 15,
          ),

          // Prefix digunakan sebagai jika ada widget optional, saat ini digunakan untuk padding content
          prefix: SizedBox(
            width: 15,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: GoogleFonts.nunito(
            fontSize: 12,
            color: Color(0xffFF314A),
          ),
          hintText: 'Password',
          hintStyle: GoogleFonts.nunito(
            fontSize: 14,
            color: Color(0xffA9A9A9),
          ),
        ),
      );
    }

    // Confirm Password
    Widget confimrPasswordInput() {
      return TextFormField(
        controller: _confirmPasswordController,
        validator: (value) {
          return validateConfirmPassword(value, _passwordController.text);
        },
        // validasi ketika apa (contoh ketika diketik atau selalu)
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: invisibilityConfirm,
        keyboardType: TextInputType.text,
        style: blackTextStyle.copyWith(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                invisibilityConfirm = !invisibilityConfirm;
              });
            },
            child: invisibilityConfirm
                ? Icon(
                    Icons.visibility_off,
                    color: Color(0xffA9A9A9),
                  )
                : Icon(
                    Icons.visibility,
                    color: Color(0xffA9A9A9),
                  ),
          ),
          filled: true,
          fillColor: whiteGreyColor,
          // content padding digunakan ukuran pada konten input
          contentPadding: const EdgeInsets.only(
            bottom: 15,
            top: 15,
          ),

          // Prefix digunakan sebagai jika ada widget optional, saat ini digunakan untuk padding content
          prefix: SizedBox(
            width: 15,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: GoogleFonts.nunito(
            fontSize: 12,
            color: Color(0xffFF314A),
          ),
          hintText: 'Confirm Password',
          hintStyle: GoogleFonts.nunito(
            fontSize: 14,
            color: Color(0xffA9A9A9),
          ),
        ),
      );
    }

    Widget toast() {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        width: 200,
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Register Successfull',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // Sign Up Button
    Widget buttonSign() {
      return Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // aktifkan widget loading
                  setState(() {
                    isLoading = true;
                  });

                  Future.delayed(
                    Duration(seconds: 2),
                    () {
                      // nonaktifkan widget loading
                      setState(() {
                        isLoading = false;
                      });

                      // toast
                      fToast.showToast(
                        child: toast(),
                        gravity: ToastGravity.SNACKBAR,
                        toastDuration: Duration(
                          seconds: 2,
                        ),
                      );

                      Navigator.pop(context);
                    },
                  );
                } else {
                  print('false');
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: whiteColor,
                      backgroundColor: whiteGreyColor,
                      strokeWidth: 3,
                    )
                  : Text(
                      'Sign Up',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
            ),
          )
        ],
      );
    }

    // Navigation Sign In Page
    Widget navToSignIn() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: greyTextStyle,
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Sign In',
              style: greenTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          ),
        ],
      );
    }

    // FORM INPUT
    Widget input() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              fullNameInput(),
              SizedBox(
                height: 20,
              ),
              emailInput(),
              SizedBox(
                height: 20,
              ),
              passwordInput(),
              SizedBox(
                height: 20,
              ),
              confimrPasswordInput(),
              SizedBox(
                height: 50,
              ),
              buttonSign(),
              SizedBox(
                height: 50,
              ),
              navToSignIn(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          header(),
          input(),
        ],
      ),
    );
  }
}
