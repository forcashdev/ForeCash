import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:fore_cash/view/authentication/widgets/monthly_income_widget.dart';
import 'package:get/get.dart';

class MonthlyIncomeScreen extends StatelessWidget {
  const MonthlyIncomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenIndexController = Get.put(ScreenIndexController());
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            body: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                width: maxWidth ? Get.width / 1.4 : null,
                height: maxWidth ? 700 : null,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Align(
                      alignment: const FractionalOffset(0.5, 0.0),
                      child: maxWidth
                          ? null
                          : Image.asset(
                              foreCashLogo2,
                              scale: 3,
                            ),
                    ),
                    SizedBox(
                      height: maxWidth ? Get.height * 0.03 : 0.0,
                    ),
                    maxWidth ? const SizedBox() : commonDivider(),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Text(
                      selectMonthlyIncomes,
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
                          text: identified,
                          style: textSpanStyle1,
                          children: [
                            TextSpan(
                              text: towards,
                              style: textSpanStyle2,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        // width: maxWidth ? sequenceSize.width / 1.5 : null,
                        // height: maxWidth ? 300 : null,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            border: maxWidth ? Border.all(color: commonGreyColor) : null,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                              Text(
                                incomeName,
                                style: columnNameListStyle,
                              ),
                              Text(
                                paidOn,
                                style: columnNameListStyle,
                              ),
                              Text(
                                every,
                                style: columnNameListStyle,
                              ),
                              Text(
                                amount,
                                style: columnNameListStyle,
                              ),
                            ]),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            maxWidth
                                ? const Divider(
                                    color: commonGreyColor,
                                  )
                                : Container(),
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                            Expanded(child: MonthlyIncomeWidget.monthlyIncomeWidget(constraints: constraints)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: Get.height * 0.03, left: maxWidth ? Get.width * 0.15 : Get.width * 0.04, right: maxWidth ? Get.width * 0.15 : Get.width * 0.04, top: Get.width * 0.015),
                      child: CommonMaterialButton.commonButton(
                        height: 50,
                        text: next,
                        onPress: () {
                          screenIndex = 3;
                          print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
                          screenIndexController.updateIndex(index: 3);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => WeeklyIncomeScreen(),
                          //     ));

                          // Get.to(WeeklyIncomeScreen());
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
