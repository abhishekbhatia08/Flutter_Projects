import 'package:flutter/material.dart';
import 'package:kavachz/Constants/color_constants.dart';

class SearchItem extends StatelessWidget {
  final String itemName;
  final String itemCategory;
  final String itemImage;
  const SearchItem({
    super.key,
    required this.itemName,
    required this.itemCategory,
    required this.itemImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            itemImage,
            height: 44,
            width: 44,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.headingColor,
                    )),
                Text(
                  itemCategory,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.headingColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
