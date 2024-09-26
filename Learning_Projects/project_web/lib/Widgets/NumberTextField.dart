import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

Widget NumberTextField(int len, double width) {
  return OTPTextField(
    length: len,
    width: width,
    fieldWidth: width*0.05,
    style: TextStyle(
      fontSize: 15,
    ),
    textFieldAlignment: MainAxisAlignment.spaceEvenly,
    fieldStyle: FieldStyle.underline,
    spaceBetween: 2,
    onChanged: (pin) {
      print("Changed: " + pin);
    },
    onCompleted: (pin) {
      print("Completed: " + pin);
    },
  );
}
