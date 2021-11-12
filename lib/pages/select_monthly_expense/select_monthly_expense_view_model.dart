import 'package:flutter/material.dart';
import 'package:for_cash/pages/select_calendar_page/mobile_select_calender_page.dart';
import 'package:for_cash/pages/select_weekly_income/mobile_select_weekly_income_page.dart';

class SelectMonthlyExpenseModel{

  dynamic state;

  SelectMonthlyExpenseModel(this.state) {
    this.state = state;
  }

  void onTapOfNext(){

    Navigator.of(state.context).push(MaterialPageRoute(builder: (builder) => MobileSelectCalenderPage()));


  }



}