import 'package:get/get.dart';

class WeeklyBudgetExpansionChange extends GetxController {
  bool weeklyBudgetExpansionValue = false;

  void changeExpansionValue() {
    weeklyBudgetExpansionValue = !weeklyBudgetExpansionValue;
    update();
  }
}
