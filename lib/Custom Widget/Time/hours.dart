// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyHours extends StatelessWidget {
  int hours;

  MyHours({required this.hours});

  @override
  Widget build(BuildContext context) {
//Get Size
    final ScreenSize = MediaQuery.sizeOf(context);
    final height = ScreenSize.height;
    final width = ScreenSize.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            hours.toString(),
            style: TextStyle(
               fontSize: height * 0.028,
              fontFamily: 'Poppins_Regular',
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
