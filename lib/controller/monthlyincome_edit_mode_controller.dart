import 'package:get/get.dart';

class MonthlyIncomeEditModeController extends GetxController {
  bool editMode = false;
  bool circleAvatarVisibility = true;

  void showEditMode() {
    editMode = !editMode;
    circleAvatarVisibility = !circleAvatarVisibility;
    update();
  }
}
