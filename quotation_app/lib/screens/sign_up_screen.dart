import 'package:flutter/material.dart';
import 'package:quotation_app/screens/otp_screen.dart';
import 'package:quotation_app/utils/images_constant.dart';
import 'package:quotation_app/widgets/custom_button.dart';
import 'package:quotation_app/widgets/mobile_text_field.dart';
import 'package:quotation_app/widgets/push_navigator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController mobileNoController = TextEditingController();
  bool agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, right: 30, left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Image.asset(ImagesConstant.signUp),
              const Align(
                alignment: Alignment.centerLeft,
                child:  Text(
                  "Mobile Number",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ),
              MobileTextField(hintText: "", contoller: mobileNoController),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: agreeTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeTerms = true;
                        });
                      }),
                  RichText(
                    text: const TextSpan(
                      text: 'I agree with the ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                          text: ' Terms and Condition ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButton(text: "get otp", press: () {
                pushNavigator(context, const OTPScreen());
              }),
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
