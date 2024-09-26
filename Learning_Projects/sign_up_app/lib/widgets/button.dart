import 'package:flutter/material.dart';
import 'package:sign_up_app/utils/color_constants.dart';

class CustomisedButton extends StatelessWidget {
  final String buttonText;
  dynamic buttonColor;
  dynamic textColor;
  dynamic onPressed;
  CustomisedButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: onPressed,
        autofocus: true,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: buttonColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))),
            side: const BorderSide(color: ColorConstants.secondary),
            fixedSize: Size(screenSize.width * 0.4, screenSize.height * 0.05)),
        child: Text(
          buttonText.toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: textColor,
          ),
        ));
  }
}
