import 'package:get/get.dart';

class SaveDataTextController extends GetxController {
  bool showText = false;
  void changeVisibility() {
    showText = !showText;
    update();
  }
}
