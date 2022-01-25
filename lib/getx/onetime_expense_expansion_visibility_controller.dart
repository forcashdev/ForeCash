import 'package:get/get.dart';

class OneTimeExpenseExpansionVisibilityController extends GetxController {
  bool oneTimeExpenseVisibility = false;
  bool oneTimeExpenseVisibilityIncome = true;

  void changeVisibility() {
    oneTimeExpenseVisibility = !oneTimeExpenseVisibility;
    oneTimeExpenseVisibilityIncome = !oneTimeExpenseVisibilityIncome;
    update();
  }
}
