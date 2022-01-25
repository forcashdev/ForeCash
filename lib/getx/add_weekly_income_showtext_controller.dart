import 'package:get/get.dart';

class ShowWeeklyIncomeSaveDataTextController extends GetxController {
  bool weeklyIncomeShowText = true;
  bool weeklyIncomeShowTextWeb = true;
  void changeVisibility() {
    weeklyIncomeShowText = !weeklyIncomeShowText;
    update();
  }

  void changeVisibilityForWeb() {
    weeklyIncomeShowTextWeb = !weeklyIncomeShowTextWeb;
    update();
  }
}
