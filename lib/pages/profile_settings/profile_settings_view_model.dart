import 'package:flutter/material.dart';
import 'package:for_cash/pages/forget_password/mobile_forget_password_page.dart';

class ProfileSettingsViewModel{
  dynamic state;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  ProfileSettingsViewModel(dynamic state){
    this.state = state;
  }

  void onTapSave(){
    Navigator.push(state.context, MaterialPageRoute(builder: (context) => MobileForgetPasswordPage()));
  }
}