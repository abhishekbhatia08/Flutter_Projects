import 'package:flutter/material.dart';
import 'package:sign_up_app/color_constants.dart';
import 'package:sign_up_app/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorConstants.primary
      ),
      home: const WelcomeScreen(),
    );
  }
}
