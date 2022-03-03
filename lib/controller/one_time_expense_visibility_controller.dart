import 'package:get/get.dart';

class OneTimeExpenseVisibilityController extends GetxController {
  bool oneTimeExpenseVisibility = true;

  void changeVisibility() {
    oneTimeExpenseVisibility = !oneTimeExpenseVisibility;
    update();
  }
}
