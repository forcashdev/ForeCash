import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/visibility_controller.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:fore_cash/view/authentication/widgets/weekly_income_widget.dart';
import 'package:get/get.dart';

class WeeklyIncomeScreen extends StatefulWidget {
  const WeeklyIncomeScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyIncomeScreen> createState() => _WeeklyIncomeScreenState();
}

class _WeeklyIncomeScreenState extends State<WeeklyIncomeScreen> {
  final TextEditingController _incomeName = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final screenIndexController = Get.put(ScreenIndexController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 2);
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
                    decoration: BoxDecoration(color: maxWidth ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
                    width: maxWidth ? Get.width / 1.4 : null,
                    height: maxWidth ? Get.height * 0.78 : null,
                    child: Column(
                      children: [
                        _headerColumn(constraints: constraints),
                        Expanded(
                          flex: maxWidth ? 2 : 0,
                          child: Container(
                            // height: constraints.maxWidth > 1000 ? double.infinity : null,
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(border: maxWidth ? Border.all(color: commonGreyColor.withOpacity(0.5)) : null, borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: maxWidth ? Get.height * 0.015 : 0.0,
                                ),
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
                                  height: maxWidth ? Get.height * 0.005 : Get.height * 0.005,
                                ),
                                Expanded(
                                  flex: maxWidth ? 2 : 0,
                                  child: SingleChildScrollView(
                                    physics: maxWidth ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        weeklyIncomeWidget(constraints: constraints),
                                        _addNewWeeklyIncomeWidget(constraints: constraints),
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
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            hintText: day,
            hintTextStyle: chooseDateStyle,
            value: controller.selectedSingleWeeklyIncomeDay,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeSingleDay(item: item);
              print(item);
            });
        //   DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     hint: Text(
        //       day,
        //       style: chooseDateStyle,
        //     ),
        //     value: controller.selectedSingleDay,
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
        //       controller.changeSingleDay(item: item);
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
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            hintText: every,
            hintTextStyle: chooseDateStyle,
            value: controller.selectedSingleWeeklyIncomeWeek,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeSingleWeek(item: item);
              print(item);
            });
        //   DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     hint: Text(
        //       every,
        //       style: chooseDateStyle,
        //     ),
        //     value: controller.selectedSingleWeek,
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
        //       controller.changeSingleWeek(item: item);
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
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
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
      ],
    );
  }

  _addNewWeeklyIncomeWidget({BoxConstraints? constraints}) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: GetBuilder<VisibilityController>(
        builder: (controller1) {
          return Visibility(
            visible: controller1.visibility,
            replacement: Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.03, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
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
                                  hintText: addIncome,
                                  hintStyle: incomeNameStyle,
                                  inputAction: TextInputAction.done,
                                  inputFormatter: [characterInputFormatter()],
                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  textEditingController: _incomeName),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 6,
                              ),
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              // height: Get.height * 0.044,
                              alignment: Alignment.center,
                              child: dropDownDayGetBuilder(dropDownList: days),
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                              decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.only(left: 6),
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              // height: Get.height * 0.044,
                              alignment: Alignment.center,
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
                                  // hintText: '\$',
                                  // hintStyle: incomeNameStyle,
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
                    padding: EdgeInsets.only(top: Get.height * 0.01, left: constraints.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.018),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        InkWell(
                          onTap: () {
                            if (_incomeName.text.isNotEmpty && _amount.text.isNotEmpty) {
                              setState(() {
                                WeeklyIncomeModel.weeklyIncomeList.add(WeeklyIncomeModel(expenseName: _incomeName.text, amount: _amount.text));
                                controller.selectDayDropDown.add(controller.selectedSingleWeeklyIncomeDay as Object);
                                controller.selectWeekDropDown.add(controller.selectedSingleWeeklyIncomeWeek as Object);
                                checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
                              });
                              controller1.changeVisibility();
                            }
                            _amount.clear();
                            _incomeName.clear();

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
      ),
    );
  }

  _headerColumn({BoxConstraints? constraints}) {
    final maxWidth = constraints!.maxWidth > 1000;
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.03,
        ),
        Row(
          children: [
            maxWidth
                ? const SizedBox()
                : IconButton(
                    splashRadius: 0.1,
                    onPressed: () {
                      screenIndexController.updateIndex(index: 2);
                      // Navigator.pop(context);
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
            // SizedBox(
            //   width: context.isTablet ? Get.width * 0.0 : Get.width * 0.1,
            // )
          ],
        ),
        SizedBox(
          height: maxWidth ? Get.height * 0.03 : 0.0,
        ),
        maxWidth ? Container() : commonDivider(),
        SizedBox(
          height: Get.height * 0.04,
        ),
        maxWidth
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      screenIndexController.updateIndex(index: 2);
                      // Navigator.pop(context);
                    },
                    child: Text(
                      backButton,
                      style: backButtonStyle,
                    )))
            : const SizedBox(),
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
              style: textSpanStyle1,
              children: [TextSpan(text: weeklyIncomeSubTitle2, style: textSpanStyle2)],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
      ],
    );
  }

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
          screenIndex = 4;
          print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
          screenIndexController.updateIndex(index: 4);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => MonthlyExpensesScreen(),
          //     ));

          // Get.to(MonthlyExpensesScreen());
        },
      ),
    );
  }
}
