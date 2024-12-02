import 'package:get/get.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/EditHashtagScreen/edit_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EditController());
  }
}