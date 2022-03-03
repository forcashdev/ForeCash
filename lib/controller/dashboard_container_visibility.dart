import 'package:get/get.dart';

class DashBoardVisibilityController extends GetxController {
  bool visibility = true;

  void changeDashBoardVisibility() {
    visibility = !visibility;
    print(visibility);
    update();
  }
}
