import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/PermiumSection/upgrade_plan_controller.dart';

class UpGradeNextScreen extends GetView<UpgradeController> {
  @override
  UpgradeController controller = Get.put(UpgradeController());

  UpGradeNextScreen({super.key});

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
            Container(
              padding: EdgeInsets.all(displayWidth(context) * 0.064),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close_sharp,
                            size: 30, color: ColorConstants.white),
                      ),
                      Container(
                        height: displayWidth(context) * 0.672,
                        width: displayWidth(context) * 0.672,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.101,vertical: displayHeight(context) * 0.06),
                        child: Image.asset(ImageConstants.finalUpGrade),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: displayHeight(context) * 0.023),
                        child: Text(
                          AppConstants.thankYouUpgrade.tr,
                          style:
                              TextStylePoppinsSemiBold24(color: ColorConstants.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: displayHeight(context) * 0.073),
                        child: Text(
                          AppConstants.purchase.tr,
                          textAlign: TextAlign.start,
                          style: TextStylePoppinsRegular14(color: ColorConstants.grey500),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                         Get.offAllNamed(RoutesConstants.mainScreen);
                        },
                        child: Container(
                          height: displayHeight(context) * 0.059,
                          width: displayWidth(context) * 0.893,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: ColorConstants.linearGradientButton),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorConstants.borderColor),
                          ),
                          child: Text(AppConstants.done.tr,textAlign: TextAlign.center,style: TextStylePoppinsSemiBold16(color: ColorConstants.grey900),),
                        ),
                      ),
                    ],
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
