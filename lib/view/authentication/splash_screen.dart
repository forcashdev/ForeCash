import 'package:flutter/material.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
                      image: constraints.maxWidth < 800
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
                      scale: constraints.maxWidth < 800 ? 4 : 3,
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.05,
                  left: Get.width * 0.03,
                  child: Image.asset(
                    dollerImage,
                    scale: 1,
                  ),
                ),
                Positioned(
                  top: constraints.maxWidth < 800 ? Get.height * 0.09 : Get.height * 0.02,
                  right: Get.width * 0.0,
                  child: constraints.maxWidth < 800
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
                  bottom: constraints.maxWidth < 800 ? Get.height * 0.0 : Get.height * 0.1,
                  left: Get.width * 0.03,
                  child: Image.asset(
                    splashImage,
                    scale: 4,
                  ),
                ),
                Positioned(
                  bottom: constraints.maxWidth < 800 ? Get.height * 0.05 : Get.height * 0.2,
                  right: constraints.maxWidth < 800 ? Get.width * 0.06 : Get.width * 0.1,
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
