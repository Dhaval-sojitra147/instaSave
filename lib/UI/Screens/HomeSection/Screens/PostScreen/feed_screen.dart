// ignore_for_file: must_be_immutable, prefer_const_constructors, unrelated_type_equality_checks, use_build_context_synchronously, deprecated_member_use
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/myVideoPlayer.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/download_button.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/gradient_text.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/progress_hud.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/repost_button.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/save_button.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/scrolling_feed_indicator.dart';
import 'package:instasave/UI/Screens/HomeSection/home_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';
import 'package:share_plus/share_plus.dart';

class FeedScreen extends GetView<HomeController> {
  FeedScreen({super.key});

  @override
  HomeController controller = Get.put(HomeController());

  Future<Widget> banner(BuildContext context) async{
    await controller.postBannerAd.value.dispose();
    await controller.postBannerAds();
    return Container(
        margin: EdgeInsets.only(top: 24),
    height: controller.postBannerAd.value.size.height.toDouble(),//displayHeight(context) * .3078,
    width: controller.postBannerAd.value.size.width.toDouble(),//displayWidth(context) * .8933,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    ),
    alignment: Alignment.center,
    child: AdWidget(ad: controller.postBannerAd.value));
  }

  @override
  Widget build(BuildContext context) {
    controller.downloading(context);
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: instasaveAppBar(
          title: controller.feedCategory.value,
          getBack: true,
          onBackTap: (){
            Get.back();
            controller.isReadingDB.value=false;
          }
        ),
        body: Obx(
              () =>
              ModalProgressHUD(
                inAsyncCall: controller.isReadingDB.value,
                progressIndicator: CircularProgressIndicator(
                  color: ColorConstants.primary,
                ),
                blur: 1,
                color: ColorConstants.caption,
                child: SizedBox(
                  width: displayWidth(context),
                  height: displayHeight(context),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (
                        OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                          children: [

                            /// Feed
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: controller.feedCategory.value ==
                                    AppConstants.post.tr
                                    ? displayHeight(context) * .4556
                                    : displayHeight(context) * .6182,
                                //502 : 370,
                                maxWidth: controller.feedCategory.value ==
                                    AppConstants.post.tr
                                    ? displayWidth(context) * .8933
                                    : displayWidth(context) *
                                    .8933, //335 : 335,
                              ),
                              margin: EdgeInsets.only(
                                  top: displayHeight(context) * .0295,
                                  bottom: displayHeight(context) * .0172),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorConstants.caption,
                              ),
                              // alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  IgnorePointer(
                                    ignoring: true,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            child: Image.asset(
                                                ImageConstants
                                                    .feedGlassmorphism))),
                                  ),
                                  Container(
                                    height: controller.feedCategory.value ==
                                        AppConstants.post.tr
                                        ? displayHeight(context) * .4261
                                        : displayHeight(context) * .5886,
                                    width: controller.feedCategory.value ==
                                        AppConstants.post.tr
                                        ? displayWidth(context) * .8293
                                        : displayWidth(context) * .8293,
                                    margin: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: ColorConstants.appBar,
                                    ),
                                    child: controller.feedCategory.value ==
                                        AppConstants.post.tr
                                        ?

                                    /// Post Media
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Stack(
                                        children: [
                                          PageView.builder(
                                              itemCount: controller.feedUrl
                                                  .length,
                                              controller: controller
                                                  .pageController,
                                              onPageChanged: (value) {
                                                controller.imageIndex.value =
                                                    value;
                                              },
                                              physics:
                                              NeverScrollableScrollPhysics(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                  int index) =>
                                                  Stack(children: [
                                                    controller.feedUrl[index]
                                                        .toString()
                                                        .contains(
                                                        AppConstants.jpg.tr)
                                                        ? Center(
                                                      child:
                                                      RepaintBoundary(
                                                        key: controller
                                                            .imageKey,
                                                        child: Obx(
                                                              () =>
                                                              Stack(
                                                                alignment: controller
                                                                    .selectedVerticalAlignment[0] ==
                                                                    true &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        true
                                                                    ? Alignment
                                                                    .bottomLeft
                                                                    : controller
                                                                    .selectedVerticalAlignment[0] ==
                                                                    true &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        false
                                                                    ? Alignment
                                                                    .bottomRight
                                                                    : controller
                                                                    .selectedVerticalAlignment[0] ==
                                                                    false &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        false
                                                                    ? Alignment
                                                                    .topRight
                                                                    : Alignment
                                                                    .topLeft,
                                                                children: [
                                                                  if (controller
                                                                      .feedUrl[
                                                                  index] !=
                                                                      null)
                                                                    Image
                                                                        .network(
                                                                      controller
                                                                          .feedUrl[index],
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),

                                                                  /// Post Image AttributeMark
                                                                  if (controller
                                                                      .showAttributeMark[0] ==
                                                                      true)
                                                                    Container(
                                                                      height: displayHeight(
                                                                          context) *
                                                                          .02955,
                                                                      padding: EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                          4,
                                                                          horizontal:
                                                                          4),
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                          topRight: Radius
                                                                              .circular(
                                                                              controller
                                                                                  .selectedVerticalAlignment[0] ==
                                                                                  true &&
                                                                                  controller
                                                                                      .selectedHorizontalAlignment[0] ==
                                                                                      true
                                                                                  ? 4
                                                                                  : 0),
                                                                          bottomLeft: Radius
                                                                              .circular(
                                                                              controller
                                                                                  .selectedVerticalAlignment[0] ==
                                                                                  false &&
                                                                                  controller
                                                                                      .selectedHorizontalAlignment[0] ==
                                                                                      false
                                                                                  ? 4
                                                                                  : 0),
                                                                          bottomRight: Radius
                                                                              .circular(
                                                                              controller
                                                                                  .selectedVerticalAlignment[0] ==
                                                                                  false &&
                                                                                  controller
                                                                                      .selectedHorizontalAlignment[0] ==
                                                                                      true
                                                                                  ? 4
                                                                                  : 0),
                                                                          topLeft: Radius
                                                                              .circular(
                                                                              controller
                                                                                  .selectedVerticalAlignment[0] ==
                                                                                  true &&
                                                                                  controller
                                                                                      .selectedHorizontalAlignment[0] ==
                                                                                      false
                                                                                  ? 4
                                                                                  : 0),
                                                                        ),
                                                                        gradient: LinearGradient(
                                                                            colors: controller
                                                                                .selectedBGStyle[0] ==
                                                                                true
                                                                                ? [
                                                                              ColorConstants
                                                                                  .white,
                                                                              ColorConstants
                                                                                  .white
                                                                            ]
                                                                                : ColorConstants
                                                                                .lightAttributeMark),
                                                                      ),

                                                                      /// Post Attribute Mark
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius: BorderRadius
                                                                                .circular(
                                                                                2),
                                                                            child: Image
                                                                                .network(
                                                                              controller
                                                                                  .userProfilePic
                                                                                  .value,
                                                                              height: displayHeight(
                                                                                  context) *
                                                                                  .0197,
                                                                              width: 16,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width: displayWidth(
                                                                                context) *
                                                                                .01,
                                                                          ),
                                                                          GradientText(
                                                                            '@${controller
                                                                                .userName
                                                                                .value}',
                                                                            gradient: LinearGradient(
                                                                                colors: controller
                                                                                    .selectedBGStyle[0] ==
                                                                                    true
                                                                                    ? ColorConstants
                                                                                    .lightAttributeMark
                                                                                    : [
                                                                                  ColorConstants
                                                                                      .white,
                                                                                  ColorConstants
                                                                                      .white
                                                                                ]),
                                                                            style: TextStylePoppinsMedium10(
                                                                                color: Colors
                                                                                    .white),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                        ),
                                                      ),
                                                    )
                                                        : ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            8),
                                                        child: Obx(() =>
                                                            Stack(
                                                                alignment: controller
                                                                    .selectedVerticalAlignment[0] ==
                                                                    true &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        true
                                                                    ? Alignment
                                                                    .bottomLeft
                                                                    : controller
                                                                    .selectedVerticalAlignment[0] ==
                                                                    true &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        false
                                                                    ? Alignment
                                                                    .bottomRight
                                                                    : controller
                                                                    .selectedVerticalAlignment[0] ==
                                                                    false &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        false
                                                                    ? Alignment
                                                                    .topRight
                                                                    : Alignment
                                                                    .topLeft,
                                                                children: [
                                                                  MyVideoPlayer(
                                                                    autoPlay:
                                                                    true,
                                                                    videoUrl:
                                                                    controller
                                                                        .feedUrl[index],
                                                                    newKey:
                                                                    UniqueKey(),
                                                                  ),

                                                                  /// Post Video Attribute Mark
                                                                  if (controller
                                                                      .showAttributeMark[
                                                                  0] ==
                                                                      true)
                                                                    RepaintBoundary(
                                                                        key:
                                                                        controller
                                                                            .imageKey,
                                                                        child: Container(
                                                                            height: displayHeight(
                                                                                context) *
                                                                                .0295,
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius
                                                                                  .only(
                                                                                topRight: Radius
                                                                                    .circular(
                                                                                    controller
                                                                                        .selectedVerticalAlignment[0] ==
                                                                                        true &&
                                                                                        controller
                                                                                            .selectedHorizontalAlignment[0] ==
                                                                                            true
                                                                                        ? 4
                                                                                        : 0),
                                                                                bottomLeft: Radius
                                                                                    .circular(
                                                                                    controller
                                                                                        .selectedVerticalAlignment[0] ==
                                                                                        false &&
                                                                                        controller
                                                                                            .selectedHorizontalAlignment[0] ==
                                                                                            false
                                                                                        ? 4
                                                                                        : 0),
                                                                                bottomRight: Radius
                                                                                    .circular(
                                                                                    controller
                                                                                        .selectedVerticalAlignment[0] ==
                                                                                        false &&
                                                                                        controller
                                                                                            .selectedHorizontalAlignment[0] ==
                                                                                            true
                                                                                        ? 4
                                                                                        : 0),
                                                                                topLeft: Radius
                                                                                    .circular(
                                                                                    controller
                                                                                        .selectedVerticalAlignment[0] ==
                                                                                        true &&
                                                                                        controller
                                                                                            .selectedHorizontalAlignment[0] ==
                                                                                            false
                                                                                        ? 4
                                                                                        : 0),
                                                                              ),
                                                                              gradient: LinearGradient(
                                                                                  colors: controller
                                                                                      .selectedBGStyle[0] ==
                                                                                      true
                                                                                      ? [
                                                                                    ColorConstants
                                                                                        .white,
                                                                                    ColorConstants
                                                                                        .white
                                                                                  ]
                                                                                      : ColorConstants
                                                                                      .lightAttributeMark),
                                                                            ),
                                                                            child: Row(
                                                                              mainAxisSize: MainAxisSize
                                                                                  .min,
                                                                              children: [
                                                                                SizedBox(
                                                                                    width: displayWidth(
                                                                                        context) *
                                                                                        .0189),
                                                                                ClipRRect(
                                                                                    borderRadius: BorderRadius
                                                                                        .circular(
                                                                                        2),
                                                                                    child: Image
                                                                                        .network(
                                                                                        controller
                                                                                            .userProfilePic
                                                                                            .value,
                                                                                        height: displayHeight(
                                                                                            context) *
                                                                                            .01970,
                                                                                        width: displayWidth(
                                                                                            context) *
                                                                                            .0426)),
                                                                                SizedBox(
                                                                                  width: displayWidth(
                                                                                      context) *
                                                                                      .01,
                                                                                ),
                                                                                GradientText(
                                                                                  '@${controller
                                                                                      .userName
                                                                                      .value}',
                                                                                  gradient: LinearGradient(
                                                                                      colors: controller
                                                                                          .selectedBGStyle[0] ==
                                                                                          true
                                                                                          ? ColorConstants
                                                                                          .lightAttributeMark
                                                                                          : [
                                                                                        ColorConstants
                                                                                            .white,
                                                                                        ColorConstants
                                                                                            .white
                                                                                      ]),
                                                                                  style: TextStylePoppinsMedium10(
                                                                                      color: Colors
                                                                                          .white),
                                                                                )
                                                                              ],
                                                                            )))
                                                                ])))
                                                  ])),
                                          GestureDetector(
                                            onPanUpdate: (details) {
                                              /// Swiping to left direction.
                                              if (details.delta.dx < 0) {
                                                controller.pageController!
                                                    .nextPage(
                                                    duration:
                                                    Duration(microseconds: 1),
                                                    curve: Curves.easeIn);
                                              }

                                              /// Swiping to right direction.
                                              if (details.delta.dx > 0) {
                                                controller.pageController!
                                                    .previousPage(
                                                    duration: Duration(
                                                        microseconds: 1),
                                                    curve: Curves.easeInOut);
                                              }
                                            },
                                          ),
                                          if (controller.feedUrl.length > 1)
                                            IgnorePointer(
                                              ignoring: true,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    12.0),
                                                child: Align(
                                                    alignment: Alignment
                                                        .topRight,
                                                    child: Container(
                                                        padding: EdgeInsets.all(
                                                            5),
                                                        decoration: BoxDecoration(
                                                            color: ColorConstants
                                                                .black
                                                                .withOpacity(
                                                                .6),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                        child: Obx(() =>
                                                            Text(
                                                              " ${controller
                                                                  .imageIndex
                                                                  .value +
                                                                  1}/${controller
                                                                  .feedUrl
                                                                  .length} ",
                                                              style:
                                                              TextStylePoppinsMedium10(
                                                                  color: Colors
                                                                      .white),
                                                            )))),
                                              ),
                                            ),
                                        ],
                                      ),
                                    )
                                        :

                                    /// Stories and reel Media
                                    controller.feedUrl[0].contains(
                                        AppConstants.jpg.tr)
                                        ? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: FittedBox(
                                            child: RepaintBoundary(
                                                key: controller.imageKey,
                                                child: Stack(
                                                    alignment: controller
                                                        .selectedVerticalAlignment[
                                                    0] ==
                                                        true &&
                                                        controller
                                                            .selectedHorizontalAlignment[
                                                        0] ==
                                                            true
                                                        ? Alignment.bottomLeft
                                                        : controller
                                                        .selectedVerticalAlignment[
                                                    0] ==
                                                        true &&
                                                        controller
                                                            .selectedHorizontalAlignment[
                                                        0] ==
                                                            false
                                                        ? Alignment
                                                        .bottomRight
                                                        : controller
                                                        .selectedVerticalAlignment[
                                                    0] ==
                                                        false &&
                                                        controller
                                                            .selectedHorizontalAlignment[
                                                        0] ==
                                                            false
                                                        ? Alignment
                                                        .topRight
                                                        : Alignment
                                                        .topLeft,
                                                    children: [
                                                      Image.network(
                                                          controller
                                                              .feedUrl[0]),

                                                      /// Stories image AttributeMark
                                                      if (controller
                                                          .showAttributeMark[
                                                      0] ==
                                                          true)
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(
                                                                controller
                                                                    .selectedVerticalAlignment[
                                                                0] ==
                                                                    true &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        true
                                                                    ? 4
                                                                    : 0),
                                                            bottomLeft: Radius
                                                                .circular(
                                                                controller
                                                                    .selectedVerticalAlignment[
                                                                0] ==
                                                                    false &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        false
                                                                    ? 4
                                                                    : 0),
                                                            bottomRight: Radius
                                                                .circular(
                                                                controller
                                                                    .selectedVerticalAlignment[
                                                                0] ==
                                                                    false &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        true
                                                                    ? 4
                                                                    : 0),
                                                            topLeft: Radius
                                                                .circular(
                                                                controller
                                                                    .selectedVerticalAlignment[
                                                                0] ==
                                                                    true &&
                                                                    controller
                                                                        .selectedHorizontalAlignment[0] ==
                                                                        false
                                                                    ? 4
                                                                    : 0),
                                                          ),
                                                          child: Container(
                                                            height: displayHeight(
                                                                context) *
                                                                .0197,
                                                            //displayHeight(context) * .0738,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 4,
                                                                horizontal:
                                                                4),
                                                            decoration:
                                                            BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: controller
                                                                      .selectedBGStyle[
                                                                  0] ==
                                                                      true
                                                                      ? [
                                                                    ColorConstants
                                                                        .white,
                                                                    ColorConstants
                                                                        .white
                                                                  ]
                                                                      : ColorConstants
                                                                      .lightAttributeMark),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .min,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      2),
                                                                  child:
                                                                  CachedNetworkImage(
                                                                    imageUrl:
                                                                    controller
                                                                        .userProfilePic
                                                                        .value,
                                                                    errorWidget:
                                                                        (
                                                                        context,
                                                                        uri,
                                                                        error) {
                                                                      return Center(
                                                                          child: SvgPicture
                                                                              .asset(
                                                                              ImageConstants
                                                                                  .repost,
                                                                              width: displayWidth(
                                                                                  context) *
                                                                                  .0426,
                                                                              height: displayHeight(
                                                                                  context) *
                                                                                  .0197,
                                                                              color: controller
                                                                                  .selectedBGStyle[0] ==
                                                                                  true
                                                                                  ? ColorConstants
                                                                                  .purple2
                                                                                  : ColorConstants
                                                                                  .white));
                                                                    },
                                                                    imageBuilder: (
                                                                        context,
                                                                        imageProvider) =>
                                                                        Container(
                                                                            height: displayHeight(
                                                                                context) *
                                                                                .0197,
                                                                            width:
                                                                            displayWidth(
                                                                                context) *
                                                                                .0426,
                                                                            decoration: BoxDecoration(
                                                                                image: DecorationImage(
                                                                                  image:
                                                                                  imageProvider,
                                                                                  fit:
                                                                                  BoxFit
                                                                                      .fill,
                                                                                ))),
                                                                    placeholder: (
                                                                        context,
                                                                        url) =>
                                                                        Center(
                                                                            child:
                                                                            Icon(
                                                                              Icons
                                                                                  .signal_wifi_statusbar_connected_no_internet_4,
                                                                              size: 16,
                                                                              color: controller
                                                                                  .selectedBGStyle[0] ==
                                                                                  true
                                                                                  ? ColorConstants
                                                                                  .purple
                                                                                  : ColorConstants
                                                                                  .white,
                                                                            )),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: displayWidth(
                                                                      context) *
                                                                      .01,
                                                                ),
                                                                GradientText(
                                                                    '@${controller
                                                                        .userName
                                                                        .value
                                                                        .isNotEmpty
                                                                        ? controller
                                                                        .userName
                                                                        .value
                                                                        : AppConstants
                                                                        .instasave
                                                                        .tr}',
                                                                    gradient: LinearGradient(
                                                                        colors: controller
                                                                            .selectedBGStyle[0] ==
                                                                            true
                                                                            ? ColorConstants
                                                                            .lightAttributeMark
                                                                            : [
                                                                          ColorConstants
                                                                              .white,
                                                                          ColorConstants
                                                                              .white
                                                                        ]),
                                                                    style: TextStylePoppinsMedium10(
                                                                        color: Colors
                                                                            .white)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ]))))
                                        : ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Stack(
                                        alignment: controller
                                            .selectedVerticalAlignment[
                                        0] ==
                                            true &&
                                            controller
                                                .selectedHorizontalAlignment[
                                            0] ==
                                                true
                                            ? Alignment.bottomLeft
                                            : controller
                                            .selectedVerticalAlignment[
                                        0] ==
                                            true &&
                                            controller
                                                .selectedHorizontalAlignment[
                                            0] ==
                                                false
                                            ? Alignment.bottomRight
                                            : controller
                                            .selectedVerticalAlignment[
                                        0] ==
                                            false &&
                                            controller
                                                .selectedHorizontalAlignment[
                                            0] ==
                                                false
                                            ? Alignment.topRight
                                            : Alignment.topLeft,
                                        children: [
                                          MyVideoPlayer(
                                            autoPlay: true,
                                            videoUrl: controller.feedUrl[0],
                                            newKey: UniqueKey(),
                                          ),

                                          /// Reel And Stories video AttributeMark
                                          if (controller.showAttributeMark[0] ==
                                              true)
                                            RepaintBoundary(
                                              key: controller.imageKey,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      controller
                                                          .selectedVerticalAlignment[
                                                      0] ==
                                                          true &&
                                                          controller
                                                              .selectedHorizontalAlignment[
                                                          0] ==
                                                              true
                                                          ? 4
                                                          : 0),
                                                  bottomLeft: Radius.circular(
                                                      controller
                                                          .selectedVerticalAlignment[
                                                      0] ==
                                                          false &&
                                                          controller
                                                              .selectedHorizontalAlignment[
                                                          0] ==
                                                              false
                                                          ? 4
                                                          : 0),
                                                  bottomRight: Radius.circular(
                                                      controller
                                                          .selectedVerticalAlignment[
                                                      0] ==
                                                          false &&
                                                          controller
                                                              .selectedHorizontalAlignment[
                                                          0] ==
                                                              true
                                                          ? 4
                                                          : 0),
                                                  topLeft: Radius.circular(
                                                      controller
                                                          .selectedVerticalAlignment[
                                                      0] ==
                                                          true &&
                                                          controller
                                                              .selectedHorizontalAlignment[
                                                          0] ==
                                                              false
                                                          ? 4
                                                          : 0),
                                                ),
                                                child: Container(
                                                  height:
                                                  displayHeight(context) *
                                                      .0295,
                                                  //displayHeight(context) * .0738,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 4),
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: controller
                                                            .selectedBGStyle[
                                                        0] ==
                                                            true
                                                            ? [
                                                          ColorConstants
                                                              .white,
                                                          ColorConstants
                                                              .white
                                                        ]
                                                            : ColorConstants
                                                            .lightAttributeMark),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(2),
                                                        child:
                                                        CachedNetworkImage(
                                                          imageUrl: controller
                                                              .userProfilePic
                                                              .value,
                                                          errorWidget: (context,
                                                              uri, error) {
                                                            return Center(
                                                                child: SvgPicture
                                                                    .asset(
                                                                    ImageConstants
                                                                        .repost,
                                                                    width: displayWidth(
                                                                        context) *
                                                                        .0426,
                                                                    height: displayHeight(
                                                                        context) *
                                                                        .0197,
                                                                    color: controller
                                                                        .selectedBGStyle[0] ==
                                                                        true
                                                                        ? ColorConstants
                                                                        .purple2
                                                                        : ColorConstants
                                                                        .white));
                                                          },
                                                          imageBuilder: (
                                                              context,
                                                              imageProvider) =>
                                                              Container(
                                                                  height: displayHeight(
                                                                      context) *
                                                                      .0197,
                                                                  width: displayWidth(
                                                                      context) *
                                                                      .0426,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                      image:
                                                                      DecorationImage(
                                                                        image:
                                                                        imageProvider,
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      ))),
                                                          placeholder: (context,
                                                              url) =>
                                                              Center(
                                                                  child: SvgPicture
                                                                      .asset(
                                                                      ImageConstants
                                                                          .repost)),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: displayWidth(
                                                            context) *
                                                            .01,
                                                      ),
                                                      GradientText(
                                                          '@${controller
                                                              .userName
                                                              .value.isNotEmpty
                                                              ? controller
                                                              .userName
                                                              .value
                                                              : AppConstants
                                                              .instasave
                                                              .tr}',
                                                          gradient: LinearGradient(
                                                              colors: controller
                                                                  .selectedBGStyle[
                                                              0] ==
                                                                  true
                                                                  ? ColorConstants
                                                                  .lightAttributeMark
                                                                  : [
                                                                ColorConstants
                                                                    .white,
                                                                ColorConstants
                                                                    .white
                                                              ]),
                                                          style:
                                                          TextStylePoppinsMedium10(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ScrollingFeedIndicator(
                              dotSpacing: 10,
                              visibleDotThreshold: 2,
                              visibleDotCount: 7,
                              controller: controller.pageController!,
                              itemCount: controller.feedUrl.length,
                              dotColor: ColorConstants.grey600,
                              dotSelectedColor: ColorConstants.primary,
                              dotSelectedSize: 7,
                              dotSize: 5,
                            ),

                            /// Copy Caption
                            controller.feedCategory.value == AppConstants
                                .stories.tr
                                ? Container()
                                : Container(
                              margin: EdgeInsets.only(
                                  top: displayHeight(context) * .0295),
                              height: displayHeight(context) * .17,
                              width: displayWidth(context) * .893,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: ColorConstants.borderColor),
                                color: ColorConstants.caption,
                              ),
                              //alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Stack(
                                  children: [

                                    /// Glass morphism
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                            ImageConstants.glassmorphism)),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          displayWidth(context) * .053),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(AppConstants.copyCaption.tr,
                                                  style: TextStylePoppinsSemiBold14(
                                                      color: Colors.white)),
                                              GestureDetector(
                                                onTap: () {
                                                  if (controller
                                                      .isCopyCationEnable
                                                      .value) {
                                                    controller
                                                        .isCopyCationEnable
                                                        .value = false;
                                                  } else {
                                                    controller
                                                        .isCopyCationEnable
                                                        .value = true;
                                                  }
                                                },
                                                child: Obx(
                                                      () =>
                                                      AnimatedContainer(
                                                        margin: EdgeInsets.only(
                                                            bottom:
                                                            displayHeight(
                                                                context) *
                                                                .0024),
                                                        padding: EdgeInsets.all(
                                                            2),
                                                        duration:
                                                        Duration(
                                                            milliseconds: 250),
                                                        alignment: controller
                                                            .isCopyCationEnable
                                                            .value
                                                            ? Alignment
                                                            .centerRight
                                                            : Alignment
                                                            .centerLeft,
                                                        height: displayHeight(
                                                            context) *
                                                            .0295,
                                                        width: displayWidth(
                                                            context) *
                                                            .1066,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                          color: controller
                                                              .isCopyCationEnable
                                                              .value
                                                              ? ColorConstants
                                                              .purple2
                                                              : ColorConstants
                                                              .white,
                                                        ),
                                                        child: Container(
                                                          height:
                                                          displayHeight(
                                                              context) *
                                                              .0295,
                                                          width: displayWidth(
                                                              context) *
                                                              .064 -
                                                              5,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                1000),
                                                            color: controller
                                                                .isCopyCationEnable
                                                                .value
                                                                ? Colors.white
                                                                : ColorConstants
                                                                .purple2,
                                                          ),
                                                        ),
                                                      ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            AppConstants.copyCaptionSub.tr,
                                            style: TextStylePoppinsRegular12(
                                                color: Colors.white.withOpacity(
                                                    .4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// Ad
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              height: displayHeight(context) * .3078,
                              width: displayWidth(context) * .8933,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: controller.isLoaded
                                  ? SizedBox(
                                  child: AdWidget(ad: controller.postBannerAd.value))
                                  : SizedBox(),
                            ),
                            /*FutureBuilder(
                                future: banner(context),
                                builder: (context, snapshot){
                                  if(snapshot.connectionState == ConnectionState.waiting){
                                    return SizedBox();
                                  }
                                  return snapshot.data as Widget;
                                }),*/
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              // padding: EdgeInsets.all(24),
                              height: displayHeight(context) * .3078,
                              width: displayWidth(context) * .8933,
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Attribution mark",
                                    style: TextStylePoppinsMedium18(
                                        color: ColorConstants.white),
                                  ),
                                  SizedBox(
                                    height: displayHeight(context) * .0184,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: displayWidth(context) * .28,
                                          child: Text("Alignments",
                                              style: TextStylePoppinsRegular14(
                                                  color:
                                                  ColorConstants.white
                                                      .withOpacity(.4))),
                                        ),
                                        Obx(
                                                () =>
                                                Container(
                                                    height: displayHeight(
                                                        context) * .0591,
                                                    width: displayWidth(
                                                        context) * .613,
                                                    padding: EdgeInsets.all(
                                                        displayWidth(context) *
                                                            .021),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(12),
                                                      color: ColorConstants
                                                          .caption,
                                                      border: Border.all(
                                                          color: ColorConstants
                                                              .borderColor),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        mainAxisSize: MainAxisSize
                                                            .min,
                                                        children: [
                                                          ToggleButtons(
                                                            direction: Axis
                                                                .horizontal,
                                                            onPressed: (
                                                                int index) {
                                                              for (int i = 0;
                                                              i <
                                                                  controller
                                                                      .selectedHorizontalAlignment
                                                                      .length;
                                                              i++) {
                                                                controller
                                                                    .selectedHorizontalAlignment[
                                                                i] = i == index;
                                                              }
                                                            },
                                                            selectedColor: ColorConstants
                                                                .textColor,
                                                            color: ColorConstants
                                                                .white,
                                                            renderBorder: false,
                                                            fillColor: Colors
                                                                .transparent,
                                                            splashColor: ColorConstants
                                                                .transparent,
                                                            isSelected: controller
                                                                .selectedHorizontalAlignment,
                                                            children: [

                                                              /// L
                                                              Container(
                                                                height:
                                                                displayHeight(
                                                                    context) *
                                                                    .0369,
                                                                width: displayWidth(
                                                                    context) *
                                                                    .13,
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      12),
                                                                  gradient:
                                                                  controller
                                                                      .selectedHorizontalAlignment[
                                                                  0] ==
                                                                      true
                                                                      ? LinearGradient(
                                                                      colors: ColorConstants
                                                                          .linearGradientButton)
                                                                      : null,
                                                                ),
                                                                alignment: Alignment
                                                                    .center,
                                                                child: Text(
                                                                    "L"),
                                                              ),

                                                              /// R
                                                              Container(
                                                                height: displayHeight(
                                                                    context) *
                                                                    .0369,
                                                                width:
                                                                displayWidth(
                                                                    context) *
                                                                    .13,
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      12),
                                                                  gradient: controller
                                                                      .selectedHorizontalAlignment[
                                                                  1] ==
                                                                      true
                                                                      ? LinearGradient(
                                                                      colors: ColorConstants
                                                                          .linearGradientButton)
                                                                      : null,
                                                                ),
                                                                alignment: Alignment
                                                                    .center,
                                                                child: Text(
                                                                    AppConstants
                                                                        .r.tr),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                horizontal: 3),
                                                            width: 1,
                                                            height:
                                                            displayHeight(
                                                                context) *
                                                                .0123,
                                                            color: Color
                                                                .fromARGB(
                                                                255, 29, 34, 46)
                                                                .withOpacity(1),
                                                          ),
                                                          ToggleButtons(
                                                              direction: Axis
                                                                  .horizontal,
                                                              onPressed: (
                                                                  int index) {
                                                                for (int i = 0;
                                                                i <
                                                                    controller
                                                                        .selectedVerticalAlignment
                                                                        .length;
                                                                i++) {
                                                                  controller
                                                                      .selectedVerticalAlignment[
                                                                  i] = i ==
                                                                      index;
                                                                }
                                                              },
                                                              selectedColor:
                                                              ColorConstants
                                                                  .textColor,
                                                              color: ColorConstants
                                                                  .white,
                                                              renderBorder: false,
                                                              fillColor: Colors
                                                                  .transparent,
                                                              splashColor:
                                                              ColorConstants
                                                                  .transparent,
                                                              isSelected: controller
                                                                  .selectedVerticalAlignment,
                                                              children: [

                                                                /// B
                                                                Container(
                                                                  height: displayHeight(
                                                                      context) *
                                                                      .0369,
                                                                  width:
                                                                  displayWidth(
                                                                      context) *
                                                                      .13,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        12),
                                                                    gradient: controller
                                                                        .selectedVerticalAlignment[
                                                                    0] ==
                                                                        true
                                                                        ? LinearGradient(
                                                                        colors: ColorConstants
                                                                            .linearGradientButton)
                                                                        : null,
                                                                  ),
                                                                  alignment: Alignment
                                                                      .center,
                                                                  child: Text(
                                                                      AppConstants
                                                                          .b
                                                                          .tr),
                                                                ),

                                                                /// T
                                                                Container(
                                                                  height: displayHeight(
                                                                      context) *
                                                                      .0369,
                                                                  width:
                                                                  displayWidth(
                                                                      context) *
                                                                      .13,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        12),
                                                                    gradient: controller
                                                                        .selectedVerticalAlignment[
                                                                    1] ==
                                                                        true
                                                                        ? LinearGradient(
                                                                        colors: ColorConstants
                                                                            .linearGradientButton)
                                                                        : null,
                                                                  ),
                                                                  alignment: Alignment
                                                                      .center,
                                                                  child: Text(
                                                                      AppConstants
                                                                          .t
                                                                          .tr),
                                                                )
                                                              ])
                                                        ])))
                                      ]),
                                  SizedBox(
                                    height: displayHeight(context) * .0184,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: displayWidth(context) * .28,
                                        child: Text(AppConstants.bgStyle.tr,
                                            style: TextStylePoppinsRegular14(
                                                color: ColorConstants.white
                                                    .withOpacity(.4))),
                                      ),
                                      Obx(
                                            () =>
                                            Container(
                                              height: displayHeight(context) *
                                                  .0591,
                                              width: displayWidth(context) *
                                                  .613,
                                              padding: EdgeInsets.all(
                                                  displayWidth(context) * .021),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    12),
                                                color: ColorConstants.caption,
                                                border: Border.all(
                                                    color: ColorConstants
                                                        .borderColor),
                                              ),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    ToggleButtons(
                                                      direction: Axis
                                                          .horizontal,
                                                      onPressed: (int index) {
                                                        for (int i = 0;
                                                        i < controller
                                                            .selectedBGStyle
                                                            .length;
                                                        i++) {
                                                          controller
                                                              .selectedBGStyle[i] =
                                                              i == index;
                                                        }
                                                      },
                                                      selectedColor: ColorConstants
                                                          .textColor,
                                                      color: ColorConstants
                                                          .white,
                                                      renderBorder: false,
                                                      splashColor: ColorConstants
                                                          .transparent,
                                                      fillColor: Colors
                                                          .transparent,
                                                      isSelected: controller
                                                          .selectedBGStyle,
                                                      children: [
                                                        Container(
                                                          height: displayHeight(
                                                              context) *
                                                              .0394,
                                                          width: displayWidth(
                                                              context) *
                                                              .275,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                            gradient:
                                                            controller
                                                                .selectedBGStyle[0] ==
                                                                true
                                                                ? LinearGradient(
                                                                colors: ColorConstants
                                                                    .linearGradientButton)
                                                                : null,
                                                          ),
                                                          alignment: Alignment
                                                              .center,
                                                          child: Text(
                                                              AppConstants.light
                                                                  .tr),
                                                        ),
                                                        Container(
                                                          height: displayHeight(
                                                              context) *
                                                              .0394,
                                                          width: displayWidth(
                                                              context) *
                                                              .275,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                            gradient:
                                                            controller
                                                                .selectedBGStyle[1] ==
                                                                true
                                                                ? LinearGradient(
                                                                colors: ColorConstants
                                                                    .linearGradientButton)
                                                                : null,
                                                          ),
                                                          alignment: Alignment
                                                              .center,
                                                          child: Text(
                                                              AppConstants.dark
                                                                  .tr),
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: displayHeight(context) * .0184,
                                  ),

                                  /// Show Attribute Mark
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: displayWidth(context) * .28,
                                        child: Text(
                                          AppConstants.showAttributeMark.tr,
                                          style: TextStylePoppinsRegular14(
                                              color: ColorConstants.white
                                                  .withOpacity(.4)),
                                          overflow: TextOverflow.ellipsis,),
                                      ),
                                      Obx(
                                            () =>
                                            Container(
                                              height: displayHeight(context) *
                                                  .0591,
                                              width: displayWidth(context) *
                                                  .613,
                                              padding: EdgeInsets.all(
                                                  displayWidth(context) * .021),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    12),
                                                color: ColorConstants.caption,
                                                border: Border.all(
                                                    color: ColorConstants
                                                        .borderColor),
                                              ),
                                              child: Row(children: [
                                                ToggleButtons(
                                                  direction: Axis.horizontal,
                                                  onPressed: (int index) {
                                                    for (int i = 0;
                                                    i <
                                                        controller
                                                            .showAttributeMark
                                                            .length;
                                                    i++) {
                                                      controller
                                                          .showAttributeMark[i] =
                                                          i == index;
                                                    }
                                                    if (controller
                                                        .showAttributeMark[1] ==
                                                        true) {
                                                      if (controller.clickCount
                                                          .value < 5) {
                                                        controller.clickCount
                                                            .value++;
                                                        controller
                                                            .showRewardedAd();
                                                        controller.update();
                                                      } else {
                                                        /*Get.toNamed(RoutesConstants
                                                        .upgradeScreen);*/
                                                        controller.clickCount
                                                            .value =
                                                        0;
                                                        controller.update();
                                                      }
                                                    }
                                                  },
                                                  selectedColor: ColorConstants
                                                      .textColor,
                                                  color: ColorConstants.white,
                                                  renderBorder: false,
                                                  splashColor: ColorConstants
                                                      .transparent,
                                                  fillColor: Colors.transparent,
                                                  isSelected: controller
                                                      .showAttributeMark,
                                                  children: [
                                                    Container(
                                                      height: displayHeight(
                                                          context) *
                                                          .0394,
                                                      width: displayWidth(
                                                          context) *
                                                          .275,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                        gradient:
                                                        controller
                                                            .showAttributeMark[0] ==
                                                            true
                                                            ? LinearGradient(
                                                            colors: ColorConstants
                                                                .linearGradientButton)
                                                            : null,
                                                      ),
                                                      alignment: Alignment
                                                          .center,
                                                      child: Text(
                                                          AppConstants.show.tr),
                                                    ),
                                                    Container(
                                                      height: displayHeight(
                                                          context) *
                                                          .0394,
                                                      width: displayWidth(
                                                          context) *
                                                          .275,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                        gradient:
                                                        controller
                                                            .showAttributeMark[1] ==
                                                            true
                                                            ? LinearGradient(
                                                            colors: ColorConstants
                                                                .linearGradientButton)
                                                            : null,
                                                      ),
                                                      alignment: Alignment
                                                          .center,
                                                      child: Align(
                                                          alignment: Alignment
                                                              .center,
                                                          child: Text(
                                                              AppConstants.hide
                                                                  .tr)),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// Bottom Options
                            Container(
                              height: displayHeight(context) * .1970,
                              /*decoration: BoxDecoration(
                                color: ColorConstants.caption.withOpacity(.6),
                              ),*/
                              alignment: Alignment.center,
                              child: Column(
                                children: [

                                  /// Options
                                  SizedBox(
                                    height: displayHeight(context) * .0837,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            controller.isReadingDB.value = true;
                                            controller.isDownloadingDone.value =
                                            false;
                                            if (!controller
                                                .feedUrl[controller.imageIndex
                                                .value]
                                                .toString()
                                                .contains(
                                                AppConstants.jpg.tr)) {
                                              await controller
                                                  .downloadWaterMarkedVideo(
                                                  wantToShare: true,
                                                  context: context,
                                                  key: controller.imageKey,
                                                  link: controller.feedUrl[
                                                  controller.imageIndex.value]
                                                      .toString());
                                            } else if (controller
                                                .feedUrl[controller.imageIndex
                                                .value]
                                                .toString()
                                                .contains(
                                                AppConstants.jpg.tr)) {
                                              File downloadedImg = await controller
                                                  .downloadImage(
                                                  context, controller.imageKey);
                                              controller.isReadingDB.value =
                                              false;
                                              await Share.shareXFiles(
                                                  [XFile(downloadedImg.path)]);
                                            }
                                          },
                                          child: repostButton(),
                                        ),

                                        /// Download
                                        GestureDetector(
                                          onTap: () async {
                                            if (!controller
                                                .feedUrl[controller.imageIndex
                                                .value]
                                                .toString()
                                                .contains(
                                                AppConstants.jpg.tr)) {
                                              controller.isReadingDB.value =
                                              true;
                                              if (controller
                                                  .showAttributeMark[0] ==
                                                  true) {
                                                await controller
                                                    .downloadWaterMarkedVideo(
                                                    context: context,
                                                    key: controller.imageKey,
                                                    link: controller.feedUrl[
                                                    controller.imageIndex.value]
                                                        .toString());
                                              } else {
                                                await controller.downloadVideo(
                                                    link: controller.feedUrl[
                                                    controller.imageIndex.value]
                                                        .toString());
                                              }
                                            } else if (controller
                                                .feedUrl[controller.imageIndex
                                                .value]
                                                .toString()
                                                .contains(
                                                AppConstants.jpg.tr)) {
                                              await controller.downloadImage(
                                                  context, controller.imageKey);
                                            }
                                          },
                                          child: downloadButton(),
                                        ),

                                        /// Save
                                        GestureDetector(
                                          onTap: () {
                                            controller.onSaveTap(
                                                context: context,
                                                imageKey: controller.imageKey);
                                          },
                                          child: saveButton(),
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// Ad
                                  Container(
                                    margin: EdgeInsets.only(top: 24),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: controller.isLoaded
                                        ? Container(
                                      margin: EdgeInsets.only(
                                          left: 30, right: 30),
                                      width: double.infinity,
                                      height: 50,
                                      child: AdWidget(ad: controller.postBottomBannerAd!),
                                    )
                                        : SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
        ),
      );
    });
  }
}
