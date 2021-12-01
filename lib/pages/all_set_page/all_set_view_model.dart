import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_cash/pages/dashboard_page/mobile_dashboard_page.dart';

class AllSetViewModel{
  dynamic state;

  AllSetViewModel(this.state) {
    this.state = state;
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacement(state.context,
            MaterialPageRoute(builder: (context) => MobileDashboardPage())));
  }
}