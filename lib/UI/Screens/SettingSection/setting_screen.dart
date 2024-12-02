// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, sized_box_for_whitespace, must_be_immutable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/MainSection/main_controller.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/contact_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/privacy_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/terms_condition.dart';
import 'package:instasave/UI/Screens/SettingSection/Widget/setting_other_card.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'Widget/setting_card.dart';

class SettingScreen extends GetView<SettingController> {
  @override
  SettingScreen({super.key});

  SettingController con = Get.put(SettingController());
  MainScreenController mainScreenController = Get.put(MainScreenController());
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar:
            instasaveAppBar(title: AppConstants.settings.tr, getBack: false),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();

            return true;
          },child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.053),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: displayHeight(context) * 0.3,
                  width: displayWidth(context) * .89,
                  margin: EdgeInsets.only(top: displayHeight(context) * 0.029,),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // height: 32,
                            // width: 303,
                            margin: EdgeInsets.only(left: displayWidth(context) * 0.04, top: displayHeight(context) * 0.019, right:displayWidth(context) * 0.05),
                            child: Row(
                              children: [
                                Image.asset(ImageConstants.settingSave,
                                    height: displayHeight(context) * 0.039, width: displayWidth(context) * 0.085),
                                Container(
                                  margin: EdgeInsets.only(left: displayWidth(context) * 0.032),
                                  child: Text(
                                    AppConstants.ISave.tr,
                                    style: TextStylePoppinsMedium14(
                                        color: ColorConstants.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left:displayWidth(context) * 0.042, top: displayHeight(context) * 0.019,bottom: displayHeight(context) * 0.02,right: displayWidth(context) * 0.042),
                            child: Text(
                              AppConstants.highResolutionStoryVideoDownload.tr,
                              textAlign: TextAlign.left,
                              style: TextStylePoppinsRegular14(
                                  color: ColorConstants.grey400),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              //Get.toNamed(RoutesConstants.upgradeScreen);
                            },
                            child: Container(
                              height: displayHeight(context) * 0.059,
                              width: displayWidth(context) * 0.808,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: ColorConstants.linearGradientButton),
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: ColorConstants.borderColor),
                              ),
                              child: Text(
                                AppConstants.premium.tr,
                                style: TextStylePoppinsMedium16(
                                    color: ColorConstants.grey900),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: displayHeight(context) * 0.02,),
                  child: Text(
                    AppConstants.general.tr,
                    style: TextStylePoppinsMedium18(color: ColorConstants.white),
                  ),
                ),
                InkWell(
                  onTap: () {
                    downloadLocation(context);
                  },
                  child: Container(
                    height: displayHeight(context) * 0.096,
                    width: displayWidth(context) * 0.89,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstants.settingCardBackGround),
                          fit: BoxFit.fill),
                      border: Border.all(color: ColorConstants.borderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.019,),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(AppConstants.downLoadLocation.tr,
                                  style: TextStylePoppinsMedium16(
                                      color: ColorConstants.white)),
                            ),
                            Container(
                              width: displayWidth(context) * 0.75,
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.004, left: displayWidth(context) * 0.04),
                              child: Text(
                                mainScreenController.userDownloadDirectory.value ==
                                        ''
                                    ? mainScreenController.defaultDownloadDirectory
                                    : mainScreenController
                                        .userDownloadDirectory.value,
                                //overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStylePoppinsRegular12(
                                    color: ColorConstants.grey400),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: displayWidth(context) * 0.03),
                          child: Icon(
                            Icons.navigate_next_sharp,
                            color: ColorConstants.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: displayHeight(context) * 0.27,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: con.title.length,
                      itemBuilder: (context, index) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return SettingCard(
                              title: '${con.title[index]}',
                              subTitle: '${con.subtitle[index]}',
                              onTap: () {
                                if (index == 0) {
                                  Get.toNamed(RoutesConstants.workScreen);
                                }
                              },
                              onChanged: (value) async {
                                if(index == 1) {
                                  if (con.changeSwitch.value == false) {
                                    con.getBool();
                                    con.changeSwitch.value = true;
                                    con.setAllSavedData(true);
                                    setState((){});
                                  }
                                  else if(con.changeSwitch.value == true){
                                    con.saveBool();
                                    con.changeSwitch.value = false;
                                    con.setAllSavedData(false);
                                    setState((){});
                                  }
                                }
                                con.changeSwitch.value = value;
                                setState(() {});
                              },
                              showNextButton: index != 0 ? false : true,
                            );
                          },
                        );
                      }),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: displayHeight(context) * 0.005),
                  child: Text(
                    AppConstants.other.tr,
                    style: TextStylePoppinsMedium18(color: ColorConstants.white),
                  ),
                ),
                Container(
                  //height: displayHeight(context) * 0.730,
                  height: displayHeight(context) * 0.6,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingOtherCard(
                            title: AppConstants.shareFriends.tr,
                            showNextButton: true,
                            onTap: () {
                              Share.share('https://artonest.com/',
                                  sharePositionOrigin: Rect.fromCircle(
                                      center: Offset(2, 1), radius: 16));
                            }),
                        /*SettingOtherCard(
                            title: AppConstants.moreApp.tr,
                            onTap: () {},
                            showNextButton: true),*/
                        SettingOtherCard(
                            title: AppConstants.rateUs.tr,
                            showNextButton: false,
                            onTap: () {
                              SettingCard().ratePopup(context);
                            }),
                        SettingOtherCard(
                            title: AppConstants.contactUS.tr,
                            showNextButton: false,
                            onTap: () {
                              Get.to(ContactScreen());
                            }),
                        Padding(
                          padding: EdgeInsets.only(top: displayHeight(context) * 0.029),
                          child: Text(
                            AppConstants.legal.tr,
                            textAlign: TextAlign.start,
                            style: TextStylePoppinsMedium18(
                                color: ColorConstants.white),
                          ),
                        ),
                        SettingOtherCard(
                            title: AppConstants.termsCondition.tr,
                            showNextButton: false,
                            onTap: () {
                              Get.to(TermConditionScreen());
                            }),
                        SettingOtherCard(
                            title: AppConstants.privacyPolicy.tr,
                            showNextButton: false,
                            onTap: () {
                              Get.to(PrivacyScreen());
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  void downloadLocation(context) {
    showDialog(
        context: context,
        barrierColor: ColorConstants.black.withOpacity(.7),
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: ColorConstants.borderColor),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            backgroundColor: ColorConstants.black,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.043,vertical: displayHeight(context)* .03),
            content: Container(
              height: displayHeight(context) * 0.273,
              width: displayWidth(context) * 0.893,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(16)),
                          child: Image.asset(
                            ImageConstants.settingPremiumCardGlassMorphism,
                            fit: BoxFit.cover,
                          ))),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: displayHeight(context) * 0.029),
                        child: Text(
                          AppConstants.downLoadLocation.tr,
                          textAlign: TextAlign.center,
                          style:
                              TextStylePoppinsSemiBold18(color: Colors.white),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: displayHeight(context) * 0.017, left: displayWidth(context) * 0.064),
                        child: Text(
                          AppConstants.path.tr,
                          textAlign: TextAlign.start,
                          style: TextStylePoppinsMedium16(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: displayHeight(context) * 0.064,
                        width: displayWidth(context) * 0.808,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: displayHeight(context) * 0.004),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: ColorConstants.borderColor)),
                        child: Text(
                          /** downLoad Path  **/
                          mainScreenController.userDownloadDirectory.value == ''
                              ? mainScreenController.defaultDownloadDirectory
                              : mainScreenController
                                  .userDownloadDirectory.value,
                          textAlign: TextAlign.center,
                          style: TextStylePoppinsMedium14(
                              color: ColorConstants.grey400),
                        ),
                      ),
                      Container(
                        height: displayHeight(context) * 0.046,
                        width: displayWidth(context) * 0.808,
                        margin: EdgeInsets.only(top: displayHeight(context) * 0.019, left: displayWidth(context) * 0.042, right: displayWidth(context) * 0.042),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: displayHeight(context) * 0.046,
                              width: displayWidth(context) * 0.376,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorConstants.transparent,
                                border: Border.all(
                                    color: Color.fromARGB(255, 254, 146, 84)),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  AppConstants.cancel.tr,
                                  style: TextStylePoppinsMedium14(
                                      color: Color.fromARGB(255, 254, 146, 84)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                con.chooseDownloadDirectory();
                              },
                              child: Container(
                                height: displayHeight(context) * 0.046,
                                width: displayWidth(context) * 0.376,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                        colors: ColorConstants
                                            .linearGradientButton)),
                                child: Text(
                                  AppConstants.changePath.tr,
                                  style: TextStylePoppinsMedium14(
                                      color: ColorConstants.grey900),
                                ),
                              ),
                            ),
                          ],
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
