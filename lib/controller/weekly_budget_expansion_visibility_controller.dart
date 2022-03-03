import 'package:get/get.dart';

class WeeklyBudgetVisibilityController extends GetxController {
  bool weeklyBudgetVisibility = false;
  bool weeklyBudgetVisibilityIncome = true;

  void changeVisibility() {
    weeklyBudgetVisibility = !weeklyBudgetVisibility;
    weeklyBudgetVisibilityIncome = !weeklyBudgetVisibilityIncome;
    update();
  }
}
