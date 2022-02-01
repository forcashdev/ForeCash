import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AllCaughtUpScreen extends StatelessWidget {
  const AllCaughtUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: Get.height * 0.03,
              ),
              maxWidth
                  ? Container()
                  : Image.asset(
                      foreCashLogo2,
                      scale: 3,
                    ),
              SizedBox(
                height: maxWidth ? Get.height * 0.03 : 0.0,
              ),
              maxWidth ? Container() : commonDivider(),
              Text(
                verifyTransaction,
                style: headTitleTheme,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: RichText(
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  text: TextSpan(
                    text: verifyTransactionSubTitle,
                    style: textSpanStyle1,
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Lottie.asset(
                  'assets/lottie/allCaughtUpAnimation.json',
                  width: Get.width / 2,
                  height: Get.height / 3,
                  // fit: BoxFit.cover,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: Get.height * 0.08),
                child: Text(
                  allCaughtUp,
                  style: blueMontserrat13W600,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
