import 'package:flutter/material.dart';
import 'package:for_cash/pages/select_monthly_expense/mobile_select_monthly_expense_page.dart';

class SelectWeeklyIncomeModel {

  dynamic state;

  SelectWeeklyIncomeModel(this.state) {
    this.state = state;
  }

  void onTapOfNext() {
    Navigator.of(state.context).push(MaterialPageRoute(
        builder: (builder) => MobileSelectMonthlyExpensePage()));
  }
}