import 'package:get/get.dart';

class ShowOneTimeExpenseSaveDataTextController extends GetxController {
  bool oneTimeExpenseShowText = true;
  bool oneTimeExpenseShowTextWeb = true;
  void changeVisibility() {
    oneTimeExpenseShowText = !oneTimeExpenseShowText;

    update();
  }

  void changeVisibilityForWeb() {
    oneTimeExpenseShowTextWeb = !oneTimeExpenseShowTextWeb;

    update();
  }
}
