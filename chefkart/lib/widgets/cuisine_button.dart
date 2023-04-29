import 'package:chefkart/utils/color_constants.dart';
import 'package:flutter/material.dart';

class CuisineButton extends StatelessWidget {
  final String cuisineName;
  dynamic onPressed;
  CuisineButton(
      {super.key, required this.cuisineName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: MaterialButton(
        onPressed: onPressed,
        color: ColorConstants.enabledColor,
        disabledColor: ColorConstants.white,
        disabledTextColor: ColorConstants.disabledColor,
        elevation: 0,
        textColor: ColorConstants.orange,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            side: BorderSide(
              width: 1,
              color: ColorConstants.orange,
            )),
        height: 24,
        autofocus: true,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Text(
          cuisineName,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
