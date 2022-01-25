import 'package:get/get.dart';

class WeeklyIncomeEditModeController extends GetxController {
  bool weeklyIncomeEditMode = false;
  bool weeklyCircleAvatarVisibility = true;

  void showEditMode() {
    weeklyIncomeEditMode = !weeklyIncomeEditMode;
    weeklyCircleAvatarVisibility = !weeklyCircleAvatarVisibility;
    update();
  }
}
