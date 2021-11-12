import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
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
    var width1 = size.width * 0.114;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              // and it take 1/6 part of the screen
              child: Container(
                width: size.width,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20.0),
                child: CommonImageAsset(
                  image: Constants.ic_logo_primary,
                  height: 45.0,
                ),
              ),
            ),
            Expanded(
              //It takes 5/6 part of the screen
              flex: 7,
              child: Container(
                alignment: Alignment.center,
                color: AppTheme.colorBackground,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                            alignment: Alignment.center,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: size.width * 0.052,
                                );
                              },
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: stepList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                String steps = stepList[index];
                                return CommonText(
                                  "$steps",
                                  color: AppTheme.colorPrimary,
                                  fontSize: 14.0,
                                  maxline: 2,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                );
                              },
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 25.0,
                                 decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              StreamBuilder<int>(
                                  stream: stepIndexStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData && snapshot.data != null) {
                                      return Container(
                                          width: width1 * (snapshot.data + 1),
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: AppTheme.colorPrimary,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: CommonText(
                                                "Step ${snapshot.data + 1} of 7",
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )));
                                    } else {
                                      return Container(
                                          width: size.width * 0.13,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: AppTheme.colorPrimary,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: CommonText(
                                                "Step 1 of 7",
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )));
                                    }
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    StreamBuilder<int>(
                      stream: stepIndexStream,
                      builder: (context, snapshot) {
                        print("Step Index Stream-> ${snapshot.data}");
                        if (snapshot.hasData && snapshot.data != null) {
                          return stepScreenList[snapshot.data];
                        } else {
                          return stepScreenList[0];
                        }
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
