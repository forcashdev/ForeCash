import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_web_appbar.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/widgets/monthly_income_widget.dart';
import 'package:get/get.dart';

class MonthlyExpensesScreen extends StatelessWidget {
  const MonthlyExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            appBar: maxWidth ? CommonWebAppbar.commonWebAppbar(scale: Get.size.aspectRatio * 150) : null,
            backgroundColor: maxWidth ? backGroundColor : null,
            body: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                color: Colors.white,
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
                          style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: Color(0xFF777C90),
                            fontFamily: AppTheme.fontName,
                          ),
                          children: [
                            TextSpan(
                              text: towards,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: AppTheme.fontName,
                                color: Color(0xFF777C90),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Expanded(
                    //       flex: 6,
                    //       child: Text(
                    //         expenseName,
                    //         style: const TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, color: Color(0xff777C90), fontSize: 13),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 3,
                    //       child: Text(
                    //         paidOn,
                    //         style: const TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, color: Color(0xff777C90), fontSize: 13),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 3,
                    //       child: Text(
                    //         every,
                    //         style: const TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, color: Color(0xff777C90), fontSize: 13),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text(
                    //         amount,
                    //         style: const TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, color: Color(0xff777C90), fontSize: 13),
                    //       ),
                    //     )
                    //   ],
                    // ),
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: Get.width * 11,
                                child: Row(
                                  children: List.generate(
                                      columnNameList.length,
                                      (index) => Expanded(
                                            flex: index == 0
                                                ? maxWidth
                                                    ? 4
                                                    : 5
                                                : (index == 1 || index == 2)
                                                    ? 3
                                                    : 4,
                                            child: Text(
                                              columnNameList[index].toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: commonGreyColor,
                                              ),
                                              textAlign: TextAlign.center,
                                              // style: TextStyle(fontSize: 15),
                                            ),
                                          )),
                                ),
                              ),
                            ),
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
                        context: context,
                        onPress: () {},
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
