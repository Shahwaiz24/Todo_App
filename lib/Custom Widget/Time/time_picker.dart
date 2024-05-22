import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

Widget timepicker({required height, required width}) {
  return TimePickerSpinner(
    is24HourMode: false,
    
    normalTextStyle: TextStyle(
        backgroundColor: Colors.black,
        fontSize: height * 0.020,
        color: Colors.grey.withOpacity(0.9)),
    highlightedTextStyle:
        TextStyle(fontSize: height * 0.024, color: Colors.black),
    spacing: 30,
    itemHeight: 80,
    isForce2Digits: false,
    onTimeChange: (time) {},
  );
}
