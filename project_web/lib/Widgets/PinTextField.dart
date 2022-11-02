import 'package:flutter/material.dart';
import '../Screens/Passcode.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

  Widget PassCodeTextField(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: true,
      obscuringCharacter: '*',
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      mainAxisAlignment: MainAxisAlignment.center,
      pinTheme: PinTheme(
        activeColor: Colors.black12,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 50,
        fieldOuterPadding: const EdgeInsets.all(10.0),
        activeFillColor: Colors.white,
      ),
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
