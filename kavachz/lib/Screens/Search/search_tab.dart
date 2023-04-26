
import 'package:flutter/material.dart';
import 'package:kavachz/Constants/color_constants.dart';

Widget searchTab(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final mediaHeight = screenSize.height / 780;
  final mediaWidth = screenSize.width / 360;
  return Container(
    margin: EdgeInsets.symmetric(vertical: mediaHeight * 12),
    padding: EdgeInsets.symmetric(horizontal: mediaWidth * 10),
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: ColorConstants.searchBarcolor),
    child: TextField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        hintText: 'Search Items',
        hintStyle:
            const TextStyle(color: ColorConstants.greyColor, fontSize: 12),
        prefixIcon: const Icon(
          Icons.search,
          color: ColorConstants.headingColor,
        ),
        iconColor: ColorConstants.greyColor,
      ),
    ),
  );
}
