import 'package:get/get.dart';
import 'package:instasave/UI/Screens/OnBoardingSection/onboarding_controller.dart';

class OnBoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}