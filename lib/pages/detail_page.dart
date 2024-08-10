import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Text('Detail Page'),
      ),
    );
  }
}
