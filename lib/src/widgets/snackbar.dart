import 'package:flutter/material.dart';
import 'package:mahfil_app/src/utils/app_colors.dart';


class Utils {
  static void customSnackBar(
      {required context,
      required String snackText,
      SnackBarBehavior? snackBehavior,
      SnackBarAction? snackBarAction,
      double? snackTextSize,
      Color? snackTextColor,
      int? snackDuration,
      Color? snackBackgroundColor}) {
    final snack = SnackBar(
      backgroundColor: snackBackgroundColor ?? AppColors.blackColor,
      behavior: snackBehavior ?? SnackBarBehavior.fixed,
      elevation: 0,
      action: snackBarAction,
      content: 
          Text(snackText, style: TextStyle(color: snackTextColor ?? Colors.white)),
      duration: Duration(seconds: snackDuration ?? 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
