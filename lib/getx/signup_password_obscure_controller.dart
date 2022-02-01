import 'package:get/get.dart';

class SignUpPasswordObscureController extends GetxController {
  bool obscure = true;

  void changeObscure() {
    obscure = !obscure;
    update();
  }
}
