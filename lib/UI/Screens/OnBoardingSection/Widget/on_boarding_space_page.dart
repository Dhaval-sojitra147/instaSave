import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

class OnBoardingSpacePage extends StatelessWidget {
  final String fileAssetPath;
  final String onBoardDescription;
  final String onBoardingTitle;

  const OnBoardingSpacePage(
      {Key? key,
      required this.fileAssetPath,
        required this.onBoardingTitle,
      required this.onBoardDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: displayWidth(context) * 0.27,right: displayWidth(context) * 0.22),
          child: Image.asset(
            alignment: Alignment.center,
            fileAssetPath,
            width: displayWidth(context) * 0.5,
            height: displayHeight(context) * 0.23,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: displayHeight(context) * 0.19,
          ),
          child: Center(
            child: Text(
              onBoardDescription,
              textAlign: TextAlign.center,
              style: TextStylePoppinsSemiBold20(
                color: ColorConstants.white,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: displayHeight(context) * 0.009,),
          child: Center(
            child: Text(
              onBoardingTitle,
              textAlign: TextAlign.center,
              style: TextStylePoppinsRegular14(
                color: ColorConstants.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
