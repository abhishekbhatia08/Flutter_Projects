import 'package:flutter/material.dart';
import 'package:quotation_app/screens/sign_up_screen.dart';
import 'package:quotation_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotation App',
      home: const SplashScreen(),
      routes: {
        '/signUp': (context) => const SignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
