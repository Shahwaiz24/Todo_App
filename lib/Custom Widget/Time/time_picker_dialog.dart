import 'package:flutter/material.dart';
import 'package:todo_app/Custom%20Widget/Time/am_pm.dart';
import 'package:todo_app/Custom%20Widget/Time/hours.dart';
import 'package:todo_app/Custom%20Widget/Time/minutes.dart';

import 'package:todo_app/Custom%20Widget/custom_button.dart';
import 'package:todo_app/Custom%20Widget/textfield_.dart';

int? hourIndex;
int? minIndex;
int? am_pmIndex;

class DialogBar extends StatefulWidget {
  const DialogBar({super.key});

  @override
  State<DialogBar> createState() => _DialogState();
}

class _DialogState extends State<DialogBar> {
  @override
  Widget build(BuildContext context) {
//Get Size
    final ScreenSize = MediaQuery.sizeOf(context);
    final height = ScreenSize.height;
    final width = ScreenSize.width;

    return Dialog(
      child: Container(
        height: height * 0.310,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(width * 0.020),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(height * 0.020),
            Text(
              'Choose Time',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontFamily: 'Poppins_Regular',
                  fontSize: height * 0.020,
                  fontWeight: FontWeight.w600),
            ),
            addVerticalSpace(height * 0.015),
            Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            addVerticalSpace(height * 0.040),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.080),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: height * 0.080,
                      width: width * 0.170,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(width * 0.015),
                      ),
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 50,
                        childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 13,
                            builder: (context, index) {
                              hourIndex = index;

                              return MyHours(hours: index);
                            }),
                        perspective: 0.005,
                        diameterRatio: 1.2,
                        physics: FixedExtentScrollPhysics(),
                      )),
                  Container(
                    height: height * 0.080,
                    width: width * 0.170,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(width * 0.015)),
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 50,
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 60,
                          builder: (context, index) {
                            minIndex = index;
                            return MyMinutes(mins: index);
                          }),
                      perspective: 0.005,
                      diameterRatio: 1.2,
                      physics: FixedExtentScrollPhysics(),
                    ),
                  ),
                  Container(
                    height: height * 0.080,
                    width: width * 0.170,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(width * 0.015)),
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 50,
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 2,
                          builder: (context, index) {
                            if (index == 0) {
                              am_pmIndex = index;
                              return AmPm(isItAm: true);
                            } else {
                              am_pmIndex = index;
                              return AmPm(isItAm: false);
                            }
                          }),
                      perspective: 0.005,
                      diameterRatio: 1.2,
                      physics: FixedExtentScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(height * 0.030),
            button(
                height: 0.055,
                ontap: () {
                  Navigator.pop(context);
                  
                },
                width: 0.320,
                screenheight: height,
                screenwidth: width,
                text: 'Save')
          ],
        ),
      ),
    );
  }
}
