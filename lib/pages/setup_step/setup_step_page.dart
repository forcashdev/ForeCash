import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/utils/responsive.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/connect_bank_account_page/web_bank_account_page.dart';
import 'package:for_cash/pages/select_calendar_page/web_select_calender_page.dart';
import 'package:for_cash/pages/select_monthly_expense/web_select_monthly_expense_page.dart';
import 'package:for_cash/pages/select_monthly_income/web_select_monthly_income.dart';
import 'package:for_cash/pages/select_weekly_income/web_select_weekly_income_page.dart';
import 'package:for_cash/pages/setup_step/setup_step_view_model.dart';
import 'package:for_cash/pages/setup_weekly_budget/web_setup_weekly_budget_page.dart';
import 'package:for_cash/pages/sign_up/web_sign_up_page.dart';

class SetupStepPage extends StatefulWidget {
  const SetupStepPage({Key key}) : super(key: key);

  @override
  SetupStepPageState createState() => SetupStepPageState();
}

class SetupStepPageState extends State<SetupStepPage> {
  SetupStepViewModel model;
  List<Widget> stepScreenList = [
    WebSignUpPage(),
    WebBankAccountPage(),
    WebSelectMonthlyIncomePage(),
    WebSelectWeeklyIncomePage(),
    WebSelectMonthlyExpensePage(),
    WebSelectWeeklyBudgetPage(),
    WebSelectCalanderPage(),
  ];

  List<String> stepList = [
    "Create Account",
    "Connect Bank Account",
    "Monthly Expense",
    "Weekly Expense",
    "Monthly Income",
    "Weekly Income",
    "Setup Calendar"
  ];

  @override
  Widget build(BuildContext context) {
    model ?? (model = SetupStepViewModel(this));
    var size = MediaQuery.of(context).size;
    var width1 = size.width / 7;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
      ),
    );
  }
}
