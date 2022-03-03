import 'package:get/get.dart';

class OneTimeIncomeEditModeController extends GetxController {
  bool oneTimeIncomeEditMode = false;
  bool oneTimeIncomeCircleAvatarVisibility = true;

  void showEditMode() {
    oneTimeIncomeEditMode = !oneTimeIncomeEditMode;
    oneTimeIncomeCircleAvatarVisibility = !oneTimeIncomeCircleAvatarVisibility;
    update();
  }
}
