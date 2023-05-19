import 'package:chefkart/utils/color_constants.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: CircularProgressIndicator(
          color: ColorConstants.orange,
        )),
      ],
    );
  }
}
