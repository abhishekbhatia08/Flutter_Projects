import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy_app/main.dart';
import 'package:shopsy_app/theme/app_colors.dart';
import 'package:shopsy_app/theme/app_text_styles.dart';

class AppSnackBar {
  AppSnackBar._internal();

  static final AppSnackBar _instance = AppSnackBar._internal();

  /// App Snackbar to show text messages
  factory AppSnackBar() {
    return _instance;
  }

  /// Get custom SnackBar with text message
  static SnackBar _getSnackBar({
    required String message,
    Color? textColor,
    Color? backgroundColor,
    Duration? duration,
  }) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: AppTextStyles.ts14Bold(textColor ?? AppColors.white),
      ),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(label: 'Done', onPressed: () {
        if (rootScaffoldMessengerKey.currentState != null) {
          rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        }
      }),
    );

    return snackBar;
  }

  /// Show SnackBar in screen
  static void showSnackBar({
    required String message,
    Color? textColor,
    Color? backgroundColor,
    Duration? duration,
  }) {
    final SnackBar snackBar = _getSnackBar(message: message);

    if (rootScaffoldMessengerKey.currentState != null) {
      rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    }
  }

  /// Remove all SnackBar from screen
  void removeSnackBar() {
    rootScaffoldMessengerKey.currentState?.clearSnackBars();
  }
}
