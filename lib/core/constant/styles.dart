import 'colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle textStyle({
    double size = 14,
    Color? color,
    FontWeight weight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: size,
      color: color ?? AppColors.textColorDark,
      fontWeight: weight,
    );
  }

  static BoxDecoration linearBoxDecoration({double radius = 15}) {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
      gradient: LinearGradient(
        colors: [
          AppColors.darkColor.withOpacity(1),
          AppColors.darkColor.withOpacity(0),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: const [
          0.0,
          0.9,
        ],
      ),
    );
  }

  static OutlineInputBorder outlineBoxDecoration(
    Color color, {
    double width = 1,
    double radius = 15,
  }) {
    return const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        radius,
      ),
      borderSide: BorderSide(
        width: width,
        color: color,
      ),
    );
  }
}
