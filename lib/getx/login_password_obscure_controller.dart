import 'package:get/get.dart';

class LogInPasswordObscureController extends GetxController {
  bool obscure = true;

  void changeObscure() {
    obscure = !obscure;
    update();
  }
}
