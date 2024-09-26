import 'package:flutter/material.dart';
import 'package:kavachz/Constants/color_constants.dart';
import 'package:kavachz/Constants/image_constants.dart';
import 'package:kavachz/Models/items.dart';
import 'package:kavachz/Widgets/search_item.dart';

class RecentSearchItems extends StatelessWidget {
  static const items = [
   Items(ImageConstants.apple, "Apple", "20", "Fruits and Vegetables", "C1"),
    Items(ImageConstants.mango, "Mango", "20", "Fruits and Vegetables", "C1"),
    Items(ImageConstants.pineapple, "Pineapple", "20", "Fruits and Vegetables","C1"),
    Items(ImageConstants.banana, "Banana", "20", "Fruits and Vegetables", "C1"),
    Items(ImageConstants.herbs, "Herbs", "20", "Leafy, Herbs\n& Seasonings", "C3"),
  ];
  const RecentSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Clear All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.greyColor,
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return SearchItem(
                itemName: item.itemName,
                itemCategory: item.itemCategory,
                itemImage: item.itemImage,
              );
            },
          )
        ],
      ),
    );
  }
}
