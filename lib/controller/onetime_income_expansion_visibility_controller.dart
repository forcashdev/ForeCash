import 'package:get/get.dart';

class OneTimeIncomeExpansionVisibilityController extends GetxController {
  bool oneTimeIncomeVisibility = false;
  bool oneTimeIncomeVisibilityIncome = true;

  void changeVisibility() {
    oneTimeIncomeVisibility = !oneTimeIncomeVisibility;
    oneTimeIncomeVisibilityIncome = !oneTimeIncomeVisibilityIncome;
    update();
  }
}
