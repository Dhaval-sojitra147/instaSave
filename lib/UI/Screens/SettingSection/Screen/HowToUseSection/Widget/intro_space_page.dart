// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

class IntroSpacePage extends StatelessWidget {
  final String fileAssetPath;
  final String onBoardDescription;
  const IntroSpacePage(
      {Key? key,
        required this.fileAssetPath,
        required this.onBoardDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left:displayWidth(context)*0.106,right: displayWidth(context)*0.104,bottom: displayHeight(context)*0.077),
          child: Image.asset(
            height: displayHeight(context) * 0.463,
            width: displayWidth(context) * 0.789,
            fileAssetPath,
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          child: Center(
            child: Text(
              onBoardDescription,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStylePoppinsRegular14(
                color: ColorConstants.white.withOpacity(0.4),

              ),
            ),
          ),
        ),
      ],
    );
  }
}
