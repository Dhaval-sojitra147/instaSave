// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_pages.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Language/translation_service.dart';
import 'package:instasave/UI/Commons/Behaviour/behaviour.dart';
import 'package:instasave/UI/Screens/SplashSection/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "InstaSave",
    options: FirebaseOptions(
        apiKey: 'AIzaSyCVCqdSaflJXI2Iu9K2K05YicTJPeRSDwM',
        appId: Platform.isIOS ? '1:702964981922:ios:f2ba964148c218e5cd37fb' : '1:702964981922:android:fabc656c2077516ecd37fb',
        messagingSenderId: '',
        projectId: 'instasave-9c049'),);
  MobileAds.instance
    ..initialize()
    ..updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: ['TE1A.220922.012']),
    );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 5, 7, 13),unselectedWidgetColor: ColorConstants.white),
      //home: OnBoardingScreen(),
      //home: UserScreen(),
      home: SplashScreen(),
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}