// ignore_for_file: must_be_immutable, use_full_hex_values_for_flutter_colors, prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/Behaviour/behaviour.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/Widget/next_page_navigation_button.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/Widget/indicator_widget.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/Widget/intro_space_page.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/work_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class DownLoadIntroScreen extends GetView<WorkController> {
  @override
  DownLoadIntroScreen({super.key});

  WorkController con = Get.put(WorkController());

  @override
  Widget build(BuildContext context) {
    print("(((((((${con.initialIndex.value}");
    return GetBuilder<WorkController>(
        init: WorkController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: instasaveAppBar(
                title: "${AppConstants.step.tr} ${con.initialIndex.value + 1}",
                onBackTap: () {
                  print("*******************");
                  if (con.initialIndex.value != 0) {
                    con.initialIndex.value--;
                    con.introController.value.animateToPage(
                      con.initialIndex.value,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                    con.update();
                  } else {
                    Get.back();
                  }
                },
              ),
              body: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 200,
                ),
                width: displayWidth(context),
                height: displayHeight(context),
                child: Stack(
                  children: [
                    Column(
                      children: [
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
                                  controller.update();
                                },
                                children: [
                                  IntroSpacePage(
                                    fileAssetPath:
                                        ImageConstants.downLoadIntroFirst,
                                    onBoardDescription: AppConstants
                                        .openInstagramAndCopyTheLinkOfWhatYouWantToDownload
                                        .tr,
                                  ),
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      IntroSpacePage(
                                        fileAssetPath:
                                            ImageConstants.downLoadIntroSecond,
                                        onBoardDescription: AppConstants
                                            .justPastLinkToURLPastBoxAndClickToFindEnjoyYourFavoriteReelsPostOrStory
                                            .tr,
                                      ),
                                      Container(
                                        height: displayHeight(context) * 0.165,
                                        width: displayWidth(context) * 0.90,
                                        margin: EdgeInsets.only(
                                            top: displayHeight(context) * 0.179, left: displayWidth(context) * 0.106, right: displayWidth(context) * 0.106),
                                        child: Image.asset(
                                            ImageConstants
                                                .downLoadIntroSecondInput,
                                            fit: BoxFit.fill),
                                      ),
                                      Container(
                                        height: displayHeight(context) * 0.221,
                                        width: displayWidth(context) * 0.48,
                                        margin:
                                            EdgeInsets.only(top: displayHeight(context) * 0.034, right: displayWidth(context)* 0.106),
                                        child: Transform.rotate(
                                          angle: -2 * pi / 180,
                                          child: Image.asset(
                                              ImageConstants
                                                  .downLoadIntroSecondPastHere,
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      IntroSpacePage(
                                        fileAssetPath:
                                            ImageConstants.downLoadIntroThird,
                                        onBoardDescription: AppConstants
                                            .clickToDownloadAndEnjoyYourFavoriteImageReelsAndStories
                                            .tr,
                                      ),
                                      Container(
                                        height: displayHeight(context)*0.05,
                                        width: displayWidth(context)*0.11,
                                        margin: EdgeInsets.only(
                                            top: displayHeight(context)*0.481, right: displayWidth(context) * 0.306),
                                        child: Image.asset(
                                          ImageConstants
                                              .downloadThirdIntroButton,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          height:
                                              displayHeight(context) * 0.070,
                                          width: displayWidth(context) * 0.390,
                                          margin: EdgeInsets.only(
                                              bottom: displayHeight(context) * 0.123, left: displayWidth(context)*0.010),
                                          child: Transform.rotate(
                                            angle: 2 * pi / 180,
                                            child: Image.asset(
                                                ImageConstants
                                                    .downLoadIntroThirdClick,
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          height: displayHeight(context)*0.221,
                                          width: displayWidth(context) * 0.360,
                                          margin: EdgeInsets.only(
                                              left:
                                                  displayWidth(context) * 0.300,
                                              top: displayHeight(context) *
                                                  0.400,
                                              bottom: displayHeight(context)*0.072),
                                          child: Transform.rotate(
                                            angle: 5 * pi / 180,
                                            child: Image.asset(
                                                ImageConstants
                                                    .downloadIntroThirdLine,
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        controller.initialIndex.value < 2
                            ? Padding(
                            padding: EdgeInsets.all(displayWidth(context) * .053),
                              child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => IndicatorWidget(
                                        key: key,
                                        indicatorColor: controller
                                                    .initialIndex.value ==
                                                0
                                            ? ColorConstants.orange
                                            : controller.initialIndex.value == 1
                                                ? ColorConstants.orange
                                                : controller.initialIndex.value ==
                                                        2
                                                    ? ColorConstants.orange
                                                    : ColorConstants.white,
                                        selectedIndex:
                                            controller.initialIndex.value,
                                        isRepostScreen: false,
                                      ),
                                    ),
                                    NextPageNavigationButton(
                                      onPressed: () {
                                        con.getDownloadIntroData();
                                      },
                                    ),
                                  ],
                                ),
                            )
                            : GestureDetector(
                                onTap: () {
                                  con.introController.value = PageController(initialPage: 0);
                                  con.initialIndex.value = 0;
                                  Get.offNamed(RoutesConstants.workScreen);
                                },
                                child: Center(
                                  child: Container(
                                    height: displayHeight(context)*0.066,
                                    width: displayWidth(context)*0.442,
                                    margin: EdgeInsets.only(bottom: displayHeight(context)*0.022),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      gradient: LinearGradient(
                                          colors: ColorConstants
                                              .linearGradientButton),
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppConstants.finish.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStylePoppinsMedium16(
                                            color: ColorConstants.grey900),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
