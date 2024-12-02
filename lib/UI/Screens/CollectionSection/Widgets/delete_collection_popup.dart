import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

Future deleteCollectionPopUp(
    {BuildContext? context,
      GestureTapCallback? onDeleteTap, String? title, required collectionName}) {
  return showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.only(
            bottom: displayHeight(context) * .0344,
            left: displayWidth(context) * .0426,
            right: displayWidth(context) * .0426),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: displayHeight(context) * .0467,
              width: displayWidth(context) * .3066,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConstants.orange,
                ),
                borderRadius: BorderRadius.circular(12),
                color: ColorConstants.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                AppConstants.cancel.tr,
                style:
                TextStylePoppinsRegular14(color: ColorConstants.orange),
              ),
            ),
          ),
          GestureDetector(
            onTap: onDeleteTap,
            child: Container(
              height: displayHeight(context) * .0467,
              width: displayWidth(context) * .3066,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: ColorConstants.transparent,
                gradient: LinearGradient(
                    colors: ColorConstants.linearGradientButton),
              ),
              alignment: Alignment.center,
              child: Text(
                AppConstants.delete.tr,
                style: TextStylePoppinsMedium14(
                    color: ColorConstants.textColor),
              ),
            ),
          ),
        ],
        backgroundColor: ColorConstants.cardBackGroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorConstants.borderColor),
            borderRadius: BorderRadius.circular(16)),
        content: SizedBox(
          height: displayHeight(context) * .23,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:  EdgeInsets.all(displayWidth(context) * .045),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title ?? AppConstants.deleteCollection.tr,
                        style: TextStylePoppinsBold18(
                            color: ColorConstants.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: displayHeight(context) * .029,
                      ),
                      Align(
                        alignment: Alignment.center   ,
                        child: Text(
                          AppConstants.deleteDescription.tr + collectionName,
                          style: TextStylePoppinsMedium16(
                              color: ColorConstants.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * .009,
                      ),
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Image.asset(
                    ImageConstants.loaderGlassmorphism,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
