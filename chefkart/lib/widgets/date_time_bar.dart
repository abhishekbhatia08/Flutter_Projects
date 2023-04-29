import 'package:chefkart/utils/color_constants.dart';
import 'package:chefkart/utils/image.dart';
import 'package:flutter/material.dart';

class DateTimeBar extends StatelessWidget {
  final String date;
  final String time;
  dynamic datePress;
  dynamic timePress;
  DateTimeBar({
    super.key,
    required this.date,
    required this.time,
    required this.datePress,
    required this.timePress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 50,
              color: ColorConstants.black,
            ),
            Container(
              height: 50,
              color: ColorConstants.white,
            ),
          ],
        ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 23),
            height: 65,
            decoration: const BoxDecoration(
                color: ColorConstants.white,
                boxShadow: [BoxShadow(blurRadius: 2)],
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconText(context, ConstImage.calendar, date, datePress),
                const VerticalDivider(thickness: 2),
                iconText(context, ConstImage.clock, time, timePress),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

@override
Widget iconText(
  BuildContext context,
  String image,
  String text,
  dynamic onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: Image.asset(
            image,
            height: 16,
            width: 16,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
