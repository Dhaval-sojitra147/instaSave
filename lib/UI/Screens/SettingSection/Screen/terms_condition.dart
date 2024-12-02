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

class TermConditionScreen extends GetView<SettingController> {
  @override
  SettingController controller = Get.put(SettingController());

  TermConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: instasaveAppBar(title: AppConstants.terms.tr, getBack: true),
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
                    margin:EdgeInsets.only(top: displayHeight(context) * 0.03, left: displayWidth(context) * 0.096, right: displayWidth(context) * 0.032),
                    child: Image.asset(ImageConstants.settingSave),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: displayWidth(context) * 0.020,top: displayHeight(context) * 0.030),
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
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.02,left: displayWidth(context) * 0.064),
                    child: Text(AppConstants.lastUpdate.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.02,left: displayWidth(context) * 0.01,right: displayWidth(context) * 0.07),
                    child: Text(AppConstants.date.tr,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.introduction.tr,style: TextStylePoppinsMedium16(color: ColorConstants.primary),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.TheseTermsGovern.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.glance.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.glanceAnswer.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.termsOfUse.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.useDocument.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.contentOn.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.content.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.regarding.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.contentOwner.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.resources.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.externalResources.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.acceptableUse.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.access.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.contract.tr,style: TextStylePoppinsMedium16(color: ColorConstants.primary),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.subscriptions.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.subscriptionsLetConsumers.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.viaAppleID.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.subscribeProduct.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.termination.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.include.tr,textAlign: TextAlign.start,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.liability.tr,style: TextStylePoppinsMedium16(color: ColorConstants.primary),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.australianUsers.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.limitation.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.usUsers.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.warranties.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.indemnification.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.userAgrees.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.provisions.tr,style: TextStylePoppinsMedium16(color: ColorConstants.primary),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.noWaiver.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.failure.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.service.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.suspend.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.reselling.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.replicate.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.policy.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.learn.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.intellectual.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.licensors.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.changesTerms.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.changeMoment.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.assignmentContract.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.considering.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.contacts.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.correspondence.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.severability.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.conditions.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.euUsers.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.termsAreVoid.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.usUsers.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.invalid.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.governingLaw.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.governed.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.exceptionForEuropean.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.europeanConsumer.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.jurisdiction.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.OwnersLocation.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.exceptionForEuropean.tr,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.following.tr,textAlign: TextAlign.justify,style: TextStylePoppinsRegular16(color: ColorConstants.grey400),),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.01,left: displayWidth(context) * 0.064,right: displayWidth(context) * 0.07),
                child: Text(AppConstants.rightsReserved.tr,style: TextStylePoppinsMedium16(color: ColorConstants.primary),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}