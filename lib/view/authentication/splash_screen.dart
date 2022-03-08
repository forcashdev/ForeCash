import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/controller/screen_index_controller.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final screenIndexController = Get.put(ScreenIndexController());
    super.initState();
    Timer(const Duration(seconds: 3), () {
      final box = GetStorage();
      final finalUserEmail = box.read('userEmail');

      screenIndexController.updateIndex(
          index: finalUserEmail == null
              ? 0
              : kIsWeb
                  ? screenIndexController.screensIndexes.read('index')
                  : 1);
      // screenIndexController.pageController.animateToPage(finalUserEmail == null ? 1 : 2, duration: Duration(milliseconds: 1600), curve: Curves.easeInOut);
      // Navigator.pushReplacementNamed(context, 'AllSet');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => finalUserEmail == null ? const LoginScreen() : const ScreenProgressIndicator(),
          ));

      // Get.off(ScreenProgressIndicator());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff012F5C),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: constraints.maxWidth < 1000
                          ? DecorationImage(
                              // fit: BoxFit.cover,
                              image: AssetImage(backGroundImage),
                            )
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(dotsImage),
                            )),
                  child: Center(
                    child: Image.asset(
                      foreCashLogo,
                      scale: constraints.maxWidth < 1000 ? 4 : 3,
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.05,
                  left: Get.width * 0.03,
                  child: Image.asset(
                    'assets/image/png/dollerimgg.png',
                    scale: 3,
                  ),
                ),
                Positioned(
                  top: constraints.maxWidth < 1000 ? Get.height * 0.09 : Get.height * 0.02,
                  right: Get.width * 0.0,
                  child: constraints.maxWidth < 1000
                      ? Image.asset(
                          dollerImage2,
                          scale: 4,
                        )
                      : Image.asset(
                          dollerImage3,
                          scale: 2,
                        ),
                ),
                Positioned(
                  bottom: constraints.maxWidth < 1000 ? Get.height * 0.0 : Get.height * 0.1,
                  left: Get.width * 0.03,
                  child: Image.asset(
                    splashImage,
                    scale: 4,
                  ),
                ),
                Positioned(
                  bottom: constraints.maxWidth < 1000 ? Get.height * 0.05 : Get.height * 0.2,
                  right: constraints.maxWidth < 1000 ? Get.width * 0.06 : Get.width * 0.1,
                  child: Image.asset(
                    splashImage2,
                    scale: 4,
                  ),
                ),
              ],
            );
          },
        ));
  }
}
