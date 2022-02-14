import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/model/register_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  Rx<RegisterModel> registerModel = RegisterModel().obs;

  callRegister({String? email, String? password, String? name}) {
    Api().call(
        // isHideLoader: false,
        // isProgressShow: false,
        url: mRegister,
        params: {
          rName: name,
          rEmail: email,
          rPassword: password,
        },
        error: () {
          print(registerModel.value.success);
        },
        success: (Map<String, dynamic> data) {
          print("loginModel.value.success");
          print(data.toString());
          registerModel.value = RegisterModel.fromJson(data);
          registerModel.value.toJson();
          if (registerModel.value.success == true) {
            final box = GetStorage();
            box.write('userEmail', email);
            final screenIndexController = Get.put(ScreenIndexController());
            // screenIndexController.pageController.animateToPage(2, duration: Duration(milliseconds: 1600), curve: Curves.easeInOut);
            screenIndexController.updateIndex(index: 1);
            Get.to(() => const ScreenProgressIndicator());
          }
        });
    // }
  }
}
