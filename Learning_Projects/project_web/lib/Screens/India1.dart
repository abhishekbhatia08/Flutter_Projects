import 'package:flutter/material.dart';
import 'dart:async';

class India1Screen extends StatefulWidget {
  @override
  _India1ScreenState createState() => _India1ScreenState();
}

class _India1ScreenState extends State<India1Screen> {
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 3), () {
      // set your desired delay time here
      Navigator.of(context).pushNamed('preferredlanguage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q="),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Image.network(
                  "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1502864731/yhgb7yzuynlgvrdldevc.png",
                  fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.blue,
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}