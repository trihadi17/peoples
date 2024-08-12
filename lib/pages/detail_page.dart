import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

// Package
import 'package:google_fonts/google_fonts.dart';

// Model
import '../model/people.dart';

class DetailPage extends StatelessWidget {
  final PeopleModel people;

  DetailPage(this.people);

  @override
  Widget build(BuildContext context) {
    // Header
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
        ),
        child: Column(
          children: [
            //* IMAGE
            ClipOval(
              child: Image.network(
                'https://reqres.in/img/faces/7-image.jpg',
                fit: BoxFit.cover,
                height: 100,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //* Name
            Text(
              '${people.fullname}',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),

            SizedBox(
              height: 5,
            ),

            //* Email
            Text(
              '${people.email}',
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    // Description
    Widget description() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.60,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      );
    }

    // Edit Button
    Widget editButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/update');
        },
        child: Container(
          width: 80,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Edit',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              color: Colors.blueAccent,
            ),
          ),
        ),
      );
    }

    // Delete Button
    Widget deleteButton() {
      return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Confirm',
                    style:
                        blackTextStyle.copyWith(fontSize: 25, fontWeight: bold),
                  ),
                  content: Text(
                    'Do you want to delete?',
                    style: blackTextStyle.copyWith(fontSize: 13),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: greyTextStyle,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('delete');
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/main', (route) => false);
                      },
                      child: Text(
                        'Delete',
                        style: GoogleFonts.poppins(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                );
              });
        },
        child: Container(
          width: 80,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.redAccent,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Delete',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              color: Colors.redAccent,
            ),
          ),
        ),
      );
    }

    // Action
    Widget action() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          bottom: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            editButton(),
            SizedBox(
              width: 12,
            ),
            deleteButton(),
          ],
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
          'Detail Page',
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
          header(),
          description(),
          action(),
        ],
      ),
    );
  }
}
