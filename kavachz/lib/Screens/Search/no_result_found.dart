import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:kavachz/Constants/color_constants.dart';

class NoSearchFound extends StatelessWidget {
  const NoSearchFound({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Recent",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorConstants.greyColor,
                    )),
                Text(
                  "0 Found",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.greyColor,
                  ),
                )
              ],
            ),
          ),
          Lottie.asset(
            "assets/SearchNotFound.json",
            width: screenSize.width,
            height: screenSize.width,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text(
              "Sorry !",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorConstants.headingColor,
              ),
            ),
          ),
          const Text(
            "No Results found, try\nsomething else",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorConstants.greyColor,
            ),
          )
        ],
      ),
    );
  }
}
