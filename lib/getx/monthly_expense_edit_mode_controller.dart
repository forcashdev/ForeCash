import 'package:get/get.dart';

class MonthlyExpenseEditModeController extends GetxController {
  bool monthlyExpenseEditMode = false;
  bool monthlyExpenseCircleAvatarVisibility = true;

  void showEditMode() {
    monthlyExpenseEditMode = !monthlyExpenseEditMode;
    monthlyExpenseCircleAvatarVisibility = !monthlyExpenseCircleAvatarVisibility;
    update();
  }
}
