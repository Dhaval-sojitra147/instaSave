import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';

class NextPageNavigationButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const NextPageNavigationButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        /** next button in navigation bar **/
        height: displayWidth(context) * .128,
        width: displayWidth(context) * .128,
        decoration: BoxDecoration(
           gradient: LinearGradient(colors: ColorConstants.linearGradientDeleteButton),
          shape: BoxShape.circle,
        ),
        child: Icon(
        Icons.arrow_forward_ios_rounded,
        color: ColorConstants.white,
        size: displayWidth(context) * .06,
      ),
      ),
    );
  }
}
