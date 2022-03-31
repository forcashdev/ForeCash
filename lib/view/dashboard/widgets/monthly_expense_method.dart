import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/add_monthly_expense_showtext_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/delete_income_expense_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/monthly_expense_edit_mode_controller.dart';
import 'package:fore_cash/controller/monthly_expense_expansiondata_visibility_controller.dart';
import 'package:fore_cash/controller/on_monthly_expense_expansion_change_controller.dart';
import 'package:fore_cash/controller/selected_dropdown_controller.dart';
import 'package:fore_cash/controller/total_income_expense_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/temp_income_expense_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
monthlyExpenseData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
  // final dropDownController = Get.put(SelectedDropDownItem());
  TextEditingController _monthlyExpenseNameController = TextEditingController();
  TextEditingController _monthlyExpenseAmountController = TextEditingController();
  final showMonthlyExpenseSaveTextController = Get.put(ShowMonthlyExpenseSaveDataTextController());
  final monthlyExpenseDataVisibilityController = Get.put(MonthlyExpenseDataVisibilityController());
  Rx<DateTime> currentDate = DateTime.now().obs;
  return Expanded(
    flex: boolValue == true
        ? 2
        : constraints!.maxWidth > 1000
            ? 2
            : 4,
    child: StreamBuilder(
        stream: GetIncomeController.to.monthlyExpenseList?.stream,
        builder: (context, snapshot) {
          return GetBuilder<MonthlyExpenseEditModeController>(
            builder: (monthlyExpenseEditModeController) {
              return Stack(
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                        left: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? 5 : 0.0),
                    padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == false ? 0.0 : Get.width * 0.00),
                    decoration: BoxDecoration(
                        border: Border(
                            right: monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == true &&
                                    constraints!.maxWidth < 1000 &&
                                    monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                ? BorderSide.none
                                : const BorderSide(color: colorEDEDED))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          constraints!.maxWidth > 1000 ||
                                  monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == true && monthlyExpenseDataVisibilityController.monthlyExpenseListVisibility == false
                              ? Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? 3 : 2.95),
                                    1: const FlexColumnWidth(2),
                                    2: const FlexColumnWidth(2),
                                    3: const FlexColumnWidth(2),
                                    4: const FlexColumnWidth(2),
                                    5: const FlexColumnWidth(1.1),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth > 1000
                                                ? 0.0
                                                : monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth < 1000
                                                    ? 5.0
                                                    : monthlyExpenseEditModeController.monthlyExpenseEditMode == false && constraints.maxWidth > 1000
                                                        ? 0.0
                                                        : 9.0),
                                        child: Text(
                                          expenseName,
                                          style: columnNameListStyle,
                                        ),
                                      ),
                                      Text(
                                        dueOn,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        every,
                                        style: columnNameListStyle,
                                      ),

                                      // if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                                      Text(
                                        effectiveDate,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        amount,
                                        style: columnNameListStyle,
                                      ),
                                      if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                                        Text(
                                          action,
                                          style: columnNameListStyle,
                                        )
                                    ]),
                                  ],
                                )
                              : Column(),
                          StreamBuilder(
                              stream: GetIncomeController.to.tempMonthlyExpenseList?.stream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                      ? GetIncomeController.to.tempMonthlyExpenseList?.length
                                      : GetIncomeController.to.monthlyExpenseList?.length,
                                  itemBuilder: (context, index) {
                                    RxList<RxBool> validateOrNotMonthlyExpenseName = List.generate(GetIncomeController.to.tempMonthlyExpenseList!.length, (index) => false.obs).obs;
                                    RxList<RxBool> validateOrNotMonthlyExpenseAmount = List.generate(GetIncomeController.to.tempMonthlyExpenseList!.length, (index) => false.obs).obs;
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: Get.height * 0.015, top: index == 0 ? Get.height * 0.01 : 0.0),
                                      child: SwipeActionCell(
                                        backgroundColor: Colors.transparent,
                                        isDraggable: constraints.maxWidth > 1000
                                            ? false
                                            : monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                ? true
                                                : false,
                                        trailingActions: [
                                          SwipeAction(
                                            backgroundRadius: 5,
                                            widthSpace: 50,
                                            color: colorsFFEBEB,
                                            icon: Image.asset(
                                              deleteImage,
                                              height: Get.height * 0.025,
                                            ),
                                            onTap: (p0) {
                                              showCommonDialog(
                                                  context: context,
                                                  headerTitle: sureToDelete,
                                                  descriptionTitle: sureToDeleteSubTitle,
                                                  buttonColor: Colors.white,
                                                  saveButtonBorderColor: colorsEE4242,
                                                  noButtonTextStyle: noButtonTextStyle,
                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                  noButtonColor: Colors.black,
                                                  onPressYes: () {
                                                    DeleteIncomeExpenseController.to.deleteMonthlyExpenseList.add(GetIncomeController.to.tempMonthlyExpenseList![index].id!);
                                                    GetIncomeController.to.tempMonthlyExpenseList?.removeAt(index);
                                                    GetIncomeController.to.tempMonthlyExpenseList?.refresh();
                                                    Get.back();
                                                  },
                                                  onPressNo: () {
                                                    Get.back();
                                                  });
                                            },
                                          ),
                                        ],
                                        key: UniqueKey(),
                                        child: boolValue == true && constraints.maxWidth < 1000
                                            ? SizedBox(
                                                height: Get.height * 0.017,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 10.0),
                                                  child: Text(
                                                    GetIncomeController.to.monthlyExpenseList?[index].name ?? '',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: blackMontserrat10W500,
                                                    // textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              )
                                            : Table(
                                                columnWidths: const <int, TableColumnWidth>{
                                                  0: FlexColumnWidth(3),
                                                  1: FlexColumnWidth(2),
                                                  2: FlexColumnWidth(2),
                                                  3: FlexColumnWidth(2),
                                                  4: FlexColumnWidth(2),
                                                  5: FlexColumnWidth(1.1),
                                                },
                                                children: [
                                                  TableRow(
                                                    children: [
                                                      StreamBuilder(
                                                          stream: validateOrNotMonthlyExpenseName[index].stream,
                                                          builder: (context, snapshot) {
                                                            return SizedBox(
                                                              height: validateOrNotMonthlyExpenseName[index].value
                                                                  ? Get.height * 0.07
                                                                  : monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                                      ? Get.height * 0.044
                                                                      : Get.height * 0.02,
                                                              // height: monthlyExpenseEditModeController.monthlyExpenseEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    right: Get.width * 0.02,
                                                                    left: monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth < 1000
                                                                        ? 5
                                                                        : constraints.maxWidth < 1000
                                                                            ? 10.0
                                                                            : 0.0),
                                                                child: monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                                                    ? Text(
                                                                        GetIncomeController.to.monthlyExpenseList?[index].name ?? "",
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: blackMontserrat10W500,
                                                                      )
                                                                    : commonTextFormField(
                                                                        keyboardType: TextInputType.text,
                                                                        inputAction: TextInputAction.next,
                                                                        inputFormatter: [characterInputFormatter()],
                                                                        contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                        textStyle: blackMontserrat10W500,
                                                                        textEditingController: TextEditingController(text: GetIncomeController.to.tempMonthlyExpenseList?[index].name ?? ''),
                                                                        onChangedFunction: (value) {
                                                                          GetIncomeController.to.tempMonthlyExpenseList?[index].name = value;
                                                                          // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                        },
                                                                        validationFunction: (value) {
                                                                          if (GetIncomeController.to.tempMonthlyExpenseList![index].name!.isEmpty) {
                                                                            validateOrNotMonthlyExpenseName[index].value = value.isEmpty;
                                                                            validateOrNotMonthlyExpenseName.refresh();
                                                                            // validateOrNot=true.obs;
                                                                            // validateOrNot.refresh();
                                                                            return expenseName;
                                                                          }
                                                                        },
                                                                      ),
                                                              ),
                                                            );
                                                          }),
                                                      Container(
                                                        height: monthlyExpenseEditModeController.monthlyExpenseEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                        padding: EdgeInsets.symmetric(horizontal: monthlyExpenseEditModeController.monthlyExpenseEditMode ? 5 : 0.0),
                                                        alignment: Alignment.centerLeft,
                                                        child: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                                            ? GetBuilder<SelectedDropDownItem>(
                                                                builder: (controller1) {
                                                                  return commonDropDown(
                                                                      valueTextStyle: blackMontserrat10W500,
                                                                      selectedItemTextStyle: blackMontserrat10W500,
                                                                      value: '${GetIncomeController.to.tempMonthlyExpenseList?[index].paidOn ?? 1}th'
                                                                          .replaceAllMapped('1th', (match) => '1st')
                                                                          .replaceAllMapped('2th', (match) => '2nd')
                                                                          .replaceAllMapped('3th', (match) => '3rd')
                                                                          .replaceAllMapped('11st', (match) => '11th')
                                                                          .replaceAllMapped('12nd', (match) => '12th')
                                                                          .replaceAllMapped('13rd', (match) => '13th'),
                                                                      itemList: dateList,
                                                                      onChanged: (item) {
                                                                        // controller1.changeDate(item: item, index: index);
                                                                        GetIncomeController.to.tempMonthlyExpenseList?[index].paidOn =
                                                                            int.parse(item.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', ''));
                                                                        GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                      });
                                                                },
                                                              )
                                                            : Text(
                                                                '${GetIncomeController.to.monthlyExpenseList?[index].paidOn ?? 1}th'
                                                                    .replaceAllMapped('1th', (match) => '1st')
                                                                    .replaceAllMapped('2th', (match) => '2nd')
                                                                    .replaceAllMapped('3th', (match) => '3rd')
                                                                    .replaceAllMapped('11st', (match) => '11th')
                                                                    .replaceAllMapped('12nd', (match) => '12th')
                                                                    .replaceAllMapped('13rd', (match) => '13th'),
                                                                style: blackMontserrat10W500,
                                                              ),
                                                        margin: EdgeInsets.only(right: Get.width * 0.02),
                                                        decoration: BoxDecoration(
                                                            color: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? colorEDF2F6 : Colors.transparent,
                                                            borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                      Container(
                                                        height: monthlyExpenseEditModeController.monthlyExpenseEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                        padding: EdgeInsets.symmetric(horizontal: monthlyExpenseEditModeController.monthlyExpenseEditMode ? 5 : 0.0),
                                                        alignment: Alignment.centerLeft,
                                                        child: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                                            ? GetBuilder<SelectedDropDownItem>(
                                                                builder: (controller1) {
                                                                  return commonDropDown(
                                                                      selectedItemTextStyle: blackMontserrat10W500,
                                                                      valueTextStyle: blackMontserrat10W500,
                                                                      value: '${GetIncomeController.to.tempMonthlyExpenseList?[index].every ?? 1} mon',
                                                                      // value: controller1.selectedMonthlyExpenseMonth[index],
                                                                      itemList: months,
                                                                      onChanged: (item) {
                                                                        GetIncomeController.to.tempMonthlyExpenseList?[index].every = int.parse(item.replaceAll('mon', '').replaceAll(' ', ''));
                                                                        GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                        // controller1.changeItem(item: item, index: index);
                                                                      });
                                                                },
                                                              )
                                                            : Text(
                                                                '${GetIncomeController.to.monthlyExpenseList?[index].every ?? 1} mon',
                                                                style: blackMontserrat10W500,
                                                              ),
                                                        margin: EdgeInsets.only(right: Get.width * 0.02),
                                                        decoration: BoxDecoration(
                                                            color: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? colorEDF2F6 : Colors.transparent,
                                                            borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // _selectDate(context: context, index: index);
                                                        },
                                                        child: Container(
                                                            height: monthlyExpenseEditModeController.monthlyExpenseEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                            margin: EdgeInsets.only(right: Get.width * 0.02),
                                                            decoration: BoxDecoration(
                                                                color: monthlyExpenseEditModeController.monthlyExpenseEditMode ? colorEDF2F6 : Colors.transparent,
                                                                borderRadius: BorderRadius.circular(5)),
                                                            // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth < 1000
                                                                    ? Get.width * 0.015
                                                                    : monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth > 1000
                                                                        ? Get.width * 0.005
                                                                        : 0.0),
                                                            // width: Get.width * 0.080,
                                                            // height: Get.height * 0.04,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    DateFormat('dd-MM-yyyy').format(DateTime.parse(monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                                        ? GetIncomeController.to.tempMonthlyExpenseList![index].date.toString()
                                                                        : GetIncomeController.to.monthlyExpenseList![index].date.toString())),
                                                                    // tempMonthlyIncomeList![index].date.toString().replaceAll('T10:16:38.185Z', ''),
                                                                    // '${GetIncomeController.to.monthlyIncomeList?[index].date}',
                                                                    style: blackMontserrat10W500,
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                ),
                                                                constraints.maxWidth > 1000 && monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                                                    ? Image.asset(
                                                                        calendarImage2,
                                                                        height: Get.height * 0.02,
                                                                        width: Get.width * 0.010,
                                                                      )
                                                                    : Container(),
                                                              ],
                                                            )),
                                                      ),
                                                      StreamBuilder(
                                                          stream: validateOrNotMonthlyExpenseAmount[index].stream,
                                                          builder: (context, snapshot) {
                                                            return SizedBox(
                                                              height: validateOrNotMonthlyExpenseAmount[index].value
                                                                  ? Get.height * 0.07
                                                                  : monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                                      ? Get.height * 0.044
                                                                      : Get.height * 0.02,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    right: constraints.maxWidth > 1000
                                                                        ? Get.width * 0.01
                                                                        : constraints.maxWidth < 1000 && monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                                                            ? Get.width * 0.01
                                                                            : Get.width * 0.0),
                                                                child: monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                                                    ? Text(
                                                                        '${GetIncomeController.to.monthlyExpenseList?[index].amount ?? 1}',
                                                                        style: blackMontserrat10W500,
                                                                        maxLines: 1,
                                                                      )
                                                                    : commonTextFormField(
                                                                        textEditingController:
                                                                            TextEditingController(text: GetIncomeController.to.tempMonthlyExpenseList?[index].amount.toString() ?? ''),
                                                                        prefixText: '\$',
                                                                        keyboardType: TextInputType.phone,
                                                                        prefixstyle: blackMontserrat10W500,
                                                                        inputAction: TextInputAction.done,
                                                                        onChangedFunction: (value) {
                                                                          GetIncomeController.to.tempMonthlyExpenseList?[index].amount = int.parse(value);
                                                                        },
                                                                        inputFormatter: [digitInputFormatter()],
                                                                        contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                        textStyle: blackMontserrat10W500,
                                                                        validationFunction: (value) {
                                                                          if (GetIncomeController.to.tempMonthlyExpenseList![index].amount!.toString().isEmpty) {
                                                                            validateOrNotMonthlyExpenseAmount[index].value = value.isEmpty;
                                                                            validateOrNotMonthlyExpenseAmount.refresh();
                                                                            // validateOrNot=true.obs;
                                                                            // validateOrNot.refresh();
                                                                            return amount;
                                                                          }
                                                                        },
                                                                      ),
                                                              ),
                                                            );
                                                          }),
                                                      if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                                                        TableCell(
                                                          verticalAlignment: TableCellVerticalAlignment.middle,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showCommonDialog(
                                                                  context: context,
                                                                  headerTitle: sureToDelete,
                                                                  descriptionTitle: sureToDeleteSubTitle,
                                                                  buttonColor: Colors.white,
                                                                  saveButtonBorderColor: colorsEE4242,
                                                                  noButtonTextStyle: noButtonTextStyle,
                                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                                  noButtonColor: Colors.black,
                                                                  onPressYes: () {
                                                                    DeleteIncomeExpenseController.to.deleteMonthlyExpenseList.add(GetIncomeController.to.tempMonthlyExpenseList![index].id!);
                                                                    GetIncomeController.to.tempMonthlyExpenseList?.removeAt(index);
                                                                    GetIncomeController.to.tempMonthlyExpenseList?.refresh();
                                                                    Get.back();
                                                                  },
                                                                  onPressNo: () {
                                                                    Get.back();
                                                                  });
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                                // margin: const EdgeInsets.only(left: 10.0),
                                                                // width: Get.width * 0.015,
                                                                height: Get.height * 0.03,
                                                                child: Image.asset(
                                                                  deleteImage,
                                                                  // height: Get.height * 0.02,
                                                                  // width: 30.0,
                                                                )),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                      ),
                                    );
                                  },
                                );
                              }),
                          Visibility(
                            visible: constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.monthlyExpenseShowTextWeb : monthlyExpenseEditModeController.monthlyExpenseEditMode,
                            child: GetBuilder<ShowMonthlyExpenseSaveDataTextController>(
                              builder: (showMonthlyExpenseSaveTextController) {
                                RxBool whenErrorOnlyShowRedBorder = false.obs;
                                RxBool whenErrorOnlyShowRedBorderAmount = false.obs;
                                return Column(
                                  children: [
                                    showMonthlyExpenseSaveTextController.monthlyExpenseShowTextWeb == false || showMonthlyExpenseSaveTextController.monthlyExpenseShowText == false
                                        ? Padding(
                                            padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? 5.0 : 10.0, left: constraints.maxWidth < 1000 ? 5 : 0.0),
                                            child: Table(
                                              columnWidths: <int, TableColumnWidth>{
                                                0: const FlexColumnWidth(3),
                                                1: const FlexColumnWidth(2),
                                                2: const FlexColumnWidth(2),
                                                3: const FlexColumnWidth(2),
                                                4: FlexColumnWidth(constraints.maxWidth > 1000 ? 1.85 : 2),
                                              },
                                              children: [
                                                TableRow(
                                                  children: [
                                                    StreamBuilder(
                                                        stream: whenErrorOnlyShowRedBorder.stream,
                                                        builder: (context, snapshot) {
                                                          return SizedBox(
                                                            height: whenErrorOnlyShowRedBorder.value ? Get.height * 0.07 : Get.height * 0.044,
                                                            child: Padding(
                                                              padding: EdgeInsets.only(right: Get.width * 0.02),
                                                              child: commonTextFormField(
                                                                errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                                                hintText: expenseName,
                                                                hintStyle: blackMontserrat10W500,
                                                                keyboardType: TextInputType.text,
                                                                inputAction: TextInputAction.next,
                                                                inputFormatter: [characterInputFormatter()],
                                                                contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                textEditingController: _monthlyExpenseNameController,
                                                                validationFunction: (value) {
                                                                  if (whenErrorOnlyShowRedBorder.value != value.isEmpty) {
                                                                    whenErrorOnlyShowRedBorder.value = value.isEmpty;
                                                                    whenErrorOnlyShowRedBorder.refresh();
                                                                  }
                                                                  if (_monthlyExpenseNameController.text.isEmpty) {
                                                                    return addExpenseName;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                    Container(
                                                      height: Get.height * 0.044,
                                                      padding: const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                      ),
                                                      alignment: Alignment.center,
                                                      child: GetBuilder<SelectedDropDownItem>(
                                                        builder: (dropDownController) {
                                                          return commonDropDown(
                                                              valueTextStyle: blackMontserrat10W500,
                                                              selectedItemTextStyle: blackMontserrat10W500,
                                                              hintTextStyle: blackMontserrat10W500,
                                                              hintText: chooseDate,
                                                              value: dropDownController.selectedSingleMonthlyExpenseDate,
                                                              itemList: dateList,
                                                              onChanged: (item) {
                                                                dropDownController.changeSingleDate(item: item);
                                                              });
                                                        },
                                                      ),
                                                      // child: dropDownDayGetBuilder(dropDownList: dateList),
                                                      margin: EdgeInsets.only(right: Get.width * 0.02),
                                                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                                                    ),
                                                    Container(
                                                      height: Get.height * 0.044,
                                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                                      alignment: Alignment.center,
                                                      child: GetBuilder<SelectedDropDownItem>(
                                                        builder: (monthDropDownController) {
                                                          return commonDropDown(
                                                              selectedItemTextStyle: blackMontserrat10W500,
                                                              valueTextStyle: blackMontserrat10W500,
                                                              hintText: chooseMonth,
                                                              hintTextStyle: blackMontserrat10W500,
                                                              value: monthDropDownController.selectedSingleMonthlyExpenseMonth,
                                                              itemList: months,
                                                              onChanged: (item) {
                                                                monthDropDownController.changeSingleMonth(item: item);
                                                              });
                                                        },
                                                      ),
                                                      margin: EdgeInsets.only(right: Get.width * 0.02),
                                                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        selectDate(
                                                          currentDate: currentDate,
                                                          context: context,
                                                        );
                                                      },
                                                      child: Container(
                                                        height: Get.height * 0.044,
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: constraints.maxWidth < 1000
                                                                ? Get.width * 0.015
                                                                : constraints.maxWidth > 1000
                                                                    ? Get.width * 0.005
                                                                    : 0.0),
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          DateFormat('dd-MM-yyyy').format(currentDate.value),
                                                          style: blackMontserrat10W500,
                                                          maxLines: 1,
                                                        ),
                                                        margin: EdgeInsets.only(right: Get.width * 0.02),
                                                        decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    StreamBuilder(
                                                        stream: whenErrorOnlyShowRedBorderAmount.stream,
                                                        builder: (context, snapshot) {
                                                          return SizedBox(
                                                            height: whenErrorOnlyShowRedBorderAmount.value ? Get.height * 0.07 : Get.height * 0.044,
                                                            child: commonTextFormField(
                                                              errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                                              hintText: amount,
                                                              hintStyle: blackMontserrat10W500,
                                                              prefixText: '\$',
                                                              prefixstyle: blackMontserrat10W500,
                                                              keyboardType: TextInputType.phone,
                                                              inputAction: TextInputAction.done,
                                                              inputFormatter: [digitInputFormatter()],
                                                              contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                              textEditingController: _monthlyExpenseAmountController,
                                                              validationFunction: (value) {
                                                                if (whenErrorOnlyShowRedBorderAmount.value != value.isEmpty) {
                                                                  whenErrorOnlyShowRedBorderAmount.value = value.isEmpty;
                                                                  whenErrorOnlyShowRedBorderAmount.refresh();
                                                                }
                                                                if (_monthlyExpenseAmountController.text.isEmpty) {
                                                                  return addAmount;
                                                                }
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    Visibility(
                                      visible:
                                          constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.monthlyExpenseShowTextWeb : showMonthlyExpenseSaveTextController.monthlyExpenseShowText,
                                      replacement: GetBuilder<SelectedDropDownItem>(
                                        builder: (dropDownController) {
                                          return Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (_formKey.currentState!.validate()) {
                                                    if (constraints.maxWidth < 1000) {
                                                      GetIncomeController.to.tempMonthlyExpenseList?.add(Data(
                                                          name: _monthlyExpenseNameController.text,
                                                          amount: int.parse(_monthlyExpenseAmountController.text),
                                                          every: int.parse(dropDownController.selectedSingleMonthlyExpenseMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                          paidOn: int.parse(
                                                              dropDownController.selectedSingleMonthlyExpenseDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                          onetimeWeekMonth: 3,
                                                          incomeOutgoing: 2,
                                                          date: currentDate.toString()));
                                                      // tempMonthlyIncomeList?.refresh();
                                                    } else {
                                                      CreateIncomeController.to.createIncome(url: mSyncAllIncome, parameter: {
                                                        rUpsertIncome: [
                                                          DataModel(
                                                              name: _monthlyExpenseNameController.text,
                                                              amount: int.parse(_monthlyExpenseAmountController.text),
                                                              every: int.parse(dropDownController.selectedSingleMonthlyExpenseMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                              paidOn: int.parse(dropDownController.selectedSingleMonthlyExpenseDate!
                                                                  .replaceAll('th', '')
                                                                  .replaceAll('st', '')
                                                                  .replaceAll('nd', '')
                                                                  .replaceAll('rd', '')),
                                                              onetimeWeekMonth: 3,
                                                              incomeOutgoing: 2,
                                                              date: currentDate.toString())
                                                        ]
                                                      }).whenComplete(() {
                                                        GetIncomeController.to.monthlyExpenseList?.clear();
                                                        GetIncomeController.to.tempMonthlyExpenseList?.clear();
                                                        GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "3"}).whenComplete(() {
                                                          GetIncomeController.to.monthlyExpenseList?.refresh();
                                                          TotalIncomeExpenseController.to.totalMonthlyExpenseList.clear();
                                                          TotalIncomeExpenseController.to.totalMonthlyExpenseLogic();
                                                        });
                                                      });
                                                    }
                                                    _monthlyExpenseNameController.clear();
                                                    _monthlyExpenseAmountController.clear();
                                                    dropDownController.selectedSingleMonthlyExpenseMonth = '1 mon';
                                                    dropDownController.selectedSingleMonthlyExpenseDate = '1st';
                                                    constraints.maxWidth > 1000
                                                        ? showMonthlyExpenseSaveTextController.changeVisibilityForWeb()
                                                        : showMonthlyExpenseSaveTextController.changeVisibility();
                                                  }
                                                },
                                                child: Text(
                                                  save,
                                                  style: greenMontserrat11W500,
                                                ),
                                              ),
                                              TextButton(
                                                child: Text(
                                                  cancel,
                                                  style: redMontserrat11W500,
                                                ),
                                                onPressed: () {
                                                  constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.changeVisibilityForWeb() : showMonthlyExpenseSaveTextController.changeVisibility();
                                                  _monthlyExpenseAmountController.clear();
                                                  _monthlyExpenseNameController.clear();
                                                  dropDownController.selectedSingleMonthlyExpenseMonth = null;
                                                  dropDownController.selectedSingleMonthlyExpenseDate = null;
                                                },
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                      child: constraints.maxWidth > 1000 && monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                              child: GestureDetector(
                                                onTap: () {
                                                  constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.changeVisibilityForWeb() : showMonthlyExpenseSaveTextController.changeVisibility();
                                                },
                                                child: Align(
                                                  alignment: const FractionalOffset(0.0, 0.0),
                                                  child: Text(
                                                    addMonthlyExpense,
                                                    style: addWeekIncomeStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  constraints.maxWidth > 1000
                      ? Container()
                      : Visibility(
                          visible: monthlyExpenseEditModeController.monthlyExpenseCircleAvatarVisibility,
                          child: Positioned(
                            right: 0,
                            top: 1,
                            bottom: 1,
                            child: GestureDetector(
                              onTap: () {
                                monthlyExpenseDataVisibilityController.changeVisibility();
                              },
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: const Color(0xffF2F2F2),
                                child: Padding(
                                  padding: EdgeInsets.only(left: monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                  child: Icon(
                                    monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                          ))
                ],
              );
            },
          );
        }),
  );
}

monthlyExpenseEditModeRow({BoxConstraints? constraints}) {
  return GetBuilder<MonthlyExpenseEditModeController>(
    builder: (controller) {
      return Row(
        children: [
          Text(
            monthlyExpense,
            style: blackMontserrat13W600,
          ),
          controller.monthlyExpenseEditMode == false
              ? Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.06),
                  child: InkWell(
                    onTap: () {
                      controller.showEditMode();
                    },
                    child: Image.asset(
                      editPenImage,
                      height: Get.height * 0.02,
                      width: Get.width * 0.05,
                    ),
                  ),
                )
              : Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.showEditMode();
                          CreateIncomeController.to.createIncome(
                              url: mSyncAllIncome,
                              parameter: {rDeleteIncome: DeleteIncomeExpenseController.to.deleteMonthlyExpenseList, rUpsertIncome: GetIncomeController.to.tempMonthlyExpenseList}).whenComplete(() {
                            DeleteIncomeExpenseController.to.deleteMonthlyExpenseList.clear();
                            GetIncomeController.to.monthlyExpenseList?.clear();
                            GetIncomeController.to.tempMonthlyExpenseList?.clear();
                            GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "3"}).whenComplete(() {
                              GetIncomeController.to.monthlyExpenseList?.refresh();
                              GetIncomeController.to.tempMonthlyExpenseList?.refresh();
                              TotalIncomeExpenseController.to.totalMonthlyExpenseList.clear();
                              TotalIncomeExpenseController.to.totalMonthlyExpenseLogic();
                            });
                          });
                        }
                      },
                      child: Text(
                        save,
                        style: greenMontserrat11W500,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        cancel,
                        style: redMontserrat11W500,
                      ),
                      onPressed: () {
                        controller.showEditMode();
                        GetIncomeController.to.monthlyExpenseList?.refresh();
                        DeleteIncomeExpenseController.to.deleteMonthlyExpenseList.clear();
                      },
                    )
                  ],
                ),
          const Spacer(),
          GetBuilder<MonthlyExpenseExpansionChange>(
            builder: (controller) {
              return Icon(
                controller.monthlyExpenseExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                color: color097EA2,
              );
            },
          )
        ],
      );
    },
  );
}
