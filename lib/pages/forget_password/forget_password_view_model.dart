import 'package:flutter/material.dart';
import 'package:for_cash/pages/reset_password/mobile_reset_password_page.dart';

class ForgetPasswordViewModel {
  dynamic state;

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  ForgetPasswordViewModel(dynamic state) {
    this.state = state;
  }

  void onTapSave() {
    Navigator.push(state.context, MaterialPageRoute(builder: (context) => MobileResetPasswordPage()));
  }
}
