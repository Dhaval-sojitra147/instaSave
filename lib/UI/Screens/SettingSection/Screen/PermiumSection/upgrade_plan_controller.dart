import 'package:get/get.dart';

class UpgradeController extends GetxController {

  @override
  void onInit() async {
    super.onInit();
  }
  final List<String> time = ["Yearly", "Monthly"];
  RxString select = "Yearly".obs;

  void onClickRadioButton(value) {
    select.value = value;
    update();
  }
}