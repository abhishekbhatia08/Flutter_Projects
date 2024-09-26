import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotation_app/screens/dashboard_screen.dart';
import 'package:quotation_app/utils/color_constants.dart';
import 'package:quotation_app/utils/images_constant.dart';
import 'package:quotation_app/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quotation_app/widgets/grey_text.dart';
import 'package:quotation_app/widgets/push_navigator.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int secondsRemaining = 30;
  late Timer timer;
  bool enableResend = false;
  late TextEditingController otpController;
  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 130, right: 30, left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Verify OTP",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Image.asset(ImagesConstant.otp),
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: const TextStyle(
                  color: ColorConstants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldWidth: 40,
                    fieldOuterPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    disabledColor: Colors.grey,
                    inactiveColor: Colors.grey,
                    selectedColor: ColorConstants.primaryColor,
                    selectedFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    activeColor: ColorConstants.primaryColor),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                controller: otpController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    print(value);
                  });
                },
                onCompleted: (verificationCode) {},
                onSubmitted: (String verificationCode) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: GreyText(text: "Didn't Recieve OTP?"),
                  ),
                  enableResend == false
                      ? GreyText(
                          text:
                              "Wait |  ${secondsRemaining.toString()} seconds")
                      : textButton(context, () {
                          setState(() {
                            secondsRemaining = 30;
                            enableResend = false;
                            // initSmsListener();
                          });
                        }, "Resend OTP")
                ],
              ),
              CustomButton(
                  text: "get started",
                  press: otpController.text == "1111" ? () {
                    pushNavigator(context, const DashboardScreen());
                  } : (){}),
              const Spacer(),
              Text(
                "Need any Help ?",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone),
                  RichText(
                    text: const TextSpan(
                      text: 'Call us at ',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                      children: [
                        TextSpan(
                          text: ' +91',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textButton(BuildContext context, dynamic press, String text) {
  return GestureDetector(
    onTap: press,
    child: Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
          color: ColorConstants.primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w600),
    ),
  );
}
