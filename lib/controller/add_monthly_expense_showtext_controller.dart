import 'package:get/get.dart';

class ShowMonthlyExpenseSaveDataTextController extends GetxController {
  bool monthlyExpenseShowText = true;
  bool monthlyExpenseShowTextWeb = true;
  void changeVisibility() {
    monthlyExpenseShowText = !monthlyExpenseShowText;
    update();
  }

  void changeVisibilityForWeb() {
    monthlyExpenseShowTextWeb = !monthlyExpenseShowTextWeb;
    update();
  }
}
