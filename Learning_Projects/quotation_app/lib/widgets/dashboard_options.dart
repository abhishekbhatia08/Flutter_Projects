import 'package:flutter/material.dart';

class DashboardOptions extends StatelessWidget {
  final String optionName;
  final String image;
  final dynamic onTap;
  const DashboardOptions({
    super.key,
    required this.optionName,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
              child: Image.asset(image),
            ),
            Text(optionName,style: const TextStyle(fontSize: 11),)
          ],
        ),
      ),
    );
  }
}
