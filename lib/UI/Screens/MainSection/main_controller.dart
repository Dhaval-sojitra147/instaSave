// ignore_for_file: file_names

import 'dart:async';

import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';
import 'package:instasave/UI/Screens/HomeSection/home_controller.dart';
import 'package:instasave/Infrastructure/Base/SharedPreference/shared_preferences.dart';
import 'package:instasave/Infrastructure/Commons/Constants/storage_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
// import 'package:internet_popup/internet_popup.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class MainScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeController homeController= Get.put(HomeController());
  CollectionController collectionController= CollectionController();


  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();
  RxBool deeplinkLoading = false.obs;
  String defaultDownloadDirectory = '';
  RxString userDownloadDirectory = ''.obs;
  StreamSubscription? dataStreamSubscription;

  @override
  void onInit() async{

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    await collectionController.getCollectionGroupData();
    receiveSharingIntent();
    getDefaultDownLoadDirectory();
    super.onInit();
  }

  /*@override
  void dispose() {
    super.dispose();
    dataStreamSubscription!.cancel();
  }
*/
  checkInternetConnection(BuildContext context) {
    // InternetPopup().initialize(
    //   context: context,
    //   customDescription: AppConstants.internet.tr,
    //   customMessage: AppConstants.internetConnectionNotFound.tr,
    // );
  }

  animateToPage(int page, {withAnimation = false}) {
    if (page == pageController.page) {
     // scrollPageToTop(page);
    } else {
      pageController.jumpToPage(page);//.animateToPage(
     //   page,
     //   duration: Duration(milliseconds: withAnimation ? 250 : 1),
     //   curve: Curves.easeIn,
     // );
    }
  }

  getDefaultDownLoadDirectory() async {
    Directory? directory = await getApplicationDocumentsDirectory();
    print("${directory.path}");
    defaultDownloadDirectory = directory.path;
    await LocalStorage().addStringToSF(StorageConstants.defaultDownloadLocation, defaultDownloadDirectory);
    userDownloadDirectory.value = await LocalStorage().getStringValuesSF(StorageConstants.userDownloadLocation) ?? defaultDownloadDirectory;
  }

  receiveSharingIntent(){
    //Receive text data when app is running
    // dataStreamSubscription =
    //     ReceiveSharingIntent.getTextStream().listen((String text) {
    //       homeController.link.value.value = TextEditingValue(text: text);
    //     });
    //
    // //Receive text data when app is closed
    // ReceiveSharingIntent.getInitialText().then((String? text) {
    //   if (text != null) {
    //     homeController.link.value.value = TextEditingValue(text: text);
    //   }
    // });
  }
}

