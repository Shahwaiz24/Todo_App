import 'package:flutter/material.dart';
import 'package:todo_app/Initial%20Routes/splash_screen.dart';

const Color primary = Color(0xff121212);
const Color secondary = Color(0xff8875FF);
const Color dialog = Color.fromARGB(255, 78, 78, 78);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
