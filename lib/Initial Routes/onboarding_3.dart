import 'package:flutter/material.dart';
import 'package:todo_app/Custom%20Widget/custom_button.dart';
import 'package:todo_app/Screens/home_page.dart';
import 'package:todo_app/main.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.050),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/Third_Initial_Pic.png'),
                height: screenHeight * 0.400,
                width: screenWidth * 0.600,
              ),
              SizedBox(
                height: screenHeight * 0.040,
              ),
              Image(image: AssetImage('assets/images/line.png')),
              SizedBox(
                height: screenHeight * 0.040,
              ),
              Text(
                'Orgonaize your tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.035,
                  fontFamily: 'Poppins_Regular',
                ),
              ),
              SizedBox(
                height: screenHeight * 0.030,
              ),
              Text(
                '      You can organize your daily tasks by \n adding your tasks into separate categories',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: 'Poppins_Regular',
                    fontSize: screenHeight * 0.018),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.055),
                child: button(
                    screenheight: screenHeight,
                    screenwidth: screenWidth,
                    text: 'Get Started',
                    width: 0.650,
                    height: 0.050,
                    ontap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
