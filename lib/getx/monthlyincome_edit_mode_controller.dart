import 'package:get/get.dart';

class MonthlyIncomeEditModeController extends GetxController {
  bool editMode = false;

  void showEditMode() {
    editMode = !editMode;
    update();
  }
}
