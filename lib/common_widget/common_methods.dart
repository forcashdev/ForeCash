import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';

showCommonDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: LayoutBuilder(builder: (context, constraints) {
            final maxWidth = constraints.maxWidth > 1000;
            return Container(
              width: maxWidth ? 700 : null,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              padding: maxWidth ? const EdgeInsets.all(50.0) : const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(saveYourChanges, style: blackMontserrat16w700),
                  maxWidth ? const SizedBox(height: 20) : const SizedBox(height: 10),
                  const Text(description, style: grey2Montserrat14w500),
                  maxWidth ? const SizedBox(height: 55) : const SizedBox(height: 25),
                  Row(
                    children: [
                      Flexible(
                          child: CommonMaterialButton.commonButton(
                        height: maxWidth ? 65 : 50,
                        text: yes,
                        onPress: () {
                          // Get.to(SetupWeeklyBudgetScreen());
                        },
                      )),
                      const SizedBox(width: 30),
                      Flexible(
                          child: CommonMaterialButton.commonButton(
                        height: maxWidth ? 65 : 50,
                        text: no,
                        bgColor: Colors.white,
                        borderColor: commonTextColor,
                        textStyle: commonBackButtonTheme,
                        onPress: () {
                          // Get.to(SetupWeeklyBudgetScreen());
                        },
                      )),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      });
}
