import 'package:fore_cash/controller/login_controller.dart';
import 'package:get/get.dart';
// import 'package:swipecart/controller/auth_controller/forgot_password_controller.dart';
// import 'package:swipecart/controller/auth_controller/login_controller.dart';
// import 'package:swipecart/controller/auth_controller/sign_up_controller.dart';
// import 'package:swipecart/controller/bottom_tab_controller/bottom_tab_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<LoginInController>(LoginInController(), permanent: true);
    // Get.put<SignUpController>(SignUpController(), permanent: true);
    // Get.put<ForgotPasswordController>(ForgotPasswordController(), permanent: true);
    // Get.put<BottomTabController>(BottomTabController(), permanent: true);
  }
}
