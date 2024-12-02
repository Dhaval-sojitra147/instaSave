// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_full_hex_values_for_flutter_colors, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/Behaviour/behaviour.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/Widget/indicator_widget.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/Widget/next_page_navigation_button.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/Widget/on_boarding_space_page.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/onboarding_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  OnBoardingScreen({Key? key}) : super(key: key);
  OnBoardingController con = Get.put(OnBoardingController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.black,
        body: AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ),
          width: displayWidth(context),
          height: displayHeight(context),
          child: Obx(() =>
            Stack(
              children: [
                Container(
                  height: displayHeight(context),
                  width: displayWidth(context),
                  margin: EdgeInsets.only(bottom: displayHeight(context) * .25),
                  child: Image.asset(
                    controller.initialIndex.value == 0 ?ImageConstants.onBoardingBackground :
                    ImageConstants.illustrationOne,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.015,right: displayHeight(context) * 0.015
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          /** skip button code **/
                          controller.initialIndex.value ==2
                              ? Container()
                              : TextButton(
                                  onPressed: () {
                                    powerPermissionBox(context);
                                  },
                                  child: Text(
                                    AppConstants.skip.tr,
                                    textAlign: TextAlign.right,
                                    style: TextStylePoppinsMedium16(
                                      color: ColorConstants.white,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowIndicator();
                            return false;
                          },
                          child: PageView(
                            physics: const ClampingScrollPhysics(),
                            controller: con.introController.value,
                            /** page change code **/
                            onPageChanged: (index) {
                              con.initialIndex.value = index;
                            },
                            children: [
                              OnBoardingSpacePage(
                                fileAssetPath: ImageConstants.illustration,
                                onBoardDescription:
                                    AppConstants.downloadVideoAndShare.tr,
                                onBoardingTitle: AppConstants
                                    .downloadAndShareAnyInstagramVideoWithOneTouch
                                    .tr,
                              ),
                              /*OnBoardingSpacePage(
                                fileAssetPath: ImageConstants.illustrationOne,
                                onBoardDescription:
                                    AppConstants.essentialsFeature.tr,
                                onBoardingTitle: AppConstants
                                    .hashtagAndCaptionGeneRaToForInstagramReelsAndFeeds
                                    .tr,
                              ),*/

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: displayHeight(context) * 0.425,
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppConstants.essentialsFeature.tr,
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
                                        AppConstants
                                            .hashtagAndCaptionGeneRaToForInstagramReelsAndFeeds
                                            .tr,
                                        textAlign: TextAlign.center,
                                        style: TextStylePoppinsRegular14(
                                          color: ColorConstants.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: displayWidth(context) * 0.053,right: displayWidth(context) * 0.053, bottom: displayWidth(context) * 0.064),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(()=>
                            IndicatorWidget(
                              key: key,
                              indicatorColor: controller.initialIndex.value == 0
                                  ? ColorConstants.orange
                                  : controller.initialIndex.value == 1
                                  ? ColorConstants.orange : ColorConstants.white,
                              selectedIndex: controller.initialIndex.value,
                            ),
                          ),
                          NextPageNavigationButton(
                            onPressed: () {
                              controller.initialIndex.value ==1 ? powerPermissionBox(context) : con.getIntroData();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  powerPermissionBox(context) {
    showDialog(
      barrierColor: ColorConstants.black.withOpacity(.7),
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorConstants.textColor),
            borderRadius: BorderRadius.circular(16)
          ),
          backgroundColor: ColorConstants.black,
          contentPadding: EdgeInsets.zero,
          content: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: displayHeight(context) * 0.54,
              width: displayWidth(context) * 0.893,
              padding: EdgeInsets.all(displayHeight(context) * 0.039),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageConstants.onBoardingGlassMorphism),fit: BoxFit.fill),
              ),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    width: displayWidth(context) * 0.192,
                    height: displayWidth(context) * 0.192,
                    ImageConstants.powerOptimisation,
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.039),
                    child: Text(
                      AppConstants.powerOptimisation.tr,
                      style: TextStylePoppinsSemiBold24(
                          color: ColorConstants.white,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.009),
                    child: Text(
                      AppConstants
                          .allowInstaDownloaderToOperateInBackground.tr,
                      textAlign: TextAlign.center,
                      style: TextStylePoppinsRegular16(
                          color: ColorConstants.grey400),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      storagePermissionBox(context);
                    },
                    child: Container(
                      height: displayHeight(context) * 0.064,
                      width: displayWidth(context) * 0.722,
                      margin: EdgeInsets.only(
                        top: displayHeight(context) * 0.039,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: ColorConstants.linearGradientButton),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        AppConstants.allow.tr,
                        style: TextStylePoppinsMedium14(
                            color: ColorConstants.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  storagePermissionBox(context) {
    showDialog(
      barrierColor: ColorConstants.black.withOpacity(.7),
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorConstants.textColor),
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: ColorConstants.black,
          contentPadding: EdgeInsets.zero,
          content: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: displayHeight(context) * 0.54,
              width: displayWidth(context) * 0.893,
              padding: EdgeInsets.all(displayHeight(context) * 0.039),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageConstants.onBoardingGlassMorphism),fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    width: displayWidth(context) * 0.192,
                    height: displayWidth(context) * 0.192,
                    ImageConstants.storageAccess,
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.039),
                    child: Text(
                      AppConstants.storageAccess.tr,
                      textAlign: TextAlign.center,
                      style: TextStylePoppinsSemiBold24(
                          color: ColorConstants.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.009),
                    child: Text(
                      AppConstants
                          .grantStoragePermissionToSaveDownloadFile.tr,
                      textAlign: TextAlign.center,
                      style: TextStylePoppinsRegular16(
                          color: ColorConstants.grey400),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      /** Permission request **/
                      await Permission.storage.isGranted ;
                      con.routeToMainScreen();
                    },
                    child: Container(
                      height: displayHeight(context) * 0.064,
                      width: displayWidth(context) * 0.722,
                      margin: EdgeInsets.only(
                        top: displayHeight(context) * 0.039,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: ColorConstants.linearGradientButton),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          AppConstants.allow.tr,
                          style: TextStylePoppinsMedium14(
                              color: ColorConstants.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
