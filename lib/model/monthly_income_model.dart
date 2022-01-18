import 'package:flutter/material.dart';

class MonthlyIncomeModel {
  final String? expenseName;
  final double? amount;
  final Widget? dropDown;
  MonthlyIncomeModel({this.expenseName, this.amount, this.dropDown});

  static List<MonthlyIncomeModel> monthlyincomeList = [
    MonthlyIncomeModel(
      expenseName: 'Apple inc.',
      amount: 500,
    ),
    MonthlyIncomeModel(
      expenseName: 'Apple inc.',
      amount: 500,
    ),

    // MonthlyIncomeModel(
    //   expenseName: 'Apple inc.',
    //   amount: 500,
    // ),
    // MonthlyIncomeModel(
    //   expenseName: 'Apple inc.',
    //   amount: 500,
    // ),
    // MonthlyIncomeModel(
    //   expenseName: 'Apple inc.',
    //   amount: 500,
    // ),
    // MonthlyIncomeModel(
    //   expenseName: 'Apple inc.',
    //   amount: 500,
    // ),
    // MonthlyIncomeModel(
    //   expenseName: 'Apple inc.',
    //   amount: 500,
    // ),
    // MonthlyIncomeModel(
    //   expenseName: 'Apple inc.',
    //   amount: 500,
    // ),
    // MonthlyIncomeModel(
    //   expenseName: 'Apple inc.',
    //   amount: 500,
    // ),
  ];
}
