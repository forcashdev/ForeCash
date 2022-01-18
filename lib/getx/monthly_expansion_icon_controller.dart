import 'package:get/get.dart';

class MonthlyExpansionIconController extends GetxController {
  bool iconValue = false;

  void changeIconValue({bool? value}) {
    iconValue = value!;
    update();
  }
}
