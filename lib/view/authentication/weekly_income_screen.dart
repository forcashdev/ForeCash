import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_web_appbar.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/visibility_controller.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/widgets/weekly_income_widget.dart';
import 'package:get/get.dart';

class WeeklyIncomeScreen extends StatefulWidget {
  const WeeklyIncomeScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyIncomeScreen> createState() => _WeeklyIncomeScreenState();
}

class _WeeklyIncomeScreenState extends State<WeeklyIncomeScreen> {
  @override
  void initState() {
    super.initState();
    print(WeeklyIncomeModel.weeklyIncomeList);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _incomeName = TextEditingController();
    TextEditingController _amount = TextEditingController();
    final visibilityController = Get.put(VisibilityController());
    final controller = Get.put(SelectedDropDownItem());
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            appBar: maxWidth ? CommonWebAppbar.commonWebAppbar(scale: Get.mediaQuery.size.aspectRatio * 150) : null,
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
                      selectWeeklyIncome,
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
                          text: weeklyIncomeSubTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: Color(0xFF777C90),
                            fontFamily: AppTheme.fontName,
                          ),
                          children: [
                            TextSpan(
                              text: weeklyIncomeSubTitle2,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              height: Get.height * 0.020,
                            ),
                            WeeklyIncomeWidget.weeklyIncomeWidget(constraints: constraints),
                            GetBuilder<VisibilityController>(
                              builder: (controller) {
                                return Visibility(
                                    maintainState: visibilityController.visibility,
                                    visible: visibilityController.visibility,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        bottom: Get.height * 0.019,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: constraints.maxWidth < 1000 ? Get.width * 0.29 : Get.width * 0.15,
                                            height: Get.height * 0.044,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(
                                                right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02,
                                                left: constraints.maxWidth < 1000
                                                    ? constraints.maxWidth < 800
                                                        ? Get.width * 0.04
                                                        : Get.width * 0.03
                                                    : 37),
                                            child: TextField(
                                              controller: _incomeName,
                                              style: const TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14),
                                              decoration: const InputDecoration(contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                                            ),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 6,
                                            ),
                                            width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            height: Get.height * 0.044,
                                            alignment: Alignment.center,
                                            child: dropDownDayGetBuilder(dropDownList: days),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 6),
                                            width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            height: Get.height * 0.044,
                                            alignment: Alignment.center,
                                            child: dropDownWeekGetBuilder(dropDownList: weeks),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Expanded(
                                            child: Container(
                                              // width: sequenceSize.width * 0.14,
                                              height: Get.height * 0.044,
                                              alignment: Alignment.center,

                                              child: TextField(
                                                controller: _amount,
                                                style: const TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14),
                                                decoration: const InputDecoration(
                                                    prefixStyle: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 13),
                                                    prefixText: '\$',
                                                    contentPadding: EdgeInsets.only(bottom: 7),
                                                    border: InputBorder.none),
                                              ),
                                              margin: EdgeInsets.only(right: Get.width * 0.04),
                                              decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                            ),
                            // MaterialButton(
                            //   onPressed: () {
                            //     if (_incomeName.text.isNotEmpty && _amount.text.isNotEmpty) {
                            //       setState(() {
                            //         WeeklyIncomeModel.weeklyIncomeList.add(WeeklyIncomeModel(expenseName: _incomeName.text, amount: _amount.text));
                            //       });
                            //     }
                            //   },
                            //   color: Colors.red,
                            //   child: Text('add'),
                            //   height: 50,
                            //   minWidth: 100,
                            // ),
                            GestureDetector(
                              onTap: () {
                                visibilityController.changeVisibility();
                              },
                              // onSecondaryTap: () {
                              //   WeeklyIncomeModel.weeklyIncomeList.add(WeeklyIncomeModel(expenseName: _incomeName.text, amount: _amount.text));
                              // },
                              child: Align(
                                alignment: const FractionalOffset(0.015, 0.0),
                                child: Text(
                                  addWeeklyIncome,
                                  style: const TextStyle(color: Color(0xff087DA1), fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
                                ),
                              ),
                            )
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

  Widget dropDownDayGetBuilder({List<String>? dropDownList}) {
    final controller = Get.put(SelectedDropDownItem());
    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        return commonDropDown(itemList: dropDownList, value: controller.selectedSingleDay);
      },
    );
  }

  Widget dropDownWeekGetBuilder({List<String>? dropDownList}) {
    final controller = Get.put(SelectedDropDownItem());

    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        return commonDropDown(itemList: dropDownList, value: controller.selectedSingleWeek);
      },
    );
  }
}
