import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_cash/pages/select_monthly_expense/mobile_select_monthly_expense_page.dart';

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
      // home: kIsWeb ? WebDashboardPage() : SplashPage(),
      home: MobileSelectMonthlyExpensePage(),
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
