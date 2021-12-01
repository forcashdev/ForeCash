import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_app_bar.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_insert_table.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/select_weekly_income/widgets/select_weekly_income_text.dart';

import 'select_weekly_income_view_model.dart';


class MobileSelectWeeklyIncomePage extends StatefulWidget {
  @override
  _MobileSelectWeeklyIncomePageState createState() =>
      _MobileSelectWeeklyIncomePageState();
}

class _MobileSelectWeeklyIncomePageState
    extends State<MobileSelectWeeklyIncomePage> {

  SelectWeeklyIncomeModel model;

  List<String> paidOnList = [ '1st',
    '2nd',
    '3rd',
    '4th',
    '5th',
    '6th',
    "7th",
    "8th",
    "9th",
    "10th",
    '11st',
    '12nd',
    '13rd',
    '14th',
    '15th',
    '16th',
    "17th",
    "18th",
    "19th",
    "20th",
    '21st',
    '22nd',
    '23rd',
    '24th',
    '25th',
    '26th',
    "27th",
    "28th",
    "29th",
    "30th",
    "31st"];
  List<String> everyList = ['1 Mon', '2 Mon', '3 Mon', '4 Mon'];
  String paidOnSelectedValue = '1st';
  String everySelectedValue = '1 Mon';
  List<String> columnNameList = ['Expense name', 'Paid on', 'Every', 'Amount'];

  @override
  Widget build(BuildContext context) {
    model ?? (model = SelectWeeklyIncomeModel(this));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar(context, false),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SelectWeeklyIncomeText())),
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
              height: 2,
            ),
          ),
        ),
      ],
    ),
  );

}