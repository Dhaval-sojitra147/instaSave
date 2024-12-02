import 'package:flutter/material.dart';

class LayoutConstants {
  static Decoration decoration({required Color color}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color,
    );
  }

  //sizedbox
  static SizedBox standardSpacingVertical = const SizedBox(
    height: 16,
  );
  static SizedBox standardSpacingVertical8 = const SizedBox(
    height: 8,
  );
  static SizedBox standardSpacingVertical32 = const SizedBox(
    height: 32,
  );
  static SizedBox standardSpacingHorizontal16 = const SizedBox(
    width: 16,
  );
  static SizedBox standardSpacingHorizontal8 = const SizedBox(
    width: 8,
  );
  static SizedBox standardSpacingHorizontal24 = const SizedBox(
    width: 24,
  );

  static Container dividerVertical = Container(
    color: Colors.black.withOpacity(0.9),
    width: 1,
    height: 90,
  );
}

EdgeInsets standardPadding(
    {required double screenHeight, required double screenWidth}) {
  double horizontalPadding = screenWidth * .05333;
  double verticalPadding = screenHeight * .02463;
  return EdgeInsets.only(
    left: horizontalPadding,
    right: horizontalPadding,
    top: verticalPadding,
    bottom: verticalPadding,
  );
}

EdgeInsets horizontalPadding({required double screenWidth}) {
  double horizontalPadding = screenWidth * .05333;
  return EdgeInsets.only(
    left: horizontalPadding,
    right: horizontalPadding,
  );
}

EdgeInsets verticalPadding({required double screenHeight}) {
  double verticalPadding = screenHeight * .02463;
  return EdgeInsets.only(
    top: verticalPadding,
    bottom: verticalPadding,
  );
}
