import 'package:get/get.dart';

class VisibilityController extends GetxController {
  bool visibility = false;

  void changeVisibility() {
    visibility = !visibility;
    print(visibility);
    update();
  }
}
