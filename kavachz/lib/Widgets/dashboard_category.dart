import 'package:flutter/material.dart';
import 'package:kavachz/Constants/color_constants.dart';

class DashboardCategoryCard extends StatelessWidget {
  final String itemCategory;
  final String itemImage;
  bool itemSelected;
  dynamic onCategorySelect;

  DashboardCategoryCard({
    super.key,
    required this.itemCategory,
    required this.itemImage,
    required this.itemSelected,
    required this.onCategorySelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCategorySelect,
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Container(
          decoration: itemSelected
              ? const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                  color: ColorConstants.primary,
                  width: 4,
                )))
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  itemImage,
                  height: 44,
                  width: 44,
                ),
              ),
              Text(
                itemCategory,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: itemSelected
                      ? ColorConstants.primary
                      : ColorConstants.headingColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
