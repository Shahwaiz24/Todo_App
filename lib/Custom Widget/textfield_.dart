import 'package:flutter/material.dart';

Widget text_Field({TextEditingController? controller, required double width}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.020),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.6),
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.020),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.6),
            )),
      ),
    ),
  );
}

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

showusccessmessage({context, message}) {
  final snackbar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

showerrormessage(context, {message, required double height}) {
  final snackbar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white, fontSize: height * 0.018),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
