import 'package:get/get.dart';

class MonthlyExpansionVisibilityController extends GetxController {
  bool visibility = false;
  bool visibilityIncome = true;

  void changeVisibility() {
    visibility = !visibility;
    visibilityIncome = !visibilityIncome;
    update();
  }
}
