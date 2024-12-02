import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

PreferredSizeWidget instasaveAppBar({
  required String title,
  bool getBack = true,
 GestureTapCallback? onBackTap,
}) =>
    AppBar(
      shape: Border(bottom: BorderSide(color: ColorConstants.searchBar)),
      //  systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: ColorConstants.appBar, 
      elevation: 0,
      leading: getBack != false
          ? IconButton(
              onPressed: onBackTap?? () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorConstants.white,
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStylePoppinsMedium20(color: ColorConstants.white),
      ),
      actions: [
        /*Padding(
          padding: const EdgeInsets.only(right: 24),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(RoutesConstants.upgradeScreen);
            },
            child: SvgPicture.asset(
              ImageConstants.premiumCrown,
              height: 24,
              width: 24,
            ),
          ),
        ),*/
      ],
    );
