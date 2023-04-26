import 'package:flutter/material.dart';
import 'package:kavachz/Constants/color_constants.dart';

class ItemCard extends StatelessWidget {
  final String itemName;
  final String itemCost;
  final String itemImage;
  dynamic addButton;

  ItemCard({
    super.key,
    required this.itemName,
    required this.itemCost,
    required this.itemImage,
    required this.addButton,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 112,
      width: screenSize.width * 0.6,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.borderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            itemImage,
            height: 96,
            width: 96,
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
                Row(
                  children: [
                    Text(
                      "₹$itemCost",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.headingColor,
                      ),
                    ),
                    const Text(
                      "/kg",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.lightGrey),
                    ),
                  ],
                ),
                addButtonWidget(
                  context,
                  addButton,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

@override
Widget addButtonWidget(BuildContext context, dynamic onPressed) {
  final screenSize = MediaQuery.of(context).size;
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.lightGreen,
          padding: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          maximumSize: Size.fromWidth(screenSize.width * 0.25)),
      child: Row(
        children: const [
          Text(
            "Add",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorConstants.primary,
            ),
          ),
          Spacer(),
          Icon(
            Icons.add,
            color: ColorConstants.primary,
          )
        ],
      ));
}

@override
Widget bottomButton(
  BuildContext context,
  String buttonText,
  dynamic bgColor,
  dynamic textColor,
  dynamic onPressed,
) {
  final screenSize = MediaQuery.of(context).size;

  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.lightGreen,
          padding: const EdgeInsets.all(8),
          maximumSize: Size.fromWidth(screenSize.width * 0.2)),
      child: Row(
        children: const [
          Text(
            "Add",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorConstants.primary,
            ),
          ),
          Icon(
            Icons.add,
            color: ColorConstants.primary,
          )
        ],
      ));
}
