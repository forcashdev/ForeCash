import 'package:flutter/material.dart';
import 'package:for_cash/pages/configuration/mobile_configuration_page.dart';

class ResetPasswordViewModel{
  dynamic state;

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  ResetPasswordViewModel(dynamic state){
    this.state = state;
  }

  void onTapSave(){
    Navigator.push(state.context, MaterialPageRoute(builder: (context) => MobileConfigurationPage()));

  }

}