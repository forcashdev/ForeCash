import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_cash/pages/configuration/web_configuration_page.dart';
import 'package:for_cash/pages/dashboard_page/mobile_dashboard_page.dart';
import 'package:for_cash/pages/dashboard_page/web_dashboard_page.dart';
import 'package:for_cash/pages/forget_password/web_forget_password_page.dart';
import 'package:for_cash/pages/profile_settings/web_profile_settings_page.dart';
import 'package:for_cash/pages/reset_password/web_reset_password_page.dart';
import 'package:for_cash/pages/select_calendar_page/mobile_select_calender_page.dart';
import 'package:for_cash/pages/select_calendar_page/widgets/select_calender_text.dart';
import 'package:for_cash/pages/select_monthly_expense/web_select_monthly_expense_page.dart';
import 'package:for_cash/pages/select_monthly_income/mobile_select_monthly_income_page.dart';
import 'package:for_cash/pages/select_weekly_income/mobile_select_weekly_income_page.dart';
import 'package:for_cash/pages/setup_step/setup_step_page.dart';
import 'package:for_cash/pages/setup_weekly_budget/web_setup_weekly_budget_page.dart';
import 'package:for_cash/pages/sign_up/mobile_sign_up_page.dart';
import 'package:for_cash/pages/sign_up/web_sign_up_page.dart';

import 'app/theme/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fore Cash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppTheme.colorPrimary,
          fontFamily: AppTheme.fontName,
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppTheme.colorPrimary.withOpacity(0.2),
            selectionHandleColor: AppTheme.colorPrimary,
          )),
      home: kIsWeb ? WebDashboardPage() : MobileSelectWeeklyIncomePage(),
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
