import 'package:get/get.dart';

class WeeklyIncomeExpansionChange extends GetxController {
  bool weeklyIncomeExpansionValue = false;

  void changeExpansionValue() {
    weeklyIncomeExpansionValue = !weeklyIncomeExpansionValue;
    update();
  }
}
