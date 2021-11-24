import 'package:flutter/material.dart';
import 'package:for_cash/pages/verify_transaction/mobile_verify_transaction_page.dart';

class ConfigurationModel{
  dynamic state;
  ConfigurationModel(dynamic state){
    this.state = state;
  }

  void onTapSave(){
    Navigator.push(state.context, MaterialPageRoute(builder: (context) => MobileVerifyTransactionPage()));
  }

}