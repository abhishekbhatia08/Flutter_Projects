import 'package:chefkart/utils/color_constants.dart';
import 'package:flutter/material.dart';

class RatingBox extends StatelessWidget {
  final String rating;
  const RatingBox({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
      decoration: const BoxDecoration(
          color: ColorConstants.green,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            rating,
            style: const TextStyle(color: ColorConstants.white),
          ),
          const Icon(
            Icons.star,
            color: ColorConstants.white,
            size: 10,
          )
        ],
      ),
    );
    ;
  }
}
