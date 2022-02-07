import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
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
    final controller = Get.put(SelectedDropDownItem());
    final checkBoxController = Get.put(CheckBoxController());
    final screenIndexController = Get.put(ScreenIndexController());
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 1);
          return false;
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth > 1000;
            return Scaffold(
              backgroundColor: constraints.maxWidth > 1000 ? backGroundColor : Colors.white,
              body: Align(
                alignment: maxWidth ? Alignment.center : Alignment.topCenter,
                child: SingleChildScrollView(
                  physics: maxWidth ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                    width: maxWidth ? Get.width / 1.4 : null,
                    height: maxWidth ? Get.height * 0.78 : null,
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
                          height: maxWidth ? Get.height * 0.02 : Get.height * 0.04,
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
                          flex: maxWidth ? 2 : 0,
                          // flex: constraints.maxWidth > 1000 ? 2 : 0,
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            height: constraints.maxWidth > 1000 ? double.infinity : null,
                            decoration: BoxDecoration(color: Colors.white, border: maxWidth ? Border.all(color: commonGreyColor.withOpacity(0.5)) : null, borderRadius: BorderRadius.circular(5)),
                            // child: Column(
                            //   // direction: Axis.vertical, mainAxisSize: MainAxisSize.min,
                            //   // direction: Axis.vertical,
                            //   // mainAxisSize: constraints.maxWidth > 1000 ? MainAxisSize.min : MainAxisSize.min,
                            //   children: [
                            //     _nameTableRowWidget(constraints: constraints),
                            //     SizedBox(
                            //       height: Get.height * 0.01,
                            //     ),
                            //     maxWidth
                            //         ? Divider(
                            //             color: commonGreyColor.withOpacity(0.5),
                            //           )
                            //         : Container(),
                            //     Expanded(flex: constraints.maxWidth > 1000 ? 2 : 0, child: monthlyIncomeWidget(constraints: constraints)),
                            //   ],
                            // ),
                            child: Column(
                              children: [
                                _nameTableRowWidget(constraints: constraints),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                maxWidth
                                    ? Divider(
                                        color: commonGreyColor.withOpacity(0.5),
                                      )
                                    : Container(),
                                // SizedBox(
                                //   height: Get.height * 0.025,
                                // ),
                                Expanded(flex: maxWidth ? 2 : 0, child: monthlyIncomeWidget(constraints: constraints)),
                              ],
                            ),
                          ),
                        ),
                        Visibility(visible: maxWidth ? true : false, child: _nextButtonWidget(constraints: constraints))
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Visibility(
                visible: maxWidth ? false : true,
                child: _nextButtonWidget(constraints: constraints),
              ),
            );
          },
        ),
      ),
    );
  }

  _nameTableRowWidget({BoxConstraints? constraints}) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(0.35),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(2),
      },
      children: [
        TableRow(children: [
          SizedBox(),
          Padding(
            padding: EdgeInsets.only(left: constraints!.maxWidth > 1000 ? 0 : 0.0),
            child: Padding(
              padding: EdgeInsets.only(left: constraints.maxWidth > 1000 ? 5 : 0.0),
              child: Text(
                incomeName,
                style: columnNameListStyle,
              ),
            ),
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
            startDate,
            style: columnNameListStyle,
          ),
          Text(
            amount,
            style: columnNameListStyle,
          ),
        ]),
      ],
    );
  }

  _nextButtonWidget({BoxConstraints? constraints}) {
    final screenIndexController = Get.put(ScreenIndexController());
    return Padding(
      padding: EdgeInsets.only(
          bottom: constraints!.maxWidth < 1000 ? Get.height * 0.010 : Get.height * 0.03,
          left: constraints.maxWidth > 1000 ? Get.width * 0.15 : Get.width * 0.04,
          right: constraints.maxWidth > 1000 ? Get.width * 0.15 : Get.width * 0.04,
          top: Get.width * 0.015),
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
    );
  }
}
