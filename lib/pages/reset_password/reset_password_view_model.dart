import 'package:flutter/material.dart';

class ResetPasswordViewModel{
  dynamic state;

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  ResetPasswordViewModel(dynamic state){
    this.state = state;
  }

  void onTapSave(){

  }

}