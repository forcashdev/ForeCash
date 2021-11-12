import 'package:flutter/material.dart';
import 'package:for_cash/pages/connect_bank_account_page/mobile_bank_account_page.dart';

class SignUpPageViewModel {
  dynamic state;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  SignUpPageViewModel(this.state) {
    this.state = state;
  }

  void validateSignUp(){

    Navigator.of(state.context).push(MaterialPageRoute(builder: (builder) => MobileBankAccountPage()));

    // if(formKey.currentState.validate()){
    //   formKey.currentState.save();
    //   print('validate signup');
    // }

  }

}