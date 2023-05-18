import 'package:flutter/material.dart';
import 'package:meragi/utils/color_constants.dart';
import 'package:meragi/widgets/rating_box.dart';

class ProductCard extends StatelessWidget {
  final String productTitle;
  final String productImage;
  final String price;
  final String rating;
  final String ratingCount;
  final String category;
  final dynamic viewMore;

  const ProductCard({
    super.key,
    required this.productTitle,
    required this.productImage,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.category,
    required this.viewMore,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: screenSize.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        productTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        category.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      RatingBox(
                        rating: rating,
                        number: ratingCount,
                      ),
                      viewMoreButton(context, viewMore),
                      // Text(
                      //   productDescription,
                      //   maxLines: 2,
                      //   style: const TextStyle(
                      //       fontSize: 10,
                      //       fontWeight: FontWeight.normal,
                      //       color: ColorConstants.descriptionColor),
                      // ),
                    ],
                  ),
                ),
                const Spacer(),
                image(context, productImage),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

Widget image(
  BuildContext context,
  String productImage,
) {
  return SizedBox(
    height: 110,
    child: Image.network(
      productImage,
      width: 92,
      height: 70,
      fit: BoxFit.fill,
    ),
  );
}

@override
Widget viewMoreButton(BuildContext context, dynamic addButtonPress) {
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
    autofocus: true,
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
    child: const Text(
      "View More",
      style: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
