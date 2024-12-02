import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/myVideoPlayer.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/RepostScreen/Widget/repost_button.dart';
import 'package:instasave/UI/Screens/HomeSection/home_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class RepostScreen extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: instasaveAppBar(title: 'Repost', getBack: true),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Column(
          children: [
            /// Feed
            Container(
              constraints: BoxConstraints(
                maxHeight: controller.feedCategory.value == 'Post' ? 370 : 502,
                //502 : 370,
                maxWidth: controller.feedCategory.value == 'Post'
                    ? 335
                    : 335, //335 : 335,
              ),
              margin: const EdgeInsets.only(
                  top: 24, left: 24, right: 24, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorConstants.searchBar,
                border: Border.all(color: ColorConstants.borderColor),
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Align(alignment: Alignment.topLeft,child: ClipRRect(borderRadius: BorderRadius.circular(12),
                      child: Image.asset(ImageConstants.feedGlassmorphism))),
                  Container(
                    height: controller.feedCategory.value == 'Post' ? 346 : 478,
                    //478 : 346,
                    width: controller.feedCategory.value == 'Post' ? 311 : 311,
                    //311 : 311,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorConstants.searchBar,
                    ),
                    child: controller.feedCategory.value == 'Post'
                        ? PageView.builder(
                          itemCount: controller.feedUrl.length,
                          controller: controller.pageController,
                          onPageChanged: (value) {
                            controller.imageIndex.value = value;
                          },
                          itemBuilder: (BuildContext context, int index) =>
                              controller.feedUrl[index]
                                      .toString()
                                      .contains('jpg')
                                  ? FittedBox(
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Image.network(
                                            controller.feedUrl[index],
                                            //  width:311,
                                            fit: BoxFit.contain,
                                          ),
                                          Container(
                                            height: 60,
                                            padding: const EdgeInsets.all(6),
                                            // width: 200,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: ColorConstants
                                                      .linearGradientButton),
                                            ),
                                            //  color: Colors.blue,
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: Image.network(
                                                        controller
                                                            .userProfilePic
                                                            .value)),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '@${controller.userName.value}',
                                                  style: const TextStyle(
                                                      fontSize: 40,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: MyVideoPlayer(
                                        videoUrl: controller.feedUrl[index],
                                        newKey: UniqueKey(),
                                      ),
                                    ),
                        )
                        : controller.feedUrl[0].contains('jpg')
                            ? FittedBox(
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Image.network(controller.feedUrl[0]),
                                    Container(
                                      height: 60,
                                      padding: const EdgeInsets.all(6),
                                      // width: 200,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: ColorConstants
                                                .linearGradientButton),
                                      ),
                                      //  color: Colors.blue,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.network('https://openseauserdata.com/files/ccf16e5e7435ac5d48798f66149ec36d.jpg'),),
                                             // child: Image.network(controller.userProfilePic.value)),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            '@divyesh___.19',//${controller.userName.value}',
                                            style: TextStyle(fontWeight: FontWeight.w500,
                                                fontSize: 40, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: MyVideoPlayer(
                                  videoUrl: controller.feedUrl[0],
                                  newKey: UniqueKey(),
                                ),
                              ),
                  ),
                ],
              ),
            ),

            /// Repost Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                repostButton(
                  iconPath: ImageConstants.storyIcon,
                  title: AppConstants.story.tr,
                ),
                repostButton(
                  iconPath: ImageConstants.feedIcon,
                  title: AppConstants.feed.tr,
                ),
                repostButton(
                  iconPath: ImageConstants.messageIcon,
                  title: AppConstants.message.tr,
                ),
                repostButton(
                  iconPath: ImageConstants.reelIcon,
                  title: AppConstants.reel.tr,
                ),
              ],
            ),

            /// Bottom Options
            Container(
              height: 159,
              decoration: BoxDecoration(
                color: ColorConstants.searchBar.withOpacity(.6),
              ),
              padding: const EdgeInsets.only(
                  right: 24, left: 24, top: 12, bottom: 24),
              alignment: Alignment.center,
              child: Column(
                children: [
                  /// Options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        height: 48,
                        width: 279,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: ColorConstants.linearGradientButton),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorConstants.borderColor),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          AppConstants.repost.tr,
                          style: TextStylePoppinsMedium16(),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        //   margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                            //color: ColorConstants.orange,
                            border: Border.all(color: ColorConstants.orange),
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: ColorConstants
                                    .linearGradientDownloadButton)),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          ImageConstants.saveIcon,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ],
                  ),

                  /// Ad
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: controller.isLoaded ? Container(
                      margin: EdgeInsets.only(left: 30,right: 30),
                      width: double.infinity,
                      height: 50,
                      child: AdWidget(ad: controller.repostBottomBannerAd!),
                    ) : const SizedBox(),
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

