import 'package:get/get.dart';

class ShowOneTimeIncomeSaveDataTextController extends GetxController {
  bool oneTimeIncomeShowText = true;
  bool oneTimeIncomeShowTextWeb = true;
  void changeVisibility() {
    oneTimeIncomeShowText = !oneTimeIncomeShowText;

    update();
  }

  void changeVisibilityForWeb() {
    oneTimeIncomeShowTextWeb = !oneTimeIncomeShowTextWeb;

    update();
  }
}
