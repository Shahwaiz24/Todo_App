import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

Widget button({ontap, screenwidth, screenheight, text, height, width, color}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
        width: screenwidth * width,
        height: screenheight * height,
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(screenwidth * 0.025),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins_Regular',
              fontSize: screenheight * 0.024),
        ))),
  );
}
