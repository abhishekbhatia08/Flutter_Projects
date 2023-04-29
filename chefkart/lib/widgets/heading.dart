import 'package:chefkart/utils/color_constants.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: ColorConstants.black),
    );
  }
}
