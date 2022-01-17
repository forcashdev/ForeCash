import 'package:get/get.dart';

class SwitchController extends GetxController {
  bool switchValue = false;

  void changeSwitchValue({bool? value}) {
    switchValue = value!;
    update();
  }
}
