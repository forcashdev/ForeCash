import 'package:get/get.dart';

class OneTimeExpenseExpansionChange extends GetxController {
  bool oneTimeExpenseExpansionValue = false;

  void changeExpansionValue() {
    oneTimeExpenseExpansionValue = !oneTimeExpenseExpansionValue;
    update();
  }
}
