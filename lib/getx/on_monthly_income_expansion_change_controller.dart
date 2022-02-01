import 'package:get/get.dart';

class MonthlyIncomeExpansionChange extends GetxController {
  bool expansionValue = false;

  void changeExpansionValue() {
    expansionValue = !expansionValue;
    update();
  }
}
