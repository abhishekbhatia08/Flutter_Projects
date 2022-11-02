import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_pref/login.dart';

void main() {
  runApp(MyApp());
}

SharedPreferences? localStorage;

TextEditingController emailController = new TextEditingController();
TextEditingController pwdController = new TextEditingController();

class MyApp extends StatelessWidget {
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
