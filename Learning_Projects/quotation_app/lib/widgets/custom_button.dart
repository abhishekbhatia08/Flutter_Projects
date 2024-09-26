import 'package:flutter/material.dart';
import 'package:quotation_app/utils/color_constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  final String text;
  dynamic press;
  dynamic bgColor;

  CustomButton({
    super.key,
    required this.text,
    required this.press,
    this.bgColor = ColorConstants.primaryColor,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: screenSize.width * 0.2),
      child: MaterialButton(
        minWidth: screenSize.width * 0.3,
        onPressed: widget.press,
        color: widget.bgColor,
        height: 35,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
