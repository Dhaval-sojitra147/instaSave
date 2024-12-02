import 'package:get/get.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}