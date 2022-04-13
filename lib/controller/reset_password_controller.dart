import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/model/reset_password_modal.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/login_screen.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get to => Get.find();

  Rx<ResetPasswordModal> resetPassModal = ResetPasswordModal().obs;

  callResetPassword({String? email, String? newPassword}) {
    Api().call(
        url: mForgotPass,
        params: {
          rEmail: email,
          rPassword: newPassword,
        },
        error: () {},
        success: (Map<String, dynamic> data) {
          resetPassModal.value = ResetPasswordModal.fromJson(data);
          if (resetPassModal.value.success == true) {
            Get.to(() => const LoginScreen());
          }
        });
  }
}
