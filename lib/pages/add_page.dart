import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text('Add Page'),
      ),
    );
  }
}
