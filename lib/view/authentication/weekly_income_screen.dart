import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
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
import 'package:get/get.dart';

class WeeklyIncomeScreen extends StatefulWidget {
  const WeeklyIncomeScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyIncomeScreen> createState() => _WeeklyIncomeScreenState();
}

class _WeeklyIncomeScreenState extends State<WeeklyIncomeScreen> {
  final TextEditingController _incomeName2 = TextEditingController();
  final TextEditingController _amount2 = TextEditingController();
  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());
  final weeklyIncomeController = Get.put(WeeklyIncomeController());
  final checkBoxController = Get.put(CheckBoxController());
  final screenIndexController = Get.put(ScreenIndexController());
  TextEditingController? _incomeName;
  TextEditingController? _amount;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 2);
          return false;
        },
        child: StreamBuilder(
            stream: WeeklyIncomeController.to.weeklyIncomesList.stream,
            builder: (context, snapshot) {
              return LayoutBuilder(
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
                                              // weeklyIncomeWidget(constraints: constraints),
                                              _weeklyincomeRowList(constraints: constraints),
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
              );
            }),
      ),
    );
  }

  Widget dropDownDayGetBuilder({List<String>? dropDownList}) {
    final controller = Get.put(SelectedDropDownItem());
    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        return commonDropDown(
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
        return commonDropDown(
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
                  if (WeeklyIncomeController.to.weeklyIncomesList.length == 1) {
                    print("IF Zero index=====>");
                    //CreateIncomeController.to.monthlyIncomesList.add(MonthlyIncomeModelOld(expenseName: _incomeName2.text, amount: _amount2.text));
                    WeeklyIncomeController.to.weeklyIncomesList[0].amount = _amount!.text;
                    WeeklyIncomeController.to.weeklyIncomesList[0].incomeName = _incomeName!.text;
                    // WeeklyIncomeController.to.weeklyIncomesList[0].dateTime = currentDate;
                    WeeklyIncomeController.to.weeklyIncomesList[0].paidOn = controller.selectedDate;
                    // controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
                    // controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
                    // checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
                  }
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
                                  textEditingController: _incomeName2),
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
                                  textEditingController: _amount2),
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
                            if (_incomeName2.text.isNotEmpty && _amount2.text.isNotEmpty) {
                              // setState(() {
                              WeeklyIncomeController.to.weeklyIncomesList.add(WeeklyIncomeModel(
                                every: controller.selectedSingleWeeklyIncomeWeek,
                                incomeName: _incomeName2.text,
                                amount: _amount2.text,
                                paidOn: controller.selectedSingleWeeklyIncomeDay,
                              ));
                              // WeeklyIncomeController.to.weeklyIncomesList.add(WeeklyIncomeModel(incomeName: _incomeName!.text, amount: _amount!.text));
                              controller.selectDayDropDown.add(controller.selectedSingleWeeklyIncomeDay as Object);
                              controller.selectWeekDropDown.add(controller.selectedSingleWeeklyIncomeWeek as Object);
                              checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
                              // });
                              controller1.changeVisibility();
                            }
                            _amount!.clear();
                            _incomeName!.clear();

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    height: Get.height * 0.055,
                    width: Get.height * 0.25,
                  ),
            SizedBox(
              width: context.isTablet ? Get.width * 0.0 : Get.width * 0.01,
            )
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
      child: commonButton(
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

  _weeklyincomeRowList({BoxConstraints? constraints}) {
    return StreamBuilder(
        stream: WeeklyIncomeController.to.weeklyIncomesList.stream,
        builder: (context, snapshot) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: WeeklyIncomeController.to.weeklyIncomesList.length,
            itemBuilder: (context, index) {
              _incomeName = TextEditingController(text: WeeklyIncomeController.to.weeklyIncomesList[index].incomeName);
              _amount = TextEditingController(text: WeeklyIncomeController.to.weeklyIncomesList[index].amount);
              return Padding(
                padding: EdgeInsets.only(bottom: Get.height * 0.019),
                child: Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  actionExtentRatio: 0.13,
                  enabled: constraints!.maxWidth > 1000 ? false : true,
                  secondaryActions: [
                    deleteImageWidget(onTap: () {
                      WeeklyIncomeController.to.weeklyIncomesList.removeAt(index);
                    }),
                  ],
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
                          constraints.maxWidth < 1000
                              ? Container(
                                  height: Get.height * 0.044,
                                  // width: 8,
                                  margin: EdgeInsets.only(right: Get.width * 0.02),
                                  decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
                                )
                              : SizedBox(
                                  height: Get.height * 0.044,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: GetBuilder<CheckBoxController>(
                                      builder: (controller) {
                                        return Checkbox(
                                          activeColor: cameraBackGroundColor,
                                          checkColor: Colors.white,
                                          value: checkBoxController.weeklyIncomeCheckBoxValueList[index],
                                          onChanged: (value) {
                                            checkBoxController.selectedWeeklyIncomeCheckBox(value: value, index: index);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Padding(
                              padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                              child: commonTextFormField(
                                  hintText: 'Income Name',
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              height: Get.height * 0.044,
                              alignment: Alignment.center,
                              child: GetBuilder<SelectedDropDownItem>(
                                builder: (controller1) {
                                  return commonDropDown(
                                      selectedItemTextStyle: dropDownStyle2,
                                      valueTextStyle: dropDownStyle,
                                      // value: controller.selectDayDropDown[index],
                                      value: WeeklyIncomeController.to.weeklyIncomesList[index].paidOn,
                                      itemList: days,
                                      onChanged: (item) {
                                        WeeklyIncomeController.to.weeklyIncomesList[index].paidOn = item;
                                        controller.changeDay(item: item, index: index);
                                        print(item);
                                      });
                                },
                              ),
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                              decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              height: Get.height * 0.044,
                              alignment: Alignment.center,
                              child: GetBuilder<SelectedDropDownItem>(
                                builder: (controller1) {
                                  return commonDropDown(
                                      selectedItemTextStyle: dropDownStyle2,
                                      valueTextStyle: dropDownStyle,
                                      // value: controller.selectWeekDropDown[index],
                                      value: WeeklyIncomeController.to.weeklyIncomesList[index].every,
                                      itemList: weeks,
                                      onChanged: (item) {
                                        WeeklyIncomeController.to.weeklyIncomesList[index].every = item;
                                        controller.changeWeek(item: item, index: index);
                                        print(item);
                                      });
                                },
                              ),
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                              decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.04),
                              child: commonTextFormField(
                                  hintText: 'Amount',
                                  hintStyle: incomeNameStyle,
                                  prefixText: '\$',
                                  prefixstyle: incomeNameStyle,
                                  inputAction: TextInputAction.done,
                                  inputFormatter: [digitInputFormatter()],
                                  contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  textEditingController: _amount),
                            ),
                          ),
                          // Expanded(
                          //   child: Container(
                          //     // width: sequenceSize.width * 0.14,
                          //     height: Get.height * 0.044, padding: EdgeInsets.only(left: 10),
                          //     alignment: Alignment.centerLeft,
                          //     child: Text(
                          //       '\$${WeeklyIncomeModel.weeklyIncomeList[index].amount}',
                          //       style: incomeNameStyle,
                          //       maxLines: 1,
                          //       overflow: TextOverflow.ellipsis,
                          //     ),
                          //     // child: const TextField(
                          //     //   style: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14),
                          //     //   decoration: InputDecoration(
                          //     //       prefixStyle: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 13),
                          //     //       prefixText: '\$',
                          //     //       contentPadding: EdgeInsets.only(bottom: 7),
                          //     //       border: InputBorder.none),
                          //     // ),
                          //     margin: EdgeInsets.only(right: Get.width * 0.04),
                          //     decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
