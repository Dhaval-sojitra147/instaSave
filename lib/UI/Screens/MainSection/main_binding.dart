import 'package:get/get.dart';
import 'package:instasave/UI/Screens/MainSection/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());
  }
}