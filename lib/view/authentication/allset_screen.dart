import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AllSetScreen extends StatelessWidget {
  const AllSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: colorPrimary,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Get.height * 0.25),
                child: Lottie.asset('assets/lottie/lottieAnimation.json', height: Get.height * 0.2, width: Get.width * 0.2, fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: Get.height * 0.12),
                child: Text(
                  allSet,
                  style: allSetTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
