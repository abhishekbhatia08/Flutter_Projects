import 'package:flutter/material.dart';
import 'package:meragi/utils/color_constants.dart';

class RatingBox extends StatelessWidget {
  final String rating;
  final String number;
  const RatingBox({
    super.key,
    required this.rating,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
      width: 75,
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
          ),
          Text(
            "($number)",
            style: const TextStyle(color: ColorConstants.white),
          ),
        ],
      ),
    );
  }
}
