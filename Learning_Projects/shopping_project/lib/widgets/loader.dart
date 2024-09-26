import 'package:flutter/material.dart';
import 'package:meragi/utils/color_constants.dart';

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
