import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_app_bar.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_insert_table.dart';
import 'package:for_cash/app/widgets/common_text.dart';

import 'select_monthly_income_page_view_model.dart';
import 'widgets/select_monthly_income_text.dart';

class MobileSelectMonthlyIncomePage extends StatefulWidget {
  @override
  _MobileSelectMonthlyIncomePageState createState() =>
      _MobileSelectMonthlyIncomePageState();
}

class _MobileSelectMonthlyIncomePageState
    extends State<MobileSelectMonthlyIncomePage> {

  SelectMonthlyIncomeModel model;

  List<String> paidOnList = ['1st', '2nd', '3rd', '4th', '5th', '6th'];
  List<String> everyList = ['1 Mon', '2 Mon', '3 Mon', '4 Mon'];
  String paidOnSelectedValue = '1st';
  String everySelectedValue = '1 Mon';
  List<String> columnNameList = ['Expense name', 'Paid on', 'Every', 'Amount'];

  @override
  Widget build(BuildContext context) {
    model ?? (model = SelectMonthlyIncomeModel(this));
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar(context, false),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SelectMonthlyIncomeText())),
            SizedBox(
              height: 40,
            ),
            CommonInsertTable(
              columnNameList: columnNameList,
              totalRowLength: 5,
              everyList: everyList,
              paidOnList: paidOnList,
              everySelectedValue: everySelectedValue,
              paidOnSelectedValue: paidOnSelectedValue,
            ),
            // customTable(size),
          ],
        ),
      ),
       bottomNavigationBar: nextButton(),
    );
  }

  Widget nextButton() => Container(
    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
            onPressed: model.onTapOfNext,
            color: AppTheme.colorAccent,
            elevation: 0,
            child:CommonText(
              'Next',
              color: AppTheme.colorWhite,
              fontSize: 14.0,
              maxline: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );

}