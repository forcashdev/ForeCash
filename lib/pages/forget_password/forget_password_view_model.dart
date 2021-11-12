import 'package:flutter/material.dart';

class ForgetPasswordViewModel{
  dynamic state;


  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  ForgetPasswordViewModel(dynamic state){
    this.state = state;
  }

  void onTapSave(){

  }
}