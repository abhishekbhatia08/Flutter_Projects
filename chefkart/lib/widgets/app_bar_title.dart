import 'package:chefkart/utils/color_constants.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  const AppBarTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ColorConstants.black
      ),
    );
  }
}
