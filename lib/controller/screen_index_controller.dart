import 'package:get/get.dart';

class ScreenIndexController extends GetxController {
  int? screensIndexes = 0;
  void updateIndex({int? index}) {
    screensIndexes = index!;
    update();
  }
}
