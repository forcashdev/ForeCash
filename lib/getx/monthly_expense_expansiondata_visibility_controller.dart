import 'package:get/get.dart';

class MonthlyExpenseDataVisibilityController extends GetxController {
  bool monthlyExpenseDataVisibility = false;
  bool monthlyExpenseListVisibility = true;

  void changeVisibility() {
    monthlyExpenseDataVisibility = !monthlyExpenseDataVisibility;
    monthlyExpenseListVisibility = !monthlyExpenseListVisibility;
    update();
  }
}
