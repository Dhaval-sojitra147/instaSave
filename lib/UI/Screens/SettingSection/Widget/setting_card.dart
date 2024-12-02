// ignore_for_file: use_full_hex_values_for_flutter_colors, sized_box_for_whitespace, must_be_immutable, empty_statements, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/SettingSection/Widget/swith_class.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_controller.dart';

class SettingCard extends GetView<SettingController> {
  @override
  SettingCard({
    this.subTitle,
    this.onChanged,
    this.title,
    this.onTap,
    this.showNextButton = false,
    super.key,
  });

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  SettingController con = Get.put(SettingController());
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final GestureTapCallback? onTap;
  final String? title;
  final String? subTitle;
  final bool showNextButton;
  bool ischeck = false;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: displayHeight(context) * 0.014,
            ),
            width: displayWidth(context) * .893,
            padding: EdgeInsets.symmetric(
                vertical: displayHeight(context) * 0.019,
                horizontal: displayWidth(context) * 0.04),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.settingCardBackGround),
                  fit: BoxFit.fill),
              border: Border.all(color: ColorConstants.borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title!,
                      textAlign: TextAlign.start,
                      style:
                          TextStylePoppinsMedium16(color: ColorConstants.white),
                    ),
                    Container(
                      width: displayWidth(context) * .675,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subTitle!,
                        maxLines: 2,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStylePoppinsRegular12(
                            color: ColorConstants.grey400),
                      ),
                    ),
                  ],
                ),
                showNextButton
                    ? Icon(
                        Icons.navigate_next,
                        color: ColorConstants.white,
                        size: 30,
                      )
                    : NotificationSwitch(
                        switchValue: con.changeSwitch.value,
                        onChanged: onChanged!,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void ratePopup(context) {
    showDialog(
        barrierColor: ColorConstants.black.withOpacity(.7),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: ColorConstants.appBar,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorConstants.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            content: Container(
              height: displayHeight(context) * 0.475,
              width: displayWidth(context) * 0.893,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15)),
                          child: Image.asset(
                            ImageConstants.settingPremiumCardGlassMorphism,
                            fit: BoxFit.cover,
                          ))),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.085,
                          top: displayHeight(context) * 0.039),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close_sharp,
                              size: 28, color: ColorConstants.white)),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: displayHeight(context) * 0.017,
                            left: displayWidth(context) * 0.234,
                            right: displayWidth(context) * 0.232,
                            bottom: displayHeight(context) * 0.019),
                        child: Image.asset(ImageConstants.rate,
                            height: displayHeight(context) * 0.197,
                            width: displayWidth(context) * 0.42),
                      ),
                      Text(AppConstants.rate.tr,
                          style: TextStylePoppinsSemiBold18(
                              color: ColorConstants.white)),
                      Padding(
                        padding: EdgeInsets.only(
                            top: displayHeight(context) * 0.022,
                            bottom: displayHeight(context) * 0.004,
                            right: displayWidth(context) * 0.136,
                            left: displayWidth(context) * 0.136),
                        child: Text(AppConstants.likeApp.tr,
                            style: TextStylePoppinsBold16(
                                color: ColorConstants.white)),
                      ),
                      Text(AppConstants.think.tr,
                          style: TextStylePoppinsRegular12(
                              color: ColorConstants.white)),
                      Padding(
                        padding: EdgeInsets.only(
                            top: displayHeight(context) * 0.026,
                            left: displayWidth(context) * 0.058,
                            right: displayHeight(context) * 0.026),
                        child: RatingBar.builder(
                          unratedColor: Color(0xFF28293D),
                          glowRadius: 20,
                          minRating: 4,
                          itemPadding: EdgeInsets.symmetric(
                              horizontal: displayWidth(context) * 0.010),
                          updateOnDrag: true,
                          itemBuilder: (context, index) {
                            return //Icon(Icons.star,color: ColorConstants.purple2,);
                              SvgPicture.asset(ImageConstants.rateStar);
                          },
                          onRatingUpdate: (value) {
                            con.openStoreListing();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
