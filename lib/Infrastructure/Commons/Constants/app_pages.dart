import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/UI/Screens/CollectionSection/SubScreen/reels_screen.dart';
import 'package:instasave/UI/Screens/CollectionSection/SubScreen/stories_screen.dart';
import 'package:instasave/UI/Screens/CollectionSection/SubScreen/sub_collection_screen.dart';
import 'package:instasave/UI/Screens/CollectionSection/SubScreen/video_play_screen.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_binding.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_screen.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/feed_screen.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/RepostScreen/repost_screen.dart';
import 'package:instasave/UI/Screens/HomeSection/home_binding.dart';
import 'package:instasave/UI/Screens/HomeSection/home_screen.dart';
import 'package:instasave/UI/Screens/MainSection/main_binding.dart';
import 'package:instasave/UI/Screens/MainSection/main_screen.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/onboarding_binding.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/onboarding_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/work_binding.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/work_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/PermiumSection/upgrade_plan_final_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/PermiumSection/upgrade_plan_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/contact_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/privacy_screen.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/terms_condition.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_binding.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_screen.dart';
import 'package:instasave/UI/Screens/SplashSection/splash_binding.dart';
import 'package:instasave/UI/Screens/SplashSection/splash_screen.dart';

class AppPages {
  //static const INITIAL = RoutesConstants.onBoardingScreen;
  static final routes = [
    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesConstants.mainScreen,
      page: () =>   MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.onBoardingScreen,
      page: () => OnBoardingScreen(),
      binding: OnBoardingBindings(),
    ),
    GetPage(
      name: RoutesConstants.postScreen,
      page: () => FeedScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.repostScreen,
      page: () => RepostScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.collectionScreen,
      page: () => CollectionScreen(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: RoutesConstants.subCollectionScreen,
      page: () => SubCollectionScreen(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: RoutesConstants.reelsScreen,
      page: () => ReelsScreen(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: RoutesConstants.storiesScreen,
      page: () => StoriesScreen(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: RoutesConstants.feedScreen,
      page: () => FeedScreen(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: RoutesConstants.videoPlayScreen,
      page: () => VideoPlayScreen(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: RoutesConstants.settingScreen,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: RoutesConstants.workScreen,
      page: () => WorkScreen(),
      binding: WorkBinding(),
    ),
    GetPage(
      name: RoutesConstants.contactScreen,
      page: () => ContactScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: RoutesConstants.termsConditionScreen,
      page: () => TermConditionScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: RoutesConstants.privacyScreen,
      page: () => PrivacyScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: RoutesConstants.upgradeScreen,
      page: () => UpGradeScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: RoutesConstants.upgradeNextScreen,
      page: () => UpGradeNextScreen(),
      binding: SettingBinding(),
    ),
  ];
}
