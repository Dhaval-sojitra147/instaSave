// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_controller.dart';

class SettingOtherCard extends GetView<SettingController> {
  @override
  SettingOtherCard(
      {required this.title,
        this.onTap,
        this.showNextButton = false,
        super.key,});

  SettingController con = Get.put(SettingController());
  final GestureTapCallback? onTap;
  final String title;
  final bool showNextButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(top: displayHeight(context) * 0.014,),
            width: displayWidth(context) * .893,
            padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.019, horizontal: displayWidth(context) * 0.04),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(ImageConstants.settingCardBackGround),
                  fit: BoxFit.fill),
              border: Border.all(color: ColorConstants.borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style:
                  TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
                showNextButton ? Container() : const Icon(Icons.navigate_next,color: ColorConstants.white,size: 30,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}