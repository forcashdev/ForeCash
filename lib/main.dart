import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/view/authentication/signup_screen.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app_theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) {
        return ResponsiveWrapper.builder(widget, maxWidth: 4000, minWidth: 480, defaultScale: false, breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(4000, name: DESKTOP),
        ]);
      },
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen(),
      theme: ThemeData(
          primaryColor: colorPrimary,
          fontFamily: AppTheme.fontName,
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: colorPrimary.withOpacity(0.2),
            selectionHandleColor: colorPrimary,
          )),
    );
  }
}
