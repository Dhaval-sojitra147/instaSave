import 'dart:async';

import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/SharedPreference/shared_preferences.dart';
import 'package:instasave/Infrastructure/Commons/Constants/storage_constants.dart';
import 'package:instasave/UI/Screens/MainSection/main_screen.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/onboarding_screen.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    time();
    super.onInit();
  }

  time() async {
    bool isVisit =
        await LocalStorage().getBoolValuesSF(StorageConstants.visitBoolean) ?? false;
    Timer(const Duration(seconds: 3), () {
      isVisit
          ? Get.offAll(() => MainScreen())
          : Get.offAll(() => OnBoardingScreen());
    });
  }
}
