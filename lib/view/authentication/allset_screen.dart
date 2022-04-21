import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/mix_panel.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class AllSetScreen extends StatefulWidget {
  const AllSetScreen({Key? key}) : super(key: key);

  @override
  State<AllSetScreen> createState() => _AllSetScreenState();
}

class _AllSetScreenState extends State<AllSetScreen> {
  late final Mixpanel _mixpanel;
  Future<void> _initMixpanel() async {
    _mixpanel = await MixpanelManager.init();
    _mixpanel.track(allSet);
  }

  @override
  void initState() {
    super.initState();
    _initMixpanel();
    Timer(
        const Duration(milliseconds: 2500),
        () =>
            // Get.off(const DashBoardScreen())
            Navigator.pushReplacementNamed(context, 'DashBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: color174261,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom: Get.height * 0.25),
                  child: Lottie.asset(
                    'assets/lottie/lottieAnimation.json',
                    height: Get.height * 0.2,
                    width: Get.width * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
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
