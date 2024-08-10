import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

// Packages
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Validator
import '../validators.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // visibility or no (password)
  bool invisibility = true;

  // loading widget status
  bool isLoading = false;

  // validasi
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        margin: EdgeInsets.symmetric(horizontal: 40),
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
              'Welcome, ',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Login Account',
              style: greenTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    // USERNAME
    Widget usernameInput() {
      return TextFormField(
        controller: _usernameController,
        validator: (value) {
          return validateText(value, 'username');
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
          hintText: 'Username',
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

    // Input (Username, Password)
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
              usernameInput(),
              SizedBox(
                height: 20,
              ),
              passwordInput(),
            ],
          ),
        ),
      );
    }

    // Error Toast
    Widget errorToast() {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        width: 288,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Incorrect Username or Password',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    // Sign In Button
    Widget buttonSign() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
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

                        // kondisi akun
                        if (_passwordController.text != '123456') {
                          // toast
                          fToast.showToast(
                            child: errorToast(),
                            gravity: ToastGravity.SNACKBAR,
                            toastDuration: Duration(
                              seconds: 2,
                            ),
                          );
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/main', (route) => false);
                        }
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
                        'Sign In',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
              ),
            )
          ],
        ),
      );
    }

    // Navigation Sign Up Page
    Widget navToSignUp() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have account?',
              style: greyTextStyle,
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'Sign Up',
                style: greenTextStyle.copyWith(
                  fontWeight: bold,
                ),
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
          input(),
          buttonSign(),
          navToSignUp(),
        ],
      ),
    );
  }
}
