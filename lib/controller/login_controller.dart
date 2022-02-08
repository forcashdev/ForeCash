import 'package:flutter/material.dart';
import 'package:fore_cash/model/login_model.dart';
import 'package:get/get.dart';
// import 'package:swipecart/Model/loginModel.dart';
//
// import '../../utility/api_call.dart';
// import '../../utility/cs.dart';
// import '../../view/themes/theme_1/main_screen.dart';

class LoginInController extends GetxController {
  static LoginInController get to => Get.find();

  Rx<LoginModel> loginModel = LoginModel().obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  callLogin() {
    emailController.text = "krish@rentechdigital.com";
    passwordController.text = "Krish@123";
    if (formKey.currentState!.validate()) {
      // Api().call(
      //     url: mLogIn,
      //     params: {
      //       CS.rEmail: emailController.value.text,
      //       CS.rPassword: passwordController.value.text,
      //     },
      //     success: (Map<String, dynamic> data) {
      //       loginModel.value = LoginModel.fromJson(data);
      //       loginModel.value.toJson();
      //       Get.offAll(() => const MainScreen());
      //     });
    }
  }
}
