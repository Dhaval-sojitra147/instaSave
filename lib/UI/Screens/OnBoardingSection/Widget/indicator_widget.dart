// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';

class IndicatorWidget extends StatelessWidget {
  final Color indicatorColor;
  final int selectedIndex;

  IndicatorWidget(
      {Key? key, required this.indicatorColor, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: displayWidth(context) * 0.066,
          height: displayHeight(context) * 0.019,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 200,
              ),
              width: selectedIndex == 0
                  ? displayWidth(context) * 0.064
                  : displayWidth(context) * 0.0213,
              height: displayHeight(context) * 0.011,
              decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? indicatorColor
                      : indicatorColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: ColorConstants.orange),
                ),
            ),
          ),
        ),
        SizedBox(
          width: displayWidth(context) * 0.064,
          height: displayHeight(context) * 0.019,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 200,
              ),
              width: selectedIndex == 1
                  ? displayWidth(context) * 0.064
                  : displayWidth(context) * 0.0213,
              height: displayHeight(context) * 0.011,
              decoration: BoxDecoration(
                  color: selectedIndex == 1
                      ? indicatorColor
                      : indicatorColor.withOpacity(0.1),
                  border: Border.all(color: ColorConstants.orange),
                borderRadius: BorderRadius.circular(4),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
