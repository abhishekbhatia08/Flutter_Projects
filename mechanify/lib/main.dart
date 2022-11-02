import 'package:flutter/material.dart';
import 'package:mechanify/pages/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mechanify',
        debugShowCheckedModeBanner: false,
        home: WelcomePage());
  }
}
