import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/connect_bank_account_screen.dart';
import 'package:fore_cash/view/authentication/monthly_expenses_screen.dart';
import 'package:fore_cash/view/authentication/monthly_income_screen.dart';
import 'package:fore_cash/view/authentication/setup_calendar_screen.dart';
import 'package:fore_cash/view/authentication/setup_weekly_budget_screen.dart';
import 'package:fore_cash/view/authentication/signup_screen.dart';
import 'package:fore_cash/view/authentication/weekly_income_screen.dart';
import 'package:get/get.dart';

int screenIndex = 0;

class ScreenProgressIndicator extends StatelessWidget {
  const ScreenProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenIndexController = Get.put(ScreenIndexController());
    List screensList = [
      const SignUpScreen(),
      const ConnectBankAccountScreen(),
      const MonthlyIncomeScreen(),
      const WeeklyIncomeScreen(),
      const MonthlyExpensesScreen(),
      const SetupWeeklyBudgetScreen(),
      const SetupCalendarScreen()
    ];
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: constraints.maxWidth > 1000
                ? AppBar(
                    elevation: 5,
                    backgroundColor: Colors.white,
                    leadingWidth: 180,
                    leading: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          foreCashLogo2,
                        )),
                  )
                : null,
            backgroundColor: constraints.maxWidth < 1000 ? null : backGroundColor,
            body: Column(
              children: [
                SizedBox(
                  height: constraints.maxWidth > 1000 ? Get.height * 0.03 : 0.0,
                ),
                constraints.maxWidth > 1000
                    ? SizedBox(
                        width: 1210,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              progressIndicatorTitleList.length,
                              (index) => GetBuilder<ScreenIndexController>(
                                    builder: (controller) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Text(
                                          progressIndicatorTitleList[index],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: index <= screenIndexController.screensIndexes ? FontWeight.w600 : FontWeight.w500,
                                              color: index <= screenIndexController.screensIndexes ? indicatorColor : indicatorColor2),
                                          //color: screenIndexController.screensIndexes == index && screenIndexController.screensIndexes >= index ? indicatorColor : indicatorColor2),
                                        ),
                                      );
                                    },
                                  )),
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: constraints.maxWidth > 1000 ? Get.height * 0.01 : 0.0,
                ),
                constraints.maxWidth > 1000
                    ? GetBuilder<ScreenIndexController>(
                        builder: (controller) {
                          return SizedBox(
                            width: 1200,
                            child: Align(
                              alignment: FractionalOffset(0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(color: indicatorColor, borderRadius: BorderRadius.circular(15)),
                                height: 25,
                                width: screenIndexController.screensIndexes == 0
                                    ? constraints.maxWidth > 1300
                                        ? 160
                                        : Get.width * 0.13
                                    : screenIndexController.screensIndexes == 1
                                        ? constraints.maxWidth > 1300
                                            ? 360
                                            : Get.width * 0.30
                                        : screenIndexController.screensIndexes == 2
                                            ? constraints.maxWidth > 1250
                                                ? 530
                                                : Get.width * 0.44
                                            : screenIndexController.screensIndexes == 3
                                                ? constraints.maxWidth > 1240
                                                    ? 700
                                                    : Get.width * 0.57
                                                : screenIndexController.screensIndexes == 4
                                                    ? constraints.maxWidth > 1240
                                                        ? 870
                                                        : Get.width * 0.72
                                                    : screenIndexController.screensIndexes == 5
                                                        ? constraints.maxWidth > 1240
                                                            ? 1040
                                                            : Get.width * 0.86
                                                        : screenIndexController.screensIndexes == 6
                                                            ? constraints.maxWidth > 1240
                                                                ? 1200
                                                                : Get.width * 0.99
                                                            : 0.0,
                                child: Text(
                                  '$step${screenIndexController.screensIndexes + 1}$step2',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          );
                        },
                      )
                    : Container(),
                // SizedBox(
                //   height: constraints.maxWidth > 1000 ? Get.height * 0.0 : 0.0,
                // ),
                Flexible(
                  child: GetBuilder<ScreenIndexController>(
                    builder: (controller) {
                      return screensList[controller.screensIndexes];
                    },
                  ),
                ),
                // SizedBox(
                //   height: constraints.maxWidth > 1000 ? 100 : 0.0,
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
