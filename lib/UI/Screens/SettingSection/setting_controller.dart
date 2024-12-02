// ignore_for_file: depend_on_referenced_packages, unused_local_variable, prefer_interpolation_to_compose_strings, avoid_print, slash_for_doc_comments

import 'dart:core';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:instasave/Infrastructure/Base/SharedPreference/shared_preferences.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/storage_constants.dart';
import 'package:instasave/UI/Screens/MainSection/main_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
enum Availability { loading, available, unavailable }
class SettingController extends GetxController {
  MainScreenController mainScreenController = Get.put(MainScreenController());

  bool notificationsEnabled = false;
  final InAppReview inAppReview = InAppReview.instance;
  String appStoreId = '';
  String microsoftStoreId = '';
  Availability availability = Availability.loading;

  @override
  void onInit() async {
    super.onInit();
    final isAvailable = await inAppReview.isAvailable();
    saveBool();
    setAllSavedData(false);
    getDeviceInfo();
  }

  RxString downloadDirectory = ''.obs;
  TextEditingController subjectsController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;
  RxString fireStoreDeviceToken = ''.obs;
  RxString deviceId = ''.obs;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  bool isSelected = false;
  String stringValue = '';
  RxBool changeSwitch = false.obs;

  List title = [
    AppConstants.howToUseISave.tr,
    AppConstants.autoStart.tr,
  ];
  List subtitle = [
    AppConstants.knowHowToUseThisApp.tr,
    AppConstants.knowWhenCopyLinkItWillStartDownload.tr,
  ];
  void chooseDownloadDirectory() async {
    try {
      String directory = await pickDownloadDirectory();
      downloadDirectory.value = directory;
      mainScreenController.userDownloadDirectory.value =
          downloadDirectory.value;
      await LocalStorage().addStringToSF(
          StorageConstants.userDownloadLocation, downloadDirectory.value);
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  Future<String> pickDownloadDirectory() async {
    String? directory = await FilePicker.platform.getDirectoryPath();
    if (directory != null) {
      return directory;
    } else {
      throw 'No directory selected';
    }
  }

  Future<String?> getDownloadDirectory() async {
    Directory? directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  Future<void> getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        androidInfo = await deviceInfo.androidInfo;
        deviceId.value = androidInfo!.id;
      } else if (Platform.isIOS) {
        iosInfo = await deviceInfo.iosInfo;
        deviceId.value = iosInfo!.identifierForVendor!;
      }
      firebaseMessaging.getToken().then((token) {
        fireStoreDeviceToken.value = token!;
        print("token is get success >$token<");
      });
    } on PlatformException {
      debugPrint('Android PlatformException Info');
    }
    print("&&&&${deviceId.value}");
  }

  void sendEmail() async {
    String subject = Uri.encodeComponent(subjectsController.text);
    String recipients = 'anilnavadiyaflutter.artonest@gmail.com';
    String description = Uri.encodeComponent('${nameController.text} \n ${messageController.text}');
    Uri emailUrl =
        Uri.parse("mailto:$recipients?subject=$subject&body=$description");
    if(nameController.text != '' && subjectsController.text != '' && messageController.text != ''){
    if (await launchUrl(emailUrl)) {
      debugPrint('Send Email Successfully');

    } else {
      debugPrint('Send Email Failed');
    }}else{
      Fluttertoast.showToast(
          msg: 'Please enter valid text',
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: ColorConstants.primary,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
  }

  /** Auto start download set Data **/
  Future<void> setAllSavedData(bool value) async {
    await LocalStorage().addBoolToSF('DownloadAutoStart',value);
  }

  /** notification Switch **/
  bool? save = true;
  saveBool() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("save", save!);
  }
  getBool() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    save = prefs.getBool("save");
  }
  clear(){
    nameController.clear();
    subjectsController.clear();
    messageController.clear();
  }

  void setAppStoreId(String id) => appStoreId = id;

  void setMicrosoftStoreId(String id) => microsoftStoreId = id;

  Future<void> requestReview() => inAppReview.requestReview();

  Future<void> openStoreListing() => inAppReview.openStoreListing(
    appStoreId: appStoreId,
    microsoftStoreId: microsoftStoreId,
  );
}
