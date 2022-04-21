import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/view/authentication/allset_screen.dart';
import 'package:fore_cash/view/authentication/login_screen.dart';
import 'package:fore_cash/view/authentication/profile_update_screen_screen.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:fore_cash/view/authentication/splash_screen.dart';
import 'package:fore_cash/view/authentication/update_calendar_screen.dart';
import 'package:fore_cash/view/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'api/app_binding/app_bindings.dart';
import 'app_theme/app_theme.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: () => GetMaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          'ProgressIndicator': (context) => const ScreenProgressIndicator(),
          'AllSet': (context) => const AllSetScreen(),
          'DashBoard': (context) => const DashBoardScreen(),
          'Profile': (context) => const ProfileUpdateScreen(),
          'LoginScreen': (context) => const LoginScreen(),
          'UpdateCalendar': (context) => const UpdateCalendarScreen(),
        },
        initialBinding: AppBinding(),
        builder: (context, widget) {
          return ResponsiveWrapper.builder(widget, maxWidth: 4000, minWidth: 480, defaultScale: false, breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.resize(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ]);
        },
        debugShowCheckedModeBanner: false,
        // home: const ForgotPassword(),
        theme: ThemeData(
            primaryColor: color174261,
            fontFamily: AppTheme.fontName,
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: color174261.withOpacity(0.2),
              selectionHandleColor: color174261,
            )),
      ),
    );
  }
}
