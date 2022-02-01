import 'package:get/get.dart';

class MonthlyExpenseExpansionChange extends GetxController {
  bool monthlyExpenseExpansionValue = false;

  void changeExpansionValue() {
    monthlyExpenseExpansionValue = !monthlyExpenseExpansionValue;
    update();
  }
}
