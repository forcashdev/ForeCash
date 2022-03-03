import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/controller/screen_index_controller.dart';
import 'package:fore_cash/model/login_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginInController extends GetxController {
  static LoginInController get to => Get.find();

  Rx<LoginModel> loginModel = LoginModel().obs;
  // final formKey = GlobalKey<FormState>();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  validateEmail(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter email address.';
    } else if (value?.isNotEmpty ?? false) {
      String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (value!.isEmpty || !regex.hasMatch(value)) {
        return 'Enter a valid email address.';
      }
    }
  }

  validatePassword(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter password.';
    }
    /*if (value!.isNotEmpty) {
      String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Password must contain Upper, Lower character and number with symbol!';
      }
    }*/
  }

  callLogin({String? email, String? password}) {
    // if (formKey.currentState!.validate()) {
    Api().call(
        // isHideLoader: false,
        // isProgressShow: false,
        url: mLogIn,
        params: {
          rEmail: email,
          rPassword: password,
        },
        error: () {
          print(loginModel.value.success);
        },
        success: (Map<String, dynamic> data) {
          print("loginModel.value.success");
          print(data.toString());
          loginModel.value = LoginModel.fromJson(data);

          loginModel.value.toJson();
          if (loginModel.value.success == true) {
            final box = GetStorage();
            box.write('userEmail', email);
            storage.write("loginToken", loginModel.value.data!.token);
            final screenIndexController = Get.put(ScreenIndexController());
            screenIndexController.updateIndex(index: 1);
            Get.to(() => const ScreenProgressIndicator());
            // Get.toNamed('/ProgressIndicator');
          }
          // Get.offAll(() => const MainScreen());
        });
    // }
  }
}
