import 'package:chefkart/utils/color_constants.dart';
import 'package:flutter/material.dart';

class PopularDish extends StatelessWidget {
  final String dishName;
  final String dishImage;
  final dynamic onTap;
  const PopularDish({
    super.key,
    required this.dishName,
    required this.dishImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 33,
      backgroundColor: ColorConstants.orange,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(dishImage),
            ),
          ),
          Text(
            dishName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: ColorConstants.white,
            ),
          ),
        ],
      ),
    );
  }
}
