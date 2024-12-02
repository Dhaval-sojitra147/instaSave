// ignore_for_file: must_be_immutable, use_full_hex_values_for_flutter_colors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/Screens/download_intro_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/Screens/repost_intro_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/Widget/custom_paint_calss.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/work_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class WorkScreen extends GetView<WorkController> {
  @override
  WorkScreen({super.key});

  WorkController con = Get.put(WorkController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            instasaveAppBar(title: AppConstants.howToWorks.tr,onBackTap: (){Get.back();Get.back();Get.back();Get.back();}),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: displayHeight(context) * 0.133, left: displayWidth(context) * 0.224, right: displayWidth(context) * 0.2),
              child: Image.asset(
                ImageConstants.howToWork,
                height: displayHeight(context) * 0.266,
                width: displayWidth(context) * 0.576,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: displayHeight(context) * 0.098),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(DownLoadIntroScreen());
                    },
                    child: Container(
                      height: displayHeight(context) * 0.22,
                      margin: EdgeInsets.only(top: displayHeight(context) * 0.01, left: displayWidth(context) * 0.04, right: displayWidth(context) * 0.04),
                      child: Stack(
                        children: [
                          Container(
                            height: displayHeight(context) * 0.197,
                            width: displayWidth(context) * 0.42,
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.borderColor),
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Stack(
                              children: [
                                Align(alignment: Alignment.topLeft,child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),child: Image.asset(ImageConstants.workIntroGlassMorphism,fit: BoxFit.fill,)),),
                                Container(
                                  margin: EdgeInsets.only(top: displayHeight(context) * 0.046,left: displayWidth(context) * 0.032,right: displayWidth(context) * 0.032),
                                  child: Text(
                                    AppConstants.howToDownloadPostReelsAndStories.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStylePoppinsSemiBold14(
                                        color: ColorConstants.grey300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomPaint(
                                  painter: CustomDrawPainter(),
                                  child: Container(
                                    height: displayHeight(context) * 0.047,
                                    width: displayWidth(context) * 0.1,
                                    child: Container(
                                      height: displayHeight(context) * 0.039,
                                      width: displayWidth(context) * 0.085,
                                      margin: EdgeInsets.only(
                                          top: displayHeight(context) * 0.004, left: displayWidth(context) * 0.012, right: displayWidth(context) * 0.012, bottom: displayHeight(context) * 0.004),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromARGB(255, 245, 109, 255),
                                          Color.fromARGB(255, 158, 36, 255)
                                        ]),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.navigate_next_rounded,
                                          color: ColorConstants.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(RepostIntroScreen());
                    },
                    child: Container(
                      height: displayHeight(context) * 0.22,
                      margin: EdgeInsets.only(top: displayHeight(context) * 0.012, left: displayWidth(context) * 0.04, right: displayWidth(context) * 0.04),
                      child: Stack(
                        children: [
                          Container(
                            height: displayHeight(context) * 0.197,
                            width: displayWidth(context) * 0.42,
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.borderColor),
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Stack(
                              children: [
                                Align(alignment: Alignment.topLeft,child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),child: Image.asset(ImageConstants.workIntroGlassMorphism,fit: BoxFit.fill,)),),
                                Container(
                                  margin: EdgeInsets.only(top: displayHeight(context) * 0.046,left: displayWidth(context) * 0.032,right: displayWidth(context) * 0.032),
                                  child: Text(
                                    AppConstants.howToRepostPostReelsStories.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStylePoppinsSemiBold14(
                                        color: ColorConstants.grey300),
                                  ),
                                ),
                              ],
                            ),
                            ),
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomPaint(
                                  painter: CustomDrawPainter(),
                                  child: Container(
                                    height: displayHeight(context) * 0.047,
                                    width: displayWidth(context) * 0.1,
                                    child: Container(
                                      height: displayHeight(context) * 0.039,
                                      width: displayWidth(context) * 0.085,
                                      margin: EdgeInsets.only(
                                          top: displayHeight(context) * 0.004, left: displayWidth(context) * 0.012, right: displayWidth(context) * 0.012, bottom: displayHeight(context) * 0.004),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromARGB(255, 245, 109, 255),
                                          Color.fromARGB(255, 158, 36, 255)
                                        ]),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.navigate_next_rounded,
                                          color: ColorConstants.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
