import 'package:flutter/material.dart';
import 'package:sign_up_app/color_constants.dart';

void toastShow(BuildContext context, dynamic title, String status) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: ColorConstants.yellowBgColor,
    elevation: 1,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    shape: const StadiumBorder(),
    width: MediaQuery.of(context).size.width * 0.9,
    content: Text(
      title,
      style: TextStyle(
          color: status.toLowerCase() == 'error'
              ? ColorConstants.errorColor
              : ColorConstants.secondary),
    ),
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: ColorConstants.secondary,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  ));
}
