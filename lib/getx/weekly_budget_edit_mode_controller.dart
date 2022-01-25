import 'package:get/get.dart';

class WeeklyBudgetEditModeController extends GetxController {
  bool weeklyBudgetEditMode = false;
  bool weeklyBudgetCircleAvatarVisibility = true;

  void showEditMode() {
    weeklyBudgetEditMode = !weeklyBudgetEditMode;
    weeklyBudgetCircleAvatarVisibility = !weeklyBudgetCircleAvatarVisibility;
    update();
  }
}
