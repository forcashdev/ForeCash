import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_app_bar.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_insert_table.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/setup_weekly_budget/setup_weekly_budget_view_model.dart';
import 'package:for_cash/pages/setup_weekly_budget/widgets/setup_weekly_budget_text.dart';

class MobileSetupWeeklyBudgetPage extends StatefulWidget {
  const MobileSetupWeeklyBudgetPage({Key key}) : super(key: key);

  @override
  MobileSetupWeeklyBudgetPageState createState() =>
      MobileSetupWeeklyBudgetPageState();
}

class MobileSetupWeeklyBudgetPageState
    extends State<MobileSetupWeeklyBudgetPage> {
  SetupWeeklyBudgetViewModel model;

  List<String> paidOnList = ['1st', '2nd', '3rd', '4th', '5th', '6th'];

  /*
  List<String> everyList = ['1', '2 Mon', '3 Mon', '4 Mon'];*/
  String paidOnSelectedValue = '1st';
  String everySelectedValue = '1 Mon';
  List<String> columnNameList = ['Expense name', 'Paid on', 'Every', 'Amount'];

  @override
  Widget build(BuildContext context) {
    model ?? (model = SetupWeeklyBudgetViewModel(this));
    Size size = MediaQuery.of(context).size;
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
                    child: SetupWeeklyBudgetText())),
            SizedBox(
              height: 40,
            ),
            CommonInsertTable(
              isShowColor: false,
              columnNameList: columnNameList,
              totalRowLength: 3,
              everyList: paidOnList,
              paidOnList: paidOnList,
              everySelectedValue: everySelectedValue,
              paidOnSelectedValue: paidOnSelectedValue,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                margin: EdgeInsets.only(left: 3.0),
                child: CommonText(
                  "+ Add New Weekly Budgets",
                  color: AppTheme.colorPrimary,
                  fontSize: 14.0,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  maxline: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            // customTable(size),
          ],
        ),
      ),
      bottomNavigationBar: nextButton(),
    );
  }

  Widget nextButton() => Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                child: CommonText(
                  'Next',
                  color: AppTheme.colorGrey,
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
