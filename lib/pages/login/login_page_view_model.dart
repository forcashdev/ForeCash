import 'package:flutter/material.dart';
import 'package:for_cash/pages/connect_bank_account_page/mobile_bank_account_page.dart';

class LoginPageViewModel{

  dynamic state;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  LoginPageViewModel(this.state) {
    this.state = state;
  }

  void validateLogin(){

    Navigator.of(state.context).push(MaterialPageRoute(builder: (builder) => MobileBankAccountPage()));

    // if(formKey.currentState.validate()){
    //   formKey.currentState.save();
    //   print('validate login');
    // }

  }



}