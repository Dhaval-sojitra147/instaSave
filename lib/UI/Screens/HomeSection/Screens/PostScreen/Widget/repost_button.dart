
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

class repostButton extends StatelessWidget {
  const repostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 20, bottom: 12, right: 8),
      height: displayHeight(context) * .0591,
      width: displayWidth(context) * .5946,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors:
            ColorConstants.linearGradientButton),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: ColorConstants.borderColor),
      ),
      alignment: Alignment.center,
      child: Text(
        AppConstants.repost.tr,
        style: TextStylePoppinsMedium16(),
      ),
    );
  }
}