import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/model/otp_verification_modal.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/reset_password_screen.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  static VerifyOtpController get to => Get.find();

  Rx<OtpVerificationModal> verifyOtpModal = OtpVerificationModal().obs;

  callForgotOtp({String? email, int? otp}) {
    Api().call(
        url: mForgotPass,
        params: {
          rEmail: email,
          rOtp: otp,
        },
        error: () {},
        success: (Map<String, dynamic> data) {
          verifyOtpModal.value = OtpVerificationModal.fromJson(data);
          if (verifyOtpModal.value.success == true) {
            Get.to(() => ResetPasswordScreen(
                  userEmail: email,
                ));
          }
        });
    // }
  }
}
