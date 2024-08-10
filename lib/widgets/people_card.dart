import 'package:flutter/material.dart';

// Theme
import '../theme.dart';

// Package
import 'package:google_fonts/google_fonts.dart';

class PeopleCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  PeopleCard({
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 75) / 2,
        height: 180,
        decoration: BoxDecoration(
          color: Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 4,
                top: 4,
                right: 4,
                bottom: 12,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  '${imageUrl}',
                  width: double.infinity,
                  height: 132,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Text(
                '${name}',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: semiBold,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
