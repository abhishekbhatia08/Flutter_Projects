import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up_app/controllers/data_controller.dart';
import 'package:sign_up_app/utils/color_constants.dart';
import 'package:sign_up_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      title: 'Sign Up Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: ColorConstants.primary),
      home: const WelcomeScreen(),
    );
  }
}
