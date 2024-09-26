import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  final String text;
  const GreyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
    );
  }
}