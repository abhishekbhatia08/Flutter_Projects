import 'package:flutter/material.dart';
import 'package:sign_up_app/color_constants.dart';
import 'package:sign_up_app/login_screen.dart';
import 'package:sign_up_app/sign_up_screen.dart';
import 'package:sign_up_app/widgets/button.dart';
import 'package:sign_up_app/widgets/push_navigator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.2,
          horizontal: 10,
        ),
        child: Column(
          children: [
            const Text(
              "Hello !",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: ColorConstants.secondary),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Please choose how you want to proceed",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.secondary),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomisedButton(
                  buttonText: "login",
                  buttonColor: ColorConstants.primary,
                  textColor: ColorConstants.secondary,
                  onPressed: () {
                    pushNavigator(context, const LoginScreen());
                  },
                ),
                CustomisedButton(
                  buttonText: "register",
                  buttonColor: ColorConstants.secondary,
                  textColor: ColorConstants.primary,
                  onPressed: () {
                    pushNavigator(context, const SignUpScreen());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
