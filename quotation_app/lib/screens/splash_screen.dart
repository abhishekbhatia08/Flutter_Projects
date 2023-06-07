import 'package:flutter/material.dart';
import 'package:quotation_app/utils/images_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigatetoDashboard();
  }

   navigatetoDashboard() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacementNamed(context, "/signUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: logo(context)),
    );
  }
}

Widget logo(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    color: Colors.white,
    child: Image.asset(
      ImagesConstant.logo,
      height: screenSize.width,
      width: screenSize.width,
    ),
  );
}