import 'package:get/get.dart';

class WeeklyIncomeDataVisibilityController extends GetxController {
  bool weeklyDataVisibility = false;
  bool incomeListVisibility = true;

  void changeVisibility() {
    weeklyDataVisibility = !weeklyDataVisibility;
    incomeListVisibility = !incomeListVisibility;
    update();
  }
}
