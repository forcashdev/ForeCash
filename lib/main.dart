import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_cash/pages/connect_bank_account_page/web_bank_account_page.dart';
import 'package:for_cash/pages/dashboard_page/dashboard_page.dart';
import 'package:for_cash/pages/select_monthly_income/mobile_select_monthly_income_page.dart';
import 'package:for_cash/pages/select_weekly_income/mobile_select_weekly_income_page.dart';
import 'package:for_cash/pages/setup_step/setup_step_page.dart';

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
      home: kIsWeb ? SetupStepPage() : DashboardPage(),
    );
  }
}
