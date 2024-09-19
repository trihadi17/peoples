import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

// Packages
import 'package:google_fonts/google_fonts.dart';

// Validator
import '../validators.dart';

// Provider
import 'package:provider/provider.dart';

// Class Provider
import 'package:peoples/providers/people_provider.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // loading widget status
  bool isLoading = false;

  // validasi
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  // Penting Di inisialisasi ketika menggunakan textEditingConteroller
  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Provider
    PeopleProvider peopleProvider = Provider.of<PeopleProvider>(context);

    // Email
    Widget emailInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text
          Text(
            'Email',
            style: blackTextStyle,
          ),

          SizedBox(
            height: 5,
          ),

          // TextFormField
          TextFormField(
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
          ),
        ],
      );
    }

    // Fullname Input
    Widget fullNameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text
          Text(
            'Full Name',
            style: blackTextStyle,
          ),

          SizedBox(
            height: 5,
          ),

          // TextFormField
          TextFormField(
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
          ),
        ],
      );
    }

    // Job Input
    Widget jobInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text
          Text(
            'Job',
            style: blackTextStyle,
          ),

          SizedBox(
            height: 5,
          ),

          // TextFormField
          TextFormField(
            controller: _jobController,
            validator: (value) {
              return validateText(value, 'job');
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
              hintText: 'Job',
              hintStyle: GoogleFonts.nunito(
                fontSize: 14,
                color: Color(0xffA9A9A9),
              ),
            ),
          ),
        ],
      );
    }

    // Submit Button
    Widget buttonSubmit() {
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
                      // Add Provider
                      peopleProvider.addPeople(_emailController.text,
                          _fullNameController.text, _jobController.text);

                      // nonaktifkan widget loading
                      setState(() {
                        isLoading = false;
                      });

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
                      'Add People',
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

    // Form Input
    Widget input() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              emailInput(),
              SizedBox(
                height: 10,
              ),
              fullNameInput(),
              SizedBox(
                height: 10,
              ),
              jobInput(),
              SizedBox(
                height: 30,
              ),
              buttonSubmit(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            color: greenColor,
            size: 30,
          ),
        ),
        title: Text(
          'Add Page',
          style: greenTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          input(),
        ],
      ),
    );
  }
}
