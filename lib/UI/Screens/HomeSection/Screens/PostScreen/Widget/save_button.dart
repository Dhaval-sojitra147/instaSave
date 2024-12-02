
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';

class saveButton extends StatelessWidget {
  const saveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayWidth(context) * .128,
      width: displayWidth(context) * .128,
      margin: EdgeInsets.symmetric(
          vertical: displayHeight(context) * .0147,
          horizontal: displayWidth(context) * .022),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border:
          Border.all(color: ColorConstants.orange),
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: ColorConstants
                  .linearGradientDownloadButton)),
      child: SvgPicture.asset(
        ImageConstants.saveIcon,
        height: displayHeight(context) * .0295,
        width: displayWidth(context) * .064,
        alignment: Alignment.center,
      ),
    );
  }
}
