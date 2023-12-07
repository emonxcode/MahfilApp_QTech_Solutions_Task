import 'package:flutter/material.dart';
import 'package:mahfil_app/src/utils/app_colors.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  const AppTextWidget(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.maxLines,
      this.textAlign,
      this.textDecoration,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.left,
      softWrap: true,
      overflow: overflow,
      textAlign: textAlign ??
          TextAlign
              .start, // I used ellipsis, but it works with others (fade, clip, etc.)

      maxLines: maxLines,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 18,
          color: color ?? AppColors.primaryTextColor,
          overflow: maxLines != null ? TextOverflow.ellipsis : null,
          decoration: textDecoration,
          fontFamily: 'Ador'),
    );
  }
}
