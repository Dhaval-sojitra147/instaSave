import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';

class downloadButton extends StatelessWidget {
  const downloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayWidth(context) * .128,
      width: displayWidth(context) * .128,
      margin: EdgeInsets.symmetric(
        vertical: displayHeight(context) * .0147,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.download,
        color: ColorConstants.textColor,
        size: displayHeight(context) * .0270,
      ),
    );
  }
}
