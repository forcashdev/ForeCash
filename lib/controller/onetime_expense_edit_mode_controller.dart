import 'package:get/get.dart';

class OneTimeExpenseEditModeController extends GetxController {
  bool oneTimeExpenseEditMode = false;
  bool oneTimeExpenseCircleAvatarVisibility = true;

  void showEditMode() {
    oneTimeExpenseEditMode = !oneTimeExpenseEditMode;
    oneTimeExpenseCircleAvatarVisibility = !oneTimeExpenseCircleAvatarVisibility;
    update();
  }
}
