import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/visibility_controller.dart';
import 'package:fore_cash/model/income_request_model.dart';
import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MonthlyExpensesScreen extends StatefulWidget {
  const MonthlyExpensesScreen({Key? key}) : super(key: key);

  @override
  _MonthlyExpensesScreenState createState() => _MonthlyExpensesScreenState();
}

class _MonthlyExpensesScreenState extends State<MonthlyExpensesScreen> {
  final TextEditingController _expenseName2 = TextEditingController();
  final TextEditingController _expenseAmount2 = TextEditingController();
  TextEditingController? _monthlyExpenseName;
  TextEditingController? _monthlyAmount;
  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final monthlyExpenseListController = Get.put(MonthlyExpenseListController());
  final screenIndexController = Get.put(ScreenIndexController());
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 3);
          return false;
        },
        child: StreamBuilder(
            stream: MonthlyExpenseListController.to.monthlyExpenseList?.stream,
            builder: (context, snapshot) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth > 1000;
                  return Scaffold(
                    backgroundColor: constraints.maxWidth > 1000 ? backGroundColor : Colors.white,
                    body: Align(
                      alignment: maxWidth ? Alignment.center : Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                        decoration: BoxDecoration(color: maxWidth ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
                        width: maxWidth ? Get.width / 1.4 : null,
                        height: maxWidth ? Get.height * 0.78 : null,
                        child: Column(
                          children: [
                            _headerWidget(constraints: constraints),
                            Expanded(
                              flex: maxWidth ? 2 : 2,
                              child: Container(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                                    // SizedBox(
                                    //   height: Get.height * 0.020,
                                    // ),
                                    Expanded(
                                        flex: maxWidth ? 2 : 2,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              monthlyExpenseRowWidget(
                                                constraints: constraints,
                                              ),
                                              _addNewMonthlyExpenseWidget(constraints: constraints),
                                              // _addMonthlyExpenseButton(constraints: constraints),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(visible: maxWidth ? true : false, child: _nextButtonWidget(constraints: constraints))
                          ],
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
        return commonDropDown(
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
        5: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            const SizedBox(),
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
              startDate,
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
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      screenIndexController.updateIndex(index: 3);
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
        maxWidth ? const SizedBox() : commonDivider(),
        SizedBox(
          height: Get.height * 0.04,
        ),
        maxWidth
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      screenIndexController.updateIndex(index: 3);
                    },
                    child: Text(
                      backButton,
                      style: backButtonStyle,
                    )))
            : const SizedBox(),
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

  monthlyExpenseRowWidget({BoxConstraints? constraints}) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: MonthlyExpenseListController.to.monthlyExpenseList?.length,
      itemBuilder: (context, index) {
        _monthlyExpenseName = TextEditingController(text: MonthlyExpenseListController.to.monthlyExpenseList?[index].name);
        _monthlyAmount = TextEditingController(text: MonthlyExpenseListController.to.monthlyExpenseList?[index].amount.toString());
        print('Check bob leangth=> ${checkBoxController.monthlyExpenseCheckBoxValueList.length}');
        return Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.019),
          child: Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actionExtentRatio: 0.13,
            secondaryActions: [
              deleteImageWidget(onTap: () {
                MonthlyExpenseListController.to.monthlyExpenseList?.removeAt(index);
              }),
            ],
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(0.35),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(2),
                5: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  children: [
                    constraints!.maxWidth < 1000
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
                                    value: checkBoxController.monthlyExpenseCheckBoxValueList[index],
                                    //value: checkBoxController.monthlyExpenseCheckBoxValueList[index] ?? false,
                                    onChanged: (value) {
                                      checkBoxController.selectedMonthlyExpenseCheckBox(value: value, index: index);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Padding(
                          padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                          child: commonTextFormField(
                              inputAction: TextInputAction.next,
                              // maxLine: 2,
                              inputFormatter: [characterInputFormatter()],
                              //contentPadding: const EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 14.0),
                              contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                              textStyle: incomeNameStyle,
                              textEditingController: _monthlyExpenseName)),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        // width: widget.constraints!.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                        // height: Get.height * 0.044,

                        child: commonDropDown(
                            selectedItemTextStyle: dropDownStyle2,
                            valueTextStyle: dropDownStyle,
                            // value: controller.selectedMonthlyExpenseDate[index],
                            value: '${MonthlyExpenseListController.to.monthlyExpenseList?[index].paidOn}th',
                            itemList: dateList,
                            onChanged: (item) {
                              MonthlyExpenseListController.to.monthlyExpenseList?[index].paidOn = int.parse(item.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', ''));
                              MonthlyExpenseListController.to.monthlyExpenseList?.refresh();
                              // controller.changeMonthlyExpenseDate(item: item, index: index);
                              print(item);
                            }),
                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                        decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        // width: widget.constraints!.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                        // height: Get.height * 0.044,

                        child: commonDropDown(
                            selectedItemTextStyle: dropDownStyle2,
                            valueTextStyle: dropDownStyle,
                            value: '${MonthlyExpenseListController.to.monthlyExpenseList?[index].every} mon',
                            // value: controller.selectedMonthlyExpenseMonth[index],
                            itemList: months,
                            onChanged: (item) {
                              MonthlyExpenseListController.to.monthlyExpenseList?[index].every = int.parse(item.replaceAll('mon', '').replaceAll(' ', ''));
                              MonthlyExpenseListController.to.monthlyExpenseList?.refresh();
                              // controller.changeMonthlyExpenseMonth(item: item, index: index);
                              print(item);
                            }),
                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                        decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: GestureDetector(
                          onTap: () {
                            _selectDate(context: context, index: index);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${MonthlyExpenseListController.to.monthlyExpenseList?[index].date}',
                              // '${DateFormat('yyyy-MM-dd').format(currentDate)}',
                              style: dateStyle,
                              maxLines: 1,
                            ),
                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                            decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                          ),
                        )),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Padding(
                        padding: EdgeInsets.only(right: Get.width * 0.02),
                        child: commonTextFormField(
                            prefixText: '\$',
                            prefixstyle: incomeNameStyle,
                            keyboardType: TextInputType.phone,
                            inputAction: TextInputAction.done,
                            inputFormatter: [digitInputFormatter()],
                            contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                            textStyle: incomeNameStyle,
                            textEditingController: _monthlyAmount),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate({BuildContext? context, int? index}) async {
    final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
      print('>>>>>>>>>>>>>>>>>$currentDate');
      // CreateIncomeController.to.IncomesList[index!].dateTime = currentDate;
      MonthlyExpenseListController.to.monthlyExpenseList?[index!].date = currentDate.toString();
      MonthlyExpenseListController.to.monthlyExpenseList?.refresh();
    }
  }

  _addNewMonthlyExpenseWidget({BoxConstraints? constraints}) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: GetBuilder<VisibilityController>(
        builder: (controller1) {
          return Visibility(
            visible: controller1.visibility,
            replacement: Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.01, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
              child: GestureDetector(
                onTap: () {
                  if (MonthlyExpenseListController.to.monthlyExpenseList?.length == 1) {
                    MonthlyExpenseListController.to.monthlyExpenseList?[0].amount = int.parse(_monthlyAmount!.text.toString());
                    MonthlyExpenseListController.to.monthlyExpenseList?[0].name = _monthlyExpenseName!.text;
                    MonthlyExpenseListController.to.monthlyExpenseList?[0].incomeOutgoing = 2;
                    MonthlyExpenseListController.to.monthlyExpenseList?[0].weekMonth = 2;
                    MonthlyExpenseListController.to.monthlyExpenseList?[0].date = DateTime.now().toString();

                    controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
                    controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
                    checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
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
                      5: FlexColumnWidth(2),
                    },
                    children: [
                      TableRow(
                        children: [
                          SizedBox(height: Get.height * 0.044),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Padding(
                              padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                              child: commonTextFormField(
                                  hintText: addExpense,
                                  hintStyle: incomeNameStyle,
                                  inputAction: TextInputAction.next,
                                  inputFormatter: [characterInputFormatter()],
                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  textEditingController: _expenseName2),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              // height: Get.height * 0.044,
                              // alignment: Alignment.center,
                              child: dropDownDayGetBuilder(dropDownList: dateList),
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                              decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              // height: Get.height * 0.044,
                              // alignment: Alignment.center,
                              child: dropDownWeekGetBuilder(dropDownList: months),
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                              decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          TableCell(
                              verticalAlignment: TableCellVerticalAlignment.fill,
                              child: GestureDetector(
                                onTap: () {
                                  _selectDate(context: context);
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${DateFormat('yyyy-MM-dd').format(currentDate)}',
                                    style: dateStyle,
                                    maxLines: 1,
                                  ),
                                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                                ),
                              )),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02),
                              child: commonTextFormField(
                                  prefixText: '\$',
                                  keyboardType: TextInputType.phone,
                                  prefixstyle: incomeNameStyle,
                                  inputAction: TextInputAction.done,
                                  inputFormatter: [digitInputFormatter()],
                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  textEditingController: _expenseAmount2),
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
                            // setState(() {
                            //   MonthlyExpensesModel.monthlyExpensesListOld.add(MonthlyExpensesModel(expenseName: _monthlyExpenseName.text, amount: _monthlyAmount.text));
                            //   controller.selectedMonthlyExpenseDate.add(controller.selectedSingleMonthlyExpenseDate as Object);
                            //   controller.selectedMonthlyExpenseMonth.add(controller.selectedSingleMonthlyExpenseMonth as Object);
                            //   checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
                            //   controller1.changeVisibility();
                            // });
                            // _monthlyAmount.clear();
                            // _monthlyExpenseName.clear();

                            MonthlyExpenseListController.to.monthlyExpenseList?.add(Income(
                                name: _expenseName2.text,
                                amount: int.parse(_expenseAmount2.text),
                                incomeOutgoing: 2,
                                weekMonth: 2,
                                every: int.parse(controller.selectedSingleMonthlyExpenseMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                paidOn: int.parse(controller.selectedSingleMonthlyExpenseDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                date: DateFormat('yyyy-MM-dd').format(currentDate)));
                            checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
                            // print('00000${checkBoxController.monthlyExpenseCheckBoxValueList.indexWhere((element) => element)}');
                            // checkBoxController.monthlyExpenseCheckBoxValueList.forEach((element) {
                            //   print(element);
                            // });
                            controller1.changeVisibility();
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
                        )
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

  // _addMonthlyExpenseButton({BoxConstraints? constraints}) {
  //   return ;
  // }

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
          CreateIncomeController.to.createIncome(screenIndex: 5, parameter: {'income': MonthlyExpenseListController.to.monthlyExpenseList});
          // screenIndex = 5;
          // print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
          // screenIndexController.updateIndex(index: 5);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => SetupWeeklyBudgetScreen(),
          //     ));

          // Get.to(SetupWeeklyBudgetScreen());
        },
      ),
    );
  }
}
