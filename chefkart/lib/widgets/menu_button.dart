import 'package:chefkart/utils/color_constants.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final dynamic onPressed;
  const MenuButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: MaterialButton(
        onPressed: onPressed,
        color: ColorConstants.black,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        height: 22,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: const Text(
          "Menu",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: ColorConstants.white),
        ),
      ),
    );
  }
}
