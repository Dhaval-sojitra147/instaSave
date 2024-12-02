import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class WorkController extends GetxController {
   Rx<PageController> introController = PageController().obs;

  RxInt initialIndex = 0.obs;

  late Permission storagePermission;
  PermissionStatus storagePermissionStatus = PermissionStatus.denied;

   @override
   void onInit() {
     super.onInit();
   }

  onPageChanged(int value) {
    if (initialIndex.value == 1) {}
    initialIndex.value = value;
  }

  getDownloadIntroData() async {
    /** next button code **/
    if (initialIndex.value < 2) {
      initialIndex.value++;
      introController.value.animateToPage(
        initialIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

   getRepostIntroData() async {
     /** next button code **/
     if (initialIndex.value < 3) {
       initialIndex.value++;
       if (initialIndex.value == 1) {}
       introController.value.animateToPage(
         initialIndex.value,
         duration: const Duration(milliseconds: 500),
         curve: Curves.ease,
       );
     }
   }
}
