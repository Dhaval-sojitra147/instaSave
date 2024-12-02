// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class PrivacyScreen extends GetView<SettingController> {
  @override
  SettingController controller = Get.put(SettingController());

  PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          instasaveAppBar(title: AppConstants.privacyPolicy.tr, getBack: true),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: displayHeight(context) * 0.06,
                    width: displayWidth(context) * 0.144,
                    margin: EdgeInsets.only(
                        top: displayHeight(context) * 0.03,
                        left: displayWidth(context) * 0.096,
                        right: displayWidth(context) * 0.032),
                    child: Image.asset(ImageConstants.settingSave),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: displayWidth(context) * 0.020,
                        top: displayHeight(context) * 0.030),
                    child: Text(
                      AppConstants.ISave.tr,
                      style: TextStylePoppinsSemiBold16(
                          color: ColorConstants.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: displayHeight(context) * 0.02,
                        left: displayWidth(context) * 0.064),
                    child: Text(
                      AppConstants.lastUpdate.tr,
                      style:
                          TextStylePoppinsMedium16(color: ColorConstants.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: displayHeight(context) * 0.02,
                        left: displayWidth(context) * 0.01,
                        right: displayWidth(context) * 0.07),
                    child: Text(
                      AppConstants.date.tr,
                      style: TextStylePoppinsRegular16(
                          color: ColorConstants.grey400),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.policySummary.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.personalData.tr,
                  textAlign: TextAlign.start,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.advertising.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.adMobPersonalData.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.betaTesting.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.testFlight.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.infrastructureMonitoring.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.crashlytics.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.platformServices.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.appleAppStore.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.analytics.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.appsflyer.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.hosting.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.amazonPersonalData.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.managing.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.firebaseNotifications.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.socialFeatures.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.firebaseDynamicLinks.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.contactInformation.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.Owner.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.memberName.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.fullPolicy.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.Owner.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.memberName.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.typesDataCollected.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.dedicatedSections.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.processingTheData.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.methodsOfProcessing.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.protectsData.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.legalBasis.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.applies.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.place.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.partiesProcess.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.retentionTime.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.retained.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.purposesOfProcessing.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.collectsUserData.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.rightsOfUsers.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.dataRights.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.information.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.dataProcessing.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.exercise.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.contacted.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.additionalInformation.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.legalAction.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.stagesLeading.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.detailsAbout.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.contextual.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.maintenance.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.thirdPartyServices.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.contained.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.provideInformation.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.requestsAreHandled.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.determineWhether.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.changesPolicy.tr,
                  style: TextStylePoppinsMedium16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.retains.tr,
                  textAlign: TextAlign.justify,
                  style:
                      TextStylePoppinsRegular16(color: ColorConstants.grey400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.01,
                    left: displayWidth(context) * 0.064,
                    right: displayWidth(context) * 0.07),
                child: Text(
                  AppConstants.rightsReserved.tr,
                  style:
                      TextStylePoppinsMedium16(color: ColorConstants.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
