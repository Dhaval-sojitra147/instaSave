import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/SharedPreference/shared_preferences.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/storage_constants.dart';
import 'package:permission_handler/permission_handler.dart';

class OnBoardingController extends GetxController {
  Rx<PageController> introController = PageController().obs;

  RxInt initialIndex = 0.obs;

  late Permission storagePermission;
  PermissionStatus storagePermissionStatus = PermissionStatus.denied;

  @override
  void onInit() {
  }

  onPageChanged(int value) {
    if (initialIndex.value == 1) {}
    initialIndex.value = value;
  }

  getIntroData() async {
    /** next button code **/
    if (initialIndex.value < 1) {
      initialIndex.value++;
      if (initialIndex.value == 0) {}
      introController.value.animateToPage(
        initialIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {}
  }

  routeToMainScreen() {
    LocalStorage().addBoolToSF(StorageConstants.visitBoolean, true);
    Get.offAllNamed(RoutesConstants.mainScreen);
  }
}
