import 'package:flutter/material.dart';
import 'package:sign_up_app/color_constants.dart';
import 'package:sign_up_app/user_details.dart';
import 'package:sign_up_app/widgets/button.dart';
import 'package:sign_up_app/widgets/mobile_text_field.dart';
import 'package:sign_up_app/widgets/push_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

final DateTime today = DateTime.now();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            screenSize.height * 0.2,
            20,
            screenSize.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back !",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: ColorConstants.secondary),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Enter Your number",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.secondary),
                ),
              ),
              MobileTextField(contoller: phoneNumber),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: CustomisedButton(
            buttonText: "submit",
            buttonColor: ColorConstants.secondary,
            textColor: ColorConstants.primary,
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences
                  .setString('mobile_no', phoneNumber.text)
                  .then((value) => pushNavigator(context, const UserDetails()));
            }),
      ),
    );
  }
}
