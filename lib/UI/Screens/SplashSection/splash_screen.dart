// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Screens/SplashSection/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashController con = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Stack(
          children: [
            SizedBox(
              height: displayHeight(context),
              width: displayWidth(context),
              child: Image.asset(
                ImageConstants.splashBackground,
                fit: BoxFit.fill,
              ),
            ),

            Center(
              child: SizedBox(
                height: displayHeight(context) * 0.42,
                width: displayWidth(context) * 0.32,
                child: Image.asset(
                  ImageConstants.logo,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
