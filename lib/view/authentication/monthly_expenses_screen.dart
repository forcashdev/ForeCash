import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/visibility_controller.dart';
import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:fore_cash/view/authentication/widgets/monthly_expenses_widget.dart';
import 'package:get/get.dart';

class MonthlyExpensesScreen extends StatefulWidget {
  const MonthlyExpensesScreen({Key? key}) : super(key: key);

  @override
  _MonthlyExpensesScreenState createState() => _MonthlyExpensesScreenState();
}

class _MonthlyExpensesScreenState extends State<MonthlyExpensesScreen> {
  TextEditingController _monthlyExpenseName = TextEditingController();
  TextEditingController _monthlyAmount = TextEditingController();
  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final screenIndexController = Get.put(ScreenIndexController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            body: Align(
              alignment: maxWidth ? Alignment.center : Alignment.topCenter,
              child: SingleChildScrollView(
                physics: maxWidth ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                  decoration: BoxDecoration(color: maxWidth ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
                  width: maxWidth ? Get.width / 1.4 : null,
                  height: maxWidth ? Get.height * 0.81 : null,
                  child: Column(
                    children: [
                      _headerWidget(constraints: constraints),
                      Expanded(
                        flex: maxWidth ? 2 : 0,
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          // width: maxWidth ? Get.width / 1.5 : null,
                          // height: maxWidth ? 300 : null,

                          decoration: BoxDecoration(
                              // color: Colors.red,
                              border: maxWidth ? Border.all(color: commonGreyColor.withOpacity(0.5)) : null,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _nameTableRowWidget(),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              maxWidth
                                  ? Divider(
                                      color: commonGreyColor.withOpacity(0.5),
                                    )
                                  : Container(),
                              SizedBox(
                                height: Get.height * 0.020,
                              ),
                              Expanded(
                                  flex: maxWidth ? 2 : 0,
                                  child: SingleChildScrollView(
                                    physics: maxWidth ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
                                    child: Column(
                                      children: [
                                        MonthlyExpensesWidget(
                                          constraints: constraints,
                                        ),
                                        _addNewMonthlyExpenseWidget(constraints: constraints),
                                        _addMonthlyExpenseButton(),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: Get.height * 0.03, left: maxWidth ? Get.width * 0.15 : Get.width * 0.04, right: maxWidth ? Get.width * 0.15 : Get.width * 0.04, top: Get.width * 0.035),
                        child: CommonMaterialButton.commonButton(
                          height: 50,
                          text: next,
                          onPress: () {
                            screenIndex = 5;
                            print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
                            screenIndexController.updateIndex(index: 5);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => SetupWeeklyBudgetScreen(),
                            //     ));

                            // Get.to(SetupWeeklyBudgetScreen());
                          },
                        ),
                      )
                    ],
                  ),
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
        return CommonDropDown.commonDropDown(
            hintTextStyle: chooseDateStyle,
            hintText: chooseDate,
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            value: controller.selectedSingleMonthlyExpenseDate,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeSingleDate(item: item);
              print(item);
            });
        //   DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     hint: Text(
        //       chooseDate,
        //       style: chooseDateStyle,
        //     ),
        //     value: controller.selectedSingleDate,
        //     // value: controller.selectedItem,
        //     style: dropDownStyle,
        //     items: dropDownList!.map((String items) {
        //       return DropdownMenuItem(
        //         value: items,
        //         child: Text(
        //           items,
        //           style: dropDownStyle2,
        //         ),
        //       );
        //     }).toList(),
        //     onChanged: (item) {
        //       controller.changeSingleDate(item: item);
        //     },
        //     isExpanded: true,
        //
        //     icon: const Icon(
        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
        //       // color: AppTheme.colorGrey,
        //     ),
        //   ),
        // );
      },
    );
  }

  Widget dropDownWeekGetBuilder({List<String>? dropDownList}) {
    final controller = Get.put(SelectedDropDownItem());

    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        // return commonDropDown(itemList: dropDownList, value: controller.selectedSingleWeek);
        return CommonDropDown.commonDropDown(
            hintTextStyle: chooseDateStyle,
            hintText: chooseMonth,
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            value: controller.selectedSingleMonthlyExpenseMonth,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeSingleMonth(item: item);
              print(item);
            });
        //   DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     hint: Text(
        //       chooseMonth,
        //       style: chooseDateStyle,
        //     ),
        //     value: controller.selectedSingleMonth,
        //     // value: controller.selectedItem,
        //     style: dropDownStyle,
        //     items: dropDownList!.map((String items) {
        //       return DropdownMenuItem(
        //         value: items,
        //         child: Text(
        //           items,
        //           style: dropDownStyle2,
        //         ),
        //       );
        //     }).toList(),
        //     onChanged: (item) {
        //       controller.changeSingleMonth(item: item);
        //     },
        //     isExpanded: true,
        //
        //     icon: const Icon(
        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
        //       // color: AppTheme.colorGrey,
        //     ),
        //   ),
        // );
      },
    );
  }

  _nameTableRowWidget() {
    return Table(
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
            SizedBox(),
            Text(
              expenseName,
              style: columnNameListStyle,
            ),
            Text(
              dueOn,
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
          ],
        ),
      ],
    );
  }

  _headerWidget({BoxConstraints? constraints}) {
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
                ? SizedBox()
                : IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
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
        maxWidth
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      backButton,
                      style: backButtonStyle,
                    )))
            : SizedBox(),
        Text(
          selectMonthlyExpenses,
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
              text: monthlyExpenseTitle1,
              style: textSpanStyle1,
              children: [TextSpan(text: monthlyExpenseTitle2, style: textSpanStyle2)],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
      ],
    );
  }

  _addNewMonthlyExpenseWidget({BoxConstraints? constraints}) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: GetBuilder<VisibilityController>(
        builder: (controller1) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: Get.height * 0.019,
            ),
            child: Table(
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
                    SizedBox(),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: constraints!.maxWidth < 1000 ? Get.width * 0.29 : Get.width * 0.15,
                      height: Get.height * 0.044,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                        right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02,
                      ),
                      child: TextField(
                        controller: _monthlyExpenseName,
                        style: textFieldStyle,
                        decoration: InputDecoration(hintStyle: expenseNameStyle2, hintText: expenseName, contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                      ),
                      decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 6,
                      ),
                      width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                      height: Get.height * 0.044,
                      alignment: Alignment.center,
                      child: dropDownDayGetBuilder(dropDownList: dateList),
                      margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                      decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 6),
                      width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                      height: Get.height * 0.044,
                      alignment: Alignment.center,
                      child: dropDownWeekGetBuilder(dropDownList: months),
                      margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                      decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      // width: sequenceSize.width * 0.14,
                      height: Get.height * 0.044,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 6),
                      child: TextField(
                        controller: _monthlyAmount,
                        style: textFieldStyle,
                        decoration: const InputDecoration(prefixStyle: prefixTextStyle, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                      ),
                      margin: EdgeInsets.only(right: Get.width * 0.04),
                      decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _addMonthlyExpenseButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.01),
      child: GestureDetector(
        onTap: () {
          setState(() {
            MonthlyExpensesModel.monthlyExpensesList.add(MonthlyExpensesModel(expenseName: _monthlyExpenseName.text, amount: _monthlyAmount.text));
            controller.selectedMonthlyExpenseDate.add(controller.selectedSingleMonthlyExpenseDate as Object);
            controller.selectedMonthlyExpenseMonth.add(controller.selectedSingleMonthlyExpenseMonth as Object);
            checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
          });
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
    );
  }
}
