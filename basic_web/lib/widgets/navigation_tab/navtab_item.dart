import 'package:flutter/material.dart';

class NavTabItem extends StatelessWidget {
  final String title;
  const NavTabItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}