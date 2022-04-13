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

  callLogin({String? email, String? password}) {
    Api().call(
        url: mLogIn,
        params: {
          rEmail: email,
          rPassword: password,
        },
        error: () {},
        success: (Map<String, dynamic> data) {
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
          }
        });
    // }
  }
}
