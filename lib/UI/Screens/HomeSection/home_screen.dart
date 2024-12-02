// ignore_for_file: must_be_immutable, prefer_const_constructors, unrelated_type_equality_checks, use_full_hex_values_for_flutter_colors, avoid_function_literals_in_foreach_calls, avoid_print, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, prefer_const_declarations, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Models/HashtagModel.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/HomeSection/Widgets/hashtag_card.dart';
import 'package:instasave/UI/Screens/HomeSection/Widgets/link_past_field.dart';
import 'package:instasave/UI/Screens/HomeSection/home_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  HomeController controller = Get.put(HomeController());
  List<HashTagModel> hashtags = hashTagModel;
  List<List<HashTagList>>? hashTagData;
  List<HashTagList> selectedHashtags = [];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    hashTagData ??=
        hashtags.where((element) => element.onTap.value == true).first.hashtags;
    return Scaffold(
      appBar: instasaveAppBar(title: AppConstants.instasave.tr, getBack: false),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Container(
            width: displayWidth(context),
            height: displayHeight(context),
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.053),
            child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
          },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LinkPastField(controller: controller,context: context,),
                    GestureDetector(
                      onTap: () async {
                        if(controller.link.value.text.contains('https://www.instagram.com/')||controller.link.value.text.contains('https://instagram.com/')){
                          controller.onFind(context);
                        }else{
                          Get.snackbar('Warning', 'Link Not Found',
                            snackStyle: SnackStyle.FLOATING,
                            backgroundGradient:
                            LinearGradient(colors: ColorConstants.linearGradientButton),
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 1),
                            colorText: ColorConstants.white,
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: displayHeight(context) * .025),
                        height: displayHeight(context) * .066,
                        width: displayWidth(context) * .893,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: ColorConstants.linearGradientButton),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorConstants.borderColor),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          AppConstants.find.tr,
                          style: TextStylePoppinsMedium16(),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 42),
                      height: 250,
                      width: 335,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SizedBox(child: AdWidget(ad: controller.bannerAd!)),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: displayHeight(context) * .033,),
                      child: Text(
                        AppConstants.trendingHashtags.tr,
                        style:
                            TextStylePoppinsMedium18(color: ColorConstants.white),
                      ),
                    ),
                    /// Hashtags
                    Column(
                      children: [
                        Container(
                          height: displayHeight(context) * .039,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: displayHeight(context) * .024,),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: hashtags.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    hashtags.forEach((element) {
                                      if (element.onTap.value) {
                                        element.onTap.value = false;
                                      }
                                    });
                                    hashtags[index].onTap.value =
                                    !hashtags[index].onTap.value;
                                controller.update();
                                hashTagData = hashtags[index].hashtags;
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: displayWidth(context) * 0.053,),
                                margin: EdgeInsets.only(
                                  right: displayWidth(context) * 0.021,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: hashtags[index].onTap.value
                                      ? LinearGradient(colors: const [
                                          Color.fromARGB(255, 248, 167, 254),
                                          Color.fromARGB(255, 193, 122, 251)
                                        ])
                                      : LinearGradient(colors: const [
                                          Color.fromARGB(255, 29, 34, 46),
                                          Color.fromARGB(255, 29, 34, 46),
                                        ]),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  hashtags[index].hashTagName ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStylePoppinsMedium14(
                                      color: hashtags[index].onTap.value
                                          ? ColorConstants.black
                                          : ColorConstants.grey500),
                                ),
                              ),
                            );
                          }),
                    ),
                    // selectedHashtags.isNotEmpty
                    //     ? Container(
                    //         margin: EdgeInsets.only(left: 20, right: 20),
                    //         child: HashtagCard(
                    //           list: selectedHashtags,
                    //           title: selectedHashtags
                    //               .map((e) => '#${e.hashTagsData!}').toList()
                    //               .toString()
                    //               .replaceFirst('[', '')
                    //               .split(']')
                    //               .first
                    //         ),
                    //       )
                    //     :
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: hashTagData!.length,
                        itemBuilder: (context, index) {
                          print(hashTagData!.length);
                          return HashtagCard(
                            list: hashTagData![index],
                            title: hashTagData![index]
                                .map((e) => "#${e.hashTagsData!}")
                                .toList()
                                .toString()
                                .replaceFirst('[', '')
                                .split(']')
                                .first,
                          );
                        }),
                    if (hashTagData!.isNotEmpty)
                      Container(
                        height: displayHeight(context) * 0.123,
                      ),
                  ]),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

}
