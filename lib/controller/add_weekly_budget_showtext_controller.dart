import 'package:get/get.dart';

class ShowWeeklyBudgetSaveDataTextController extends GetxController {
  bool weeklyBudgetShowText = true;
  bool weeklyBudgetShowTextWeb = true;
  void changeVisibility() {
    weeklyBudgetShowText = !weeklyBudgetShowText;

    update();
  }

  void changeVisibilityForWeb() {
    weeklyBudgetShowTextWeb = !weeklyBudgetShowTextWeb;

    update();
  }
}
