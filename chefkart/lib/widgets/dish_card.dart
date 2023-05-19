import 'package:chefkart/utils/color_constants.dart';
import 'package:chefkart/utils/image.dart';
import 'package:chefkart/widgets/rating_box.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  final String dishName;
  final String dishImage;
  final String rating;
  final bool isNonVeg;
  final List<String> equipmentsName;
  final String dishDescription;
  final dynamic viewListPress;
  final dynamic addButton;

  const DishCard({
    super.key,
    required this.dishName,
    required this.dishImage,
    required this.rating,
    required this.isNonVeg,
    required this.equipmentsName,
    required this.dishDescription,
    required this.viewListPress,
    required this.addButton,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: screenSize.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            dishName,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.crop_square_sharp,
                                color: isNonVeg
                                    ? Colors.red
                                    : ColorConstants.green,
                                size: 20,
                              ),
                              Icon(Icons.circle,
                                  color: isNonVeg
                                      ? Colors.red
                                      : ColorConstants.green,
                                  size: 7),
                            ],
                          ),
                          RatingBox(rating: rating)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            requiredAppliances(context, ConstImage.refrigerator,
                                equipmentsName.first),
                            if (equipmentsName.length >= 2)
                              requiredAppliances(context,
                                  ConstImage.refrigerator, equipmentsName.last),
                            const VerticalDivider(
                              thickness: 2,
                              color: ColorConstants.disabledColor,
                            ),
                            // const Spacer(),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ingredients",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.black),
                                  ),
                                  GestureDetector(
                                    onTap: viewListPress,
                                    child: const Row(
                                      children: [
                                        Text(
                                          "View List ",
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                              color: ColorConstants.orange),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: ColorConstants.orange,
                                          size: 10,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        dishDescription,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: ColorConstants.descriptionColor),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                image(context, dishImage, addButton),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

@override
Widget requiredAppliances(
  BuildContext context,
  String applianceImage,
  String applianceName,
) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Image.asset(applianceImage)),
        Text(
          applianceName,
          style: const TextStyle(fontSize: 6, fontWeight: FontWeight.normal),
        )
      ],
    ),
  );
}

@override
Widget image(
  BuildContext context,
  String dishImage,
  dynamic addButtonPress,
) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      SizedBox(
        height: 110,
        child: Image.network(
          dishImage,
          width: 92,
          height: 70,
          fit: BoxFit.fill,
        ),
      ),
      Positioned(top: 65, width: 58, child: addButton(context, addButtonPress))
    ],
  );
}

@override
Widget addButton(BuildContext context, dynamic addButtonPress) {
  return MaterialButton(
    onPressed: addButtonPress,
    color: ColorConstants.white,
    elevation: 0,
    textColor: ColorConstants.orange,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        side: BorderSide(
          width: 1,
          color: ColorConstants.orange,
        )),
    height: 24,
    autofocus: true,
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: const Text(
      "Add",
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
