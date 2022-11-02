import 'package:flutter/material.dart';
import './page1.dart';

void main() => runApp(MyApp());

TextEditingController numberController = new TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Help India',
      debugShowCheckedModeBanner: false,
      routes: {
      },
      home: Dashboard(),
    );
  }
}
