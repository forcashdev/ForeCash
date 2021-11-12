import 'package:flutter/material.dart';

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



  }
}