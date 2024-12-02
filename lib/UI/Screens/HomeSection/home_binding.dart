import 'package:get/get.dart';
import 'package:instasave/UI/Screens/HomeSection/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}