import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
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
  TextEditingController _expenseName = TextEditingController();
  TextEditingController _amount = TextEditingController();
  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final screenIndexController = Get.put(ScreenIndexController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 4);
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
                    width: maxWidth ? Get.width / 1.4 : null,
                    height: maxWidth ? Get.height * 0.78 : null,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                    child: Column(
                      children: [
                        _headerColumnWidget(constraints: constraints),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Expanded(
                          flex: maxWidth ? 2 : 0,
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            // width: maxWidth ? sequenceSize.width / 1.5 : null,
                            // height: maxWidth ? 300 : null,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                border: maxWidth ? Border.all(color: commonGreyColor) : null,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _nameTableRowWidget(constraints: constraints),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                maxWidth
                                    ? const Divider(
                                        color: commonGreyColor,
                                      )
                                    : Container(),
                                Expanded(
                                  flex: maxWidth ? 2 : 0,
                                  child: SingleChildScrollView(
                                    physics: maxWidth ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
                                    child: Column(
                                      children: [
                                        setUpWeeklyBudgetWidget(constraints: constraints),
                                        _addNewWeeklyBudgetWidget(constraints: constraints),
                                        // _addBudgetButton(constraints: constraints),
                                      ],
                                    ),
                                  ),
                                ),
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

  Widget dropDownDayGetBuilder({List<String>? dropDownList}) {
    final controller = Get.put(SelectedDropDownItem());
    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        return CommonDropDown.commonDropDown(
            hintText: day,
            hintTextStyle: chooseDateStyle,
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            value: controller.weeklyBudgetDay,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeWeeklyBudgetSingleDay(item: item);
              print(item);
            });
      },
    );
  }

  Widget dropDownWeekGetBuilder({List<String>? dropDownList}) {
    final controller = Get.put(SelectedDropDownItem());

    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        return CommonDropDown.commonDropDown(
            hintText: every,
            hintTextStyle: chooseDateStyle,
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            value: controller.weeklyBudgetWeek,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeWeeklyBudgetSingleWeek(item: item);
              print(item);
            });
      },
    );
  }

  _headerColumnWidget({BoxConstraints? constraints}) {
    final maxWidth = constraints!.maxWidth > 1000;
    return Column(
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
                    onPressed: () {
                      screenIndexController.updateIndex(index: 4);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                    )),
            maxWidth
                ? Container()
                : Image.asset(
                    foreCashLogo2,
                    scale: 3,
                  ),
            SizedBox(
              width: context.isTablet ? Get.width * 0.0 : Get.width * 0.1,
            )
          ],
        ),
        SizedBox(
          height: maxWidth ? Get.height * 0.03 : 0.0,
        ),
        maxWidth ? const SizedBox() : commonDivider(),
        SizedBox(
          height: maxWidth ? 0.0 : Get.height * 0.04,
        ),
        maxWidth
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      screenIndexController.updateIndex(index: 4);
                    },
                    child: Text(
                      backButton,
                      style: backButtonStyle,
                    )))
            : SizedBox(),
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
      ],
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
      },
      children: [
        TableRow(children: [
          SizedBox(),
          Padding(
            padding: EdgeInsets.only(left: constraints!.maxWidth > 1000 ? 5 : 0.0),
            child: Text(
              expenseName,
              style: columnNameListStyle,
            ),
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
      ],
    );
  }

  _addNewWeeklyBudgetWidget({BoxConstraints? constraints}) {
    return GetBuilder<VisibilityController>(
      builder: (controller1) {
        return Visibility(
          visible: controller1.visibility,
          replacement: Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.01, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
            child: GestureDetector(
              onTap: () {
                controller1.changeVisibility();
              },
              child: Align(
                alignment: const FractionalOffset(0.015, 0.0),
                child: Text(
                  addWeeklyIncome,
                  style: addWeekIncomeStyle,
                ),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: Get.height * 0.019,
            ),
            child: Column(
              children: [
                Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(0.35),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      children: [
                        SizedBox(height: Get.height * 0.044),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Padding(
                            padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                            child: commonTextFormField(
                                hintText: addExpense,
                                hintStyle: incomeNameStyle,
                                inputAction: TextInputAction.done,
                                inputFormatter: [characterInputFormatter()],
                                contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                textStyle: incomeNameStyle,
                                textEditingController: _expenseName),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                            ),
                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                            // height: Get.height * 0.044,
                            // alignment: Alignment.center,
                            child: dropDownDayGetBuilder(dropDownList: days),
                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                            decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                            // height: Get.height * 0.044,
                            // alignment: Alignment.center,
                            child: dropDownWeekGetBuilder(dropDownList: weeks),
                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                            decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.04),
                            child: commonTextFormField(
                                prefixText: '\$',
                                prefixstyle: incomeNameStyle,
                                inputAction: TextInputAction.done,
                                inputFormatter: [digitInputFormatter()],
                                contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                textStyle: incomeNameStyle,
                                textEditingController: _amount),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.01, left: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.028),
                  child: Row(
                    children: [
                      // SizedBox(
                      //   width: Get.width * 0.01,
                      // ),
                      InkWell(
                        onTap: () {
                          if (_expenseName.text.isNotEmpty && _amount.text.isNotEmpty) {
                            setState(() {
                              WeeklyBudgetModel.weeklyBudgetModel.add(WeeklyBudgetModel(expenseName: _expenseName.text, amount: _amount.text));
                              controller.weeklyBudgetDayDropDownList.add(controller.weeklyBudgetDay as Object);
                              controller.weeklyBudgetWeekDropDownList.add(controller.weeklyBudgetWeek as Object);
                              checkBoxController.weeklyBudgetCheckBoxValueList.add(false);
                            });
                            controller1.changeVisibility();
                          }
                          _expenseName.clear();
                          _amount.clear();

                          // monthlyIncomeEditMode.showEditMode();
                        },
                        child: Text(
                          save,
                          style: greenMontserrat11W500,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.017,
                      ),
                      InkWell(
                        child: Text(
                          cancel,
                          style: redMontserrat11W500,
                        ),
                        onTap: () {
                          controller1.changeVisibility();
                          // monthlyIncomeEditMode.showEditMode();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // _addBudgetButton({BoxConstraints? constraints}) {
  //   return ;
  // }

  _nextButtonWidget({BoxConstraints? constraints}) {
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
    );
  }
}
