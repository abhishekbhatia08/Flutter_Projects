import 'package:flutter/material.dart';
import 'package:kavachz/Constants/color_constants.dart';
import 'package:kavachz/Screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kavachz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorConstants.primary,
      ),
      home: const DashboardScreen(),
    );
  }
}

