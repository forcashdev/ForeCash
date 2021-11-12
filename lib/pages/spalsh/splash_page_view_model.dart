import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_cash/pages/sign_up/mobile_sign_up_page.dart';
import 'package:for_cash/pages/sign_up/web_sign_up_page.dart';
import 'package:for_cash/pages/spalsh/splash_page.dart';

class SplashPageViewModel {
  SplashPageState state;

  SplashPageViewModel(this.state) {
    this.state = state;
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(state.context,
            MaterialPageRoute(builder: (context) => MobileSignUpPage())));
  }
}
