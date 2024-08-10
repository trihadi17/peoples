import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

// Widgets
import 'package:peoples/widgets/people_card.dart';
import 'package:peoples/widgets/skeleton_people.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  // variable untuk isLoading
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Header
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 30,
          right: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    'Trihadi Putra ',
                    style: greenTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  14,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://reqres.in/img/faces/7-image.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    }

    // Title
    Widget titleContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          right: 30,
          left: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Peoples',
              style: blackTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/add');
              },
              child: Container(
                height: 30,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: greenColor,
                ),
                child: Text(
                  'Add People',
                  style: whiteTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    // People
    Widget buildPeople() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            PeopleCard(
              imageUrl: 'https://reqres.in/img/faces/9-image.jpg',
              name: 'Trihadi Putra',
            ),
          ],
        ),
      );
    }

    // Skeleton People (Shimmer)
    Widget buildLoading() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            SkeletonPeople(),
            SkeletonPeople(),
            SkeletonPeople(),
            SkeletonPeople(),
            SkeletonPeople(),
            SkeletonPeople(),
          ],
        ),
      );
    }

    // Content
    Widget content() {
      return isLoading ? buildLoading() : buildPeople();
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          header(),
          titleContent(),
          content(),
        ],
      ),
    );
  }
}
