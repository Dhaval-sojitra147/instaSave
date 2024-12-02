import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/MainSection/Widgets/BottomBar/back_card.dart';
import 'package:instasave/Widgets/blur.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
    required this.active,
    this.homeTap,
    this.collectionTap,
    this.settingTap,
  }) : super(key: key);

  final GestureTapCallback? homeTap;
  final GestureTapCallback? collectionTap;
  final GestureTapCallback? settingTap;
  final int active;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Blur(
            blurColor: ColorConstants.cardBackGroundColor,
            blur: 23,
            colorOpacity: .6,
            child: Container(
              height: displayHeight(context) * .07,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: ColorConstants.borderColor.withOpacity(.9), width: 1)),
              ),
            ),
          ),
          SizedBox(
            height: displayHeight(context) * .089,
            width: displayWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: ColorConstants.transparent,
                  onTap: homeTap,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: displayWidth(context) * .213,
                        height: displayHeight(context) * 0.06,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedPadding(
                              duration: const Duration(milliseconds: 250),
                              padding: EdgeInsets.only(
                                  bottom: active == 0
                                      ? displayHeight(context) * .012
                                      : 0,
                                  left: active == 0
                                      ? displayWidth(context) * .0266
                                      : 0),
                              child: RotatedBox(
                                quarterTurns: 4,
                                child: AnimatedRotation(
                                  turns: active == 0 ? 0.03 : 0,
                                  //tan(-3) : tan(0),
                                  duration: const Duration(milliseconds: 250),
                                  child: BackCard(active: active, position: 0,),
                                ),
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                active == 0
                                    ? ImageConstants.homeSelectedIcon
                                    : ImageConstants.homeIcon,
                                height: active == 0
                                    ? displayHeight(context) * .0406
                                    : displayHeight(context) * .0295,
                                width: active == 0
                                    ? displayWidth(context) * .088
                                    : displayWidth(context) * .064,
                              ),
                            ),
                          ],
                        ),
                      ),
                      active == 0
                          ? Container(
                              // margin: EdgeInsets.only(
                              //     bottom: displayHeight(context) * .0184),
                              child: Text(
                                AppConstants.home.tr,
                                style: TextStylePoppinsMedium12(
                                    color: Colors.white),
                              ))
                          : Container(),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: ColorConstants.transparent,
                  onTap: collectionTap,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: displayWidth(context) * .213,
                        height: displayHeight(context) * .06,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedPadding(
                              duration: const Duration(milliseconds: 250),
                              padding: EdgeInsets.only(
                                  bottom: active == 1
                                      ? displayHeight(context) * .012
                                      : 0,
                                  left: active == 1
                                      ? displayWidth(context) * .0266
                                      : 0),
                              child: RotatedBox(
                                quarterTurns: 4,
                                child: AnimatedRotation(
                                  turns: active == 1 ? 0.05 : 0,
                                  //tan(-3) : tan(0),
                                  duration: const Duration(
                                    milliseconds: 250,
                                  ),
                                  child: BackCard(active: active, position: 1,),
                                ),
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                active == 1
                                    ? ImageConstants.collectionSelectedIcon
                                    : ImageConstants.collectionIcon,
                                height: active == 1
                                    ? displayHeight(context) * .0406
                                    : displayHeight(context) * .0295,
                                width: active == 1
                                    ? displayWidth(context) * .088
                                    : displayWidth(context) * .064,
                              ),
                            ),
                          ],
                        ),
                      ),
                      active == 1
                          ? Container(
                              // margin: EdgeInsets.only(
                              //     bottom: displayHeight(context) * .0184),
                              child: Text(
                                AppConstants.collection.tr,
                                style: TextStylePoppinsMedium12(
                                    color: Colors.white),
                              ))
                          : Container(),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: ColorConstants.transparent,
                  onTap: settingTap,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: displayWidth(context) * .213,
                        height: displayHeight(context) * .06,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedPadding(
                              duration: const Duration(milliseconds: 250),
                              padding: EdgeInsets.only(
                                  bottom: active == 2
                                      ? displayHeight(context) * .012
                                      : 0,
                                  left: active == 2
                                      ? displayWidth(context) * .0266
                                      : 0),
                              child: RotatedBox(
                                quarterTurns: 4,
                                child: AnimatedRotation(
                                  turns: active == 2 ? 0.05 : 0,
                                  //tan(-3) : tan(0),
                                  duration: const Duration(milliseconds: 250),
                                  child: BackCard(active: active, position: 2,),
                                ),
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                active == 2
                                    ? ImageConstants.settingSelectedIcon
                                    : ImageConstants.settingIcon,
                                height: active == 2
                                    ? displayHeight(context) * .0406
                                    : displayHeight(context) * .0295,
                                width: active == 2
                                    ? displayWidth(context) * .088
                                    : displayWidth(context) * .064,
                              ),
                            ),
                          ],
                        ),
                      ),
                      active == 2
                          ? Container(
                              // margin: EdgeInsets.only(
                              //     bottom: displayHeight(context) * .0184),
                              child: Text(
                                AppConstants.setting.tr,
                                style: TextStylePoppinsMedium12(
                                    color: Colors.white),
                              ))
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

