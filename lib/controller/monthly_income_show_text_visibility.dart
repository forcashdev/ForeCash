import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddMonthlyIncomeVisibilityController extends GetxController {
  bool monthlyIncomeVisibility = false;

  void changeVisibility() {
    monthlyIncomeVisibility = !monthlyIncomeVisibility;
    print(monthlyIncomeVisibility);
    update();
  }
}
