import 'package:get/get.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';

class CollectionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionController());
  }

}