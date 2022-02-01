import 'package:get/get.dart';

class OneTimeIncomeExpansionChange extends GetxController {
  bool oneTimeIncomeExpansionValue = false;

  void changeExpansionValue() {
    oneTimeIncomeExpansionValue = !oneTimeIncomeExpansionValue;
    update();
  }
}
