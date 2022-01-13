import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/visibility_controller.dart';
import 'package:fore_cash/model/weekly_budget_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:fore_cash/view/authentication/widgets/setup_weekly_budget_widget.dart';
import 'package:get/get.dart';

class SetupWeeklyBudgetScreen extends StatefulWidget {
  const SetupWeeklyBudgetScreen({Key? key}) : super(key: key);

  @override
  State<SetupWeeklyBudgetScreen> createState() => _SetupWeeklyBudgetScreenState();
}

class _SetupWeeklyBudgetScreenState extends State<SetupWeeklyBudgetScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _incomeName = TextEditingController();
    TextEditingController _amount = TextEditingController();
    final visibilityController = Get.put(VisibilityController());
    final controller = Get.put(SelectedDropDownItem());
    final checkBoxController = Get.put(CheckBoxController());
    final screenIndexController = Get.put(ScreenIndexController());
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            body: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                width: maxWidth ? Get.width / 1.4 : null,
                height: maxWidth ? 700 : null,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        maxWidth
                            ? const SizedBox()
                            : IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.chevron_left,
                                )),
                        maxWidth
                            ? Container()
                            : Image.asset(
                                foreCashLogo2,
                                scale: 3,
                              ),
                        Container()
                      ],
                    ),
                    SizedBox(
                      height: maxWidth ? Get.height * 0.03 : 0.0,
                    ),
                    maxWidth ? const SizedBox() : commonDivider(),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Text(
                      setupWeeklyBudget,
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
                          text: setupWeeklySubTitle,
                          style: textSpanStyle1,
                          children: [TextSpan(text: setupWeeklySubTitle2, style: textSpanStyle2)],
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
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                              Text(
                                expenseName,
                                style: columnNameListStyle,
                              ),
                              Text(
                                resetOn,
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
                              height: Get.height * 0.020,
                            ),
                            Flexible(child: SetUpWeeklyBudgetWidget.setUpWeeklyBudgetWidget(constraints: constraints)),
                            Padding(
                              padding: EdgeInsets.only(top: Get.height * 0.01),
                              child: GetBuilder<VisibilityController>(
                                builder: (controller1) {
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
                                                style: textFieldStyle,
                                                decoration: InputDecoration(hintText: budget, hintStyle: expenseNameStyle2, contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
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
                                                padding: EdgeInsets.only(left: 6),
                                                child: TextField(
                                                  controller: _amount,
                                                  style: textFieldStyle,
                                                  decoration:
                                                      const InputDecoration(prefixStyle: prefixTextStyle, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
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
                            ),
                            MaterialButton(
                              onPressed: () {
                                if (_incomeName.text.isNotEmpty && _amount.text.isNotEmpty) {
                                  setState(() {
                                    WeeklyBudgetModel.weeklyBudgetModel.add(WeeklyBudgetModel(expenseName: _incomeName.text, amount: _amount.text));
                                    controller.weeklyBudgetDayDropDownList.add(controller.weeklyBudgetDay as Object);
                                    controller.weeklyBudgetWeekDropDownList.add(controller.weeklyBudgetWeek as Object);
                                    checkBoxController.weeklyBudgetCheckBoxValueList.add(false);
                                  });
                                }
                              },
                              color: Colors.red,
                              child: Text('add'),
                              height: 50,
                              minWidth: 100,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: Get.height * 0.01),
                              child: GestureDetector(
                                onTap: () {
                                  visibilityController.changeVisibility();
                                },
                                child: Align(
                                  alignment: const FractionalOffset(0.015, 0.0),
                                  child: Text(
                                    addWeeklyIncome,
                                    style: addWeekIncomeStyle,
                                  ),
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
                        onPress: () {
                          screenIndex = 6;
                          print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
                          screenIndexController.updateIndex(index: 6);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SetupCalendarScreen(),
                          //     ));

                          // Get.to(SetupCalendarScreen());
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

  Widget dropDownDayGetBuilder({List<String>? dropDownList}) {
    final controller = Get.put(SelectedDropDownItem());
    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(
              day,
              style: chooseDateStyle,
            ),
            value: controller.weeklyBudgetDay,
            // value: controller.selectedItem,
            style: dropDownStyle,
            items: dropDownList!.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: dropDownStyle2,
                ),
              );
            }).toList(),
            onChanged: (item) {
              controller.changeWeeklyBudgetSingleDay(item: item);
            },
            isExpanded: true,

            icon: const Icon(
              Icons.keyboard_arrow_down, color: Color(0xff777C90),
              // color: AppTheme.colorGrey,
            ),
          ),
        );
      },
    );
  }

  Widget dropDownWeekGetBuilder({List<String>? dropDownList}) {
    final controller = Get.put(SelectedDropDownItem());

    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(
              every,
              style: chooseDateStyle,
            ),
            value: controller.weeklyBudgetWeek,
            // value: controller.selectedItem,
            style: dropDownStyle,
            items: dropDownList!.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: dropDownStyle2,
                ),
              );
            }).toList(),
            onChanged: (item) {
              controller.changeWeeklyBudgetSingleWeek(item: item);
            },
            isExpanded: true,

            icon: const Icon(
              Icons.keyboard_arrow_down, color: Color(0xff777C90),
              // color: AppTheme.colorGrey,
            ),
          ),
        );
      },
    );
  }
}
