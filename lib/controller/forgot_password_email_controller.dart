import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/model/forgot_password_modal.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/otp_verification_screen.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get to => Get.find();

  Rx<ForgotPasswordModal> forgotPasswordModel = ForgotPasswordModal().obs;

  callForgot({
    String? email,
  }) {
    Api().call(
        url: mForgotPass,
        params: {
          rEmail: email,
        },
        error: () {},
        success: (Map<String, dynamic> data) {
          print('checkData${data.toString()}');
          forgotPasswordModel.value = ForgotPasswordModal.fromJson(data);
          if (forgotPasswordModel.value.success == true) {
            Get.to(() => Otpverification());
          }
          // loginModel.value.toJson();
          // if (loginModel.value.success == true) {
          //   final box = GetStorage();
          //   box.write('userEmail', email);
          //   storage.write("loginToken", loginModel.value.data!.token);
          //   final screenIndexController = Get.put(ScreenIndexController());
          //   screenIndexController.updateIndex(index: 1);
          //   Get.to(() => const ScreenProgressIndicator());
          // }
        });
    // }
  }
}
