import 'package:get/get.dart';
import 'package:instasave/UI/Screens/SettingSection/Screen/HowToUseSection/work_controller.dart';

class WorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkController());
  }
}