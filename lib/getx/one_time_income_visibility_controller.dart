import 'package:get/get.dart';

class OneTimeIncomeVisibilityController extends GetxController {
  bool oneTimeVisibility = true;

  void changeVisibility() {
    oneTimeVisibility = !oneTimeVisibility;
    update();
  }
}
