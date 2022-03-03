import 'package:get/get.dart';

class SaveDataTextController extends GetxController {
  bool showText = true;
  bool showTextWeb = true;
  void changeVisibility() {
    showText = !showText;

    update();
  }

  void changeVisibilityForWeb() {
    showTextWeb = !showTextWeb;

    update();
  }
}
