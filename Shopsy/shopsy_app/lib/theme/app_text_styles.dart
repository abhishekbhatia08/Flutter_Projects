import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy_app/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle appBarHeading() => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle ts14Bold(Color? color) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: color,
      );
}
