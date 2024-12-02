// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/PermiumSection/upgrade_plan_controller.dart';

class UpGradeScreen extends GetView<UpgradeController> {
  UpgradeController con = Get.put(UpgradeController());
  bool isClick = false;

  UpGradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    ImageConstants.upGradeBackGround,
                    fit: BoxFit.fill,
                  )),
            ),
            Obx(
              () => NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();

                  return true;
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * .037,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close_sharp,
                                size: 28, color: ColorConstants.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: displayWidth(context) * 0.037),
                                child: Text(AppConstants.upgradePlan.tr,
                                    style: TextStylePoppinsSemiBold32(
                                        color: ColorConstants.white))),
                            Container(
                                height: displayHeight(context) * 0.162,
                                width: displayWidth(context) * 0.352,
                                margin: EdgeInsets.only(right: displayWidth(context) * 0.021),
                                child: Image.asset(
                                  ImageConstants.upGradePlan,
                                )),
                          ],
                        ),
                        Container(
                          width: displayWidth(context) * 0.829,
                          margin: EdgeInsets.only(left: displayWidth(context) * 0.032),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: displayHeight(context) * 0.029,
                                      width: displayWidth(context) * 0.064,
                                      margin:
                                          EdgeInsets.only(top: displayHeight(context) * 0.02, left: displayWidth(context) * 0.013),
                                      child: Image.asset(
                                        ImageConstants.adsBlock,
                                        fit: BoxFit.fill,
                                        // height: displayHeight(context) * 0.02,
                                        // width: displayWidth(context) * 0.064,
                                      )),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: displayWidth(context) * 0.021, top: displayHeight(context) * 0.02),
                                      child: Text(AppConstants.noAds.tr,
                                          textAlign: TextAlign.center,
                                          style: TextStylePoppinsMedium16(
                                              color: ColorConstants.white))),
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: displayWidth(context) * 0.021,),
                                  child: Text(AppConstants.removeAds.tr,
                                      style: TextStylePoppinsRegular12(
                                          color: ColorConstants.grey500))),
                            ],
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.829,
                          margin: EdgeInsets.only(left: displayWidth(context) * 0.032),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: displayHeight(context) * 0.029,
                                      width: displayWidth(context) * 0.064,
                                      margin:
                                          EdgeInsets.only(top: displayHeight(context) * 0.02, left: displayWidth(context) * 0.013),
                                      child: Image.asset(
                                        ImageConstants.hasTage,
                                      )),
                                  Container(
                                      margin:
                                         EdgeInsets.only(left: displayWidth(context) * 0.021, top: displayHeight(context) * 0.02),
                                      child: Text(
                                        AppConstants.originalCaptions.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStylePoppinsMedium16(
                                            color: ColorConstants.white),
                                      )),
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: displayWidth(context) * 0.018),
                                  child: Text(
                                    AppConstants.attribution.tr,
                                    style: TextStylePoppinsRegular12(
                                        color: ColorConstants.grey500),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.829,
                          margin: EdgeInsets.only(left: displayWidth(context) * 0.032),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: displayHeight(context) * 0.029,
                                      width: displayWidth(context) * 0.064,
                                      margin:
                                          EdgeInsets.only(top: displayHeight(context) * 0.02, left: displayWidth(context) * 0.013),
                                      child: Image.asset(
                                        ImageConstants.deleteAds,
                                      )),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: displayWidth(context) * 0.021, top: displayHeight(context) * 0.02),
                                      child: Text(
                                        AppConstants.removeWatermark.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStylePoppinsMedium16(
                                            color: ColorConstants.white),
                                      )),
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: displayWidth(context) * 0.018),
                                  child: Text(
                                    AppConstants.resolution.tr,
                                    style: TextStylePoppinsRegular12(
                                        color: ColorConstants.grey500),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: displayHeight(context) * 0.097,
                          width: displayWidth(context) * 0.893,
                          margin:
                              EdgeInsets.only(top: displayHeight(context)*0.025),
                          decoration: BoxDecoration(
                            border: con.select.value == 'Yearly'
                                ? Border.all(color: ColorConstants.orange)
                                : Border.all(color: ColorConstants.borderColor),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                      ImageConstants.collectionCardGlassmorphism,
                                      fit: BoxFit.fill,
                                    )),
                                con.select.value == 'Yearly'
                                    ? Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                          fit: BoxFit.fitWidth,
                                          ImageConstants.boxStar,
                                          height: displayHeight(context) * 0.05,
                                          width: displayWidth(context) * 0.12,
                                        ),
                                      )
                                    : Container(),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Obx(
                                      () => Radio(
                                          activeColor: ColorConstants.purple,
                                          value: con.time[0],
                                          groupValue: con.select.value,
                                          onChanged: (value) {
                                            con.onClickRadioButton(value);
                                            controller.update();
                                          }),
                                    )),
                                Container(
                                  margin:  EdgeInsets.only(left: displayWidth(context) * 0.14, top: displayHeight(context) * 0.022),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppConstants.yearly.tr,
                                        textAlign: TextAlign.start,
                                        style: TextStylePoppinsSemiBold16(
                                            color: ColorConstants.white),
                                      ),
                                      Text(
                                        AppConstants.payYear.tr,
                                        style: TextStylePoppinsRegular12(
                                            color: ColorConstants.grey500),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: displayWidth(context) * 0.14, right: displayWidth(context) * 0.16, top: displayHeight(context) * 0.020),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            AppConstants.dollar.tr,
                                            style: TextStylePoppinsMedium16(
                                                color: ColorConstants.grey500),
                                          ),
                                          Text(
                                            AppConstants.yearTime.tr,
                                            style: TextStylePoppinsSemiBold20(
                                                color: ColorConstants.white),
                                          ),
                                          Text(
                                            AppConstants.year.tr,
                                            style: TextStylePoppinsMedium16(
                                                color: ColorConstants.grey500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: displayWidth(context) * 0.098,
                                      height: displayHeight(context) * 0.014,
                                      margin: EdgeInsets.only(
                                          left: displayWidth(context) * 0.141, top: displayHeight(context) * 0.006, right: displayWidth(context) * 0.186),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: ColorConstants
                                                .linearGradientButton),
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppConstants.save.tr,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 7,
                                              color: ColorConstants.grey900),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: displayHeight(context) * 0.0972,
                          width: displayWidth(context) * 0.893,
                          margin: EdgeInsets.only(top: displayHeight(context) * 0.018),
                          decoration: BoxDecoration(
                            border: con.select.value == 'Monthly'
                                ? Border.all(color: ColorConstants.orange)
                                : Border.all(color: ColorConstants.borderColor),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                      ImageConstants.collectionCardGlassmorphism,
                                      fit: BoxFit.fill,
                                    )),
                                con.select.value == 'Monthly'
                                    ? Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                          fit: BoxFit.fitWidth,
                                          ImageConstants.boxStar,
                                          height: displayHeight(context) * 0.05,
                                          width: displayWidth(context) * 0.12,
                                        ),
                                      )
                                    : Container(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Obx(() => Radio(
                                      value: con.time[1],
                                      activeColor: ColorConstants.purple,
                                      groupValue: con.select.value,
                                      onChanged: (value) {
                                        con.onClickRadioButton(value);
                                      })),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: displayWidth(context) * 0.141, top: displayHeight(context) * 0.022),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppConstants.monthly.tr,
                                        textAlign: TextAlign.start,
                                        style: TextStylePoppinsSemiBold16(
                                            color: ColorConstants.white),
                                      ),
                                      Text(
                                        AppConstants.payMonthly.tr,
                                        style: TextStylePoppinsRegular12(
                                            color: ColorConstants.grey500),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: displayWidth(context) * 0.141, right: displayWidth(context) * 0.186, top: displayHeight(context)* 0.022),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            AppConstants.dollar.tr,
                                            style: TextStylePoppinsMedium16(
                                                color: ColorConstants.grey500),
                                          ),
                                          Text(
                                            AppConstants.monthTime.tr,
                                            style: TextStylePoppinsSemiBold20(
                                                color: ColorConstants.white),
                                          ),
                                          Text(
                                            AppConstants.month.tr,
                                            style: TextStylePoppinsMedium16(
                                                color: ColorConstants.grey500),
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
                        GestureDetector(
                          onTap: () {
                              Get.toNamed(RoutesConstants.upgradeNextScreen);
                          },
                          child: Container(
                              height: displayHeight(context) * 0.059,
                              width: displayWidth(context) * 0.893,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  vertical: displayHeight(context) * 0.024),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: ColorConstants.linearGradientButton),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: ColorConstants.borderColor)),
                              child: Text(AppConstants.subscribeNow.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStylePoppinsSemiBold16(
                                      color: ColorConstants.grey900))),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppConstants.alreadySubscribed.tr,
                                    style: TextStylePoppinsRegular12(
                                        color: ColorConstants.grey500)),
                                GestureDetector(
                                  onTap: () {  },
                                  child: Text(AppConstants.restorePurchase.tr,
                                      style: TextStylePoppinsRegular12(
                                          color: ColorConstants.white)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {  },
                                  child: Text(AppConstants.termsService.tr,
                                      style: TextStylePoppinsRegular12(
                                          color: ColorConstants.white)),
                                ),
                                Text(AppConstants.and.tr,
                                    style: TextStylePoppinsRegular12(
                                        color: ColorConstants.grey500)),
                                GestureDetector(
                                  onTap: () {  },
                                  child: Text(AppConstants.privacyPolicy.tr,
                                      style: TextStylePoppinsRegular12(
                                          color: ColorConstants.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
