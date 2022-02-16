import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/view/authentication/monthly_expenses_screen.dart';
import 'package:fore_cash/view/authentication/weekly_income_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'api/app_binding/app_bindings.dart';
import 'app_theme/app_theme.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: () => GetMaterialApp(
        initialBinding: AppBinding(),
        builder: (context, widget) {
          return ResponsiveWrapper.builder(widget, maxWidth: 4000, minWidth: 480, defaultScale: false, breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.resize(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ]);
        },
        debugShowCheckedModeBanner: false,
        home: const MonthlyExpensesScreen(),
        theme: ThemeData(
            primaryColor: colorPrimary,
            fontFamily: AppTheme.fontName,
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: colorPrimary.withOpacity(0.2),
              selectionHandleColor: colorPrimary,
            )),
      ),
    );
  }
}
