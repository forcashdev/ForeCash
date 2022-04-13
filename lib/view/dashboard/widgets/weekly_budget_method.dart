import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/add_weekly_budget_showtext_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/delete_income_expense_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/on_weekly_budget_expansion_change_controller.dart';
import 'package:fore_cash/controller/selected_dropdown_controller.dart';
import 'package:fore_cash/controller/total_income_expense_controller.dart';
import 'package:fore_cash/controller/weekly_budget_edit_mode_controller.dart';
import 'package:fore_cash/controller/weekly_budget_expansion_visibility_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/temp_income_expense_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
weeklyBudgetData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
  final dropDownController = Get.put(SelectedDropDownItem());
  TextEditingController _weeklyBudgetNameController = TextEditingController();
  TextEditingController _weeklyBudgetAmountController = TextEditingController();
  final weeklyBudgetVisibilityController = Get.put(WeeklyBudgetVisibilityController());
  final weeklyBudgetEditModeController = Get.put(WeeklyBudgetEditModeController());
  final showWeeklyBudgetSaveTextController = Get.put(ShowWeeklyBudgetSaveDataTextController());
  Rx<DateTime> currentDate = DateTime.now().obs;
  return Expanded(
    flex: boolValue == true
        ? 2
        : constraints!.maxWidth > 1000
            ? 2
            : 4,
    child: StreamBuilder(
        stream: GetIncomeController.to.weeklyBudgetList?.stream,
        builder: (context, snapshot) {
          return GetBuilder<WeeklyBudgetEditModeController>(
            builder: (editModeController) {
              return Stack(
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: weeklyBudgetVisibilityController.weeklyBudgetVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                    ),
                    padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == false ? 0.0 : Get.width * 0.003),
                    decoration: BoxDecoration(
                        border: Border(
                            right: weeklyBudgetVisibilityController.weeklyBudgetVisibility == true && constraints!.maxWidth < 1000 && editModeController.weeklyBudgetEditMode == false
                                ? BorderSide.none
                                : const BorderSide(color: colorEDEDED))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          constraints!.maxWidth > 1000 || weeklyBudgetVisibilityController.weeklyBudgetVisibility == true && weeklyBudgetVisibilityController.weeklyBudgetVisibilityIncome == false
                              ? Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(editModeController.weeklyBudgetEditMode == true ? 3 : 2.95),
                                    1: const FlexColumnWidth(2),
                                    2: const FlexColumnWidth(2),
                                    3: const FlexColumnWidth(2),
                                    4: const FlexColumnWidth(2),
                                    5: const FlexColumnWidth(1.1),
                                  },
                                  children: [
                                    TableRow(children: [
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

                                      // if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
                                      Text(
                                        effectiveDate,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        amount,
                                        style: columnNameListStyle,
                                      ),
                                      if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
                                        Text(
                                          action,
                                          style: columnNameListStyle,
                                        )
                                    ]),
                                  ],
                                )
                              : Column(),
                          StreamBuilder(
                              stream: GetIncomeController.to.tempWeeklyBudgetList?.stream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: editModeController.weeklyBudgetEditMode == true ? GetIncomeController.to.tempWeeklyBudgetList?.length : GetIncomeController.to.weeklyBudgetList?.length,
                                  itemBuilder: (context, index) {
                                    RxList<RxBool> validateOrNotWeeklyBudgetName = List.generate(GetIncomeController.to.tempWeeklyBudgetList!.length, (index) => false.obs).obs;
                                    RxList<RxBool> validateOrNotWeeklyBudgetAmount = List.generate(GetIncomeController.to.tempWeeklyBudgetList!.length, (index) => false.obs).obs;
                                    // if (index < MonthlyIncomeModelOld.monthlyIncomeList.length) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: Get.height * 0.015,
                                        top: index == 0 ? Get.height * 0.01 : 0.0,
                                      ),
                                      child: SwipeActionCell(
                                        backgroundColor: Colors.transparent,
                                        isDraggable: constraints.maxWidth > 1000
                                            ? false
                                            : editModeController.weeklyBudgetEditMode
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
                                                    DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.add(GetIncomeController.to.tempWeeklyBudgetList![index].id!);
                                                    GetIncomeController.to.tempWeeklyBudgetList?.removeAt(index);
                                                    GetIncomeController.to.tempWeeklyBudgetList?.refresh();
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
                                                child: Text(
                                                  '${GetIncomeController.to.weeklyBudgetList?[index].name}',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: blackMontserrat10W500,
                                                ),
                                              )
                                            : Table(
                                                // columnWidths: <int, TableColumnWidth>{
                                                //   0: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 3.5 : 3.3),
                                                //   1: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 3 : 2.2),
                                                //   2: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 3 : 2.2),
                                                //   3: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 2.5 : 1.4),
                                                //   4: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 2.3 : 2.2),
                                                //   5: const FlexColumnWidth(1.1),
                                                // },
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
                                                          stream: validateOrNotWeeklyBudgetName[index].stream,
                                                          builder: (context, snapshot) {
                                                            return SizedBox(
                                                              height: validateOrNotWeeklyBudgetName[index].value
                                                                  ? Get.height * 0.069
                                                                  : editModeController.weeklyBudgetEditMode
                                                                      ? Get.height * 0.044
                                                                      : Get.height * 0.02,
                                                              // height: weeklyBudgetEditModeController.weeklyBudgetEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(right: Get.width * 0.02),
                                                                child: editModeController.weeklyBudgetEditMode == false
                                                                    ? Text(
                                                                        GetIncomeController.to.weeklyBudgetList?[index].name ?? '',
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
                                                                        textEditingController: TextEditingController(text: GetIncomeController.to.tempWeeklyBudgetList?[index].name ?? ''),
                                                                        onChangedFunction: (value) {
                                                                          GetIncomeController.to.tempWeeklyBudgetList?[index].name = value;
                                                                          // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                        },
                                                                        validationFunction: (value) {
                                                                          if (GetIncomeController.to.tempWeeklyBudgetList![index].name!.isEmpty) {
                                                                            validateOrNotWeeklyBudgetName[index].value = value.isEmpty;
                                                                            validateOrNotWeeklyBudgetName.refresh();
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
                                                        height: editModeController.weeklyBudgetEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                        padding: EdgeInsets.symmetric(horizontal: weeklyBudgetEditModeController.weeklyBudgetEditMode ? 4 : 0.0),
                                                        alignment: Alignment.centerLeft,
                                                        child: editModeController.weeklyBudgetEditMode == true
                                                            ? GetBuilder<SelectedDropDownItem>(
                                                                builder: (controller1) {
                                                                  return commonDropDown(
                                                                      valueTextStyle: blackMontserrat10W500,
                                                                      selectedItemTextStyle: blackMontserrat10W500,
                                                                      value: '${GetIncomeController.to.tempWeeklyBudgetList?[index].paidOn ?? 1}'
                                                                          .toString()
                                                                          .replaceAll('1', 'Sun')
                                                                          .replaceAll('2', 'Mon')
                                                                          .replaceAll('3', 'Tue')
                                                                          .replaceAll('4', 'Wed')
                                                                          .replaceAll('5', 'Thu')
                                                                          .replaceAll('6', 'Fri')
                                                                          .replaceAll('7', 'Sat'),
                                                                      // value: controller1.weeklyBudgetDayDropDownList[index],
                                                                      itemList: days,
                                                                      onChanged: (item) {
                                                                        GetIncomeController.to.tempWeeklyBudgetList?[index].paidOn = int.parse(item
                                                                            .replaceAll('Sun', '1')
                                                                            .replaceAll('Mon', '2')
                                                                            .replaceAll('Tue', '3')
                                                                            .replaceAll('Wed', '4')
                                                                            .replaceAll('Thu', '5')
                                                                            .replaceAll('Fri', '6')
                                                                            .replaceAll('Sat', '7'));
                                                                        GetIncomeController.to.tempWeeklyBudgetList?.refresh();
                                                                        // controller1.changeWeeklyBudgetDayList(item: item, index: index);
                                                                      });
                                                                },
                                                              )
                                                            : Text(
                                                                '${GetIncomeController.to.weeklyBudgetList?[index].paidOn ?? 1}'
                                                                    .toString()
                                                                    .replaceAll('1', 'Sun')
                                                                    .replaceAll('2', 'Mon')
                                                                    .replaceAll('3', 'Tue')
                                                                    .replaceAll('4', 'Wed')
                                                                    .replaceAll('5', 'Thu')
                                                                    .replaceAll('6', 'Fri')
                                                                    .replaceAll('7', 'Sat'),
                                                                style: blackMontserrat10W500,
                                                              ),
                                                        margin: EdgeInsets.only(right: Get.width * 0.02),
                                                        decoration: BoxDecoration(
                                                            color: editModeController.weeklyBudgetEditMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                      Container(
                                                        height: editModeController.weeklyBudgetEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                        padding: EdgeInsets.symmetric(horizontal: weeklyBudgetEditModeController.weeklyBudgetEditMode ? 4 : 0.0),
                                                        alignment: Alignment.centerLeft,
                                                        child: editModeController.weeklyBudgetEditMode == true
                                                            ? GetBuilder<SelectedDropDownItem>(
                                                                builder: (controller1) {
                                                                  // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                                                  return commonDropDown(
                                                                      selectedItemTextStyle: blackMontserrat10W500,
                                                                      valueTextStyle: blackMontserrat10W500,
                                                                      value: '${GetIncomeController.to.tempWeeklyBudgetList?[index].every ?? 1}W',
                                                                      // value: controller1.weeklyBudgetWeekDropDownList[index],
                                                                      itemList: weeks,
                                                                      onChanged: (item) {
                                                                        GetIncomeController.to.tempWeeklyBudgetList?[index].every = int.parse(item.replaceAll('W', ''));
                                                                        GetIncomeController.to.tempWeeklyBudgetList?.refresh();
                                                                        // controller1.changeWeeklyBudgetWeekList(item: item, index: index);
                                                                      });
                                                                },
                                                              )
                                                            : Text(
                                                                '${GetIncomeController.to.weeklyBudgetList?[index].every ?? 1}W',
                                                                style: blackMontserrat10W500,
                                                              ),
                                                        margin: EdgeInsets.only(right: Get.width * 0.02),
                                                        decoration: BoxDecoration(
                                                            color: editModeController.weeklyBudgetEditMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // _selectDate(context: context, index: index);
                                                        },
                                                        child: Container(
                                                            height: editModeController.weeklyBudgetEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                            margin: EdgeInsets.only(right: Get.width * 0.02),
                                                            decoration: BoxDecoration(
                                                                color: editModeController.weeklyBudgetEditMode ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                                            // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: editModeController.weeklyBudgetEditMode == true && constraints.maxWidth < 1000
                                                                    ? Get.width * 0.02
                                                                    : editModeController.weeklyBudgetEditMode == true && constraints.maxWidth > 1000
                                                                        ? Get.width * 0.005
                                                                        : 0.0),
                                                            // width: Get.width * 0.080,
                                                            // height: Get.height * 0.04,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    DateFormat('dd-MM-yyyy').format(DateTime.parse(editModeController.weeklyBudgetEditMode
                                                                        ? GetIncomeController.to.tempWeeklyBudgetList![index].date.toString()
                                                                        : GetIncomeController.to.weeklyBudgetList![index].date.toString())),
                                                                    // tempMonthlyIncomeList![index].date.toString().replaceAll('T10:16:38.185Z', ''),
                                                                    // '${GetIncomeController.to.monthlyIncomeList?[index].date}',
                                                                    style: blackMontserrat10W500,
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                ),
                                                                constraints.maxWidth > 1000 && editModeController.weeklyBudgetEditMode == true
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
                                                          stream: validateOrNotWeeklyBudgetAmount[index].stream,
                                                          builder: (context, snapshot) {
                                                            return SizedBox(
                                                              height: validateOrNotWeeklyBudgetAmount[index].value
                                                                  ? Get.height * 0.068
                                                                  : editModeController.weeklyBudgetEditMode
                                                                      ? Get.height * 0.044
                                                                      : Get.height * 0.02,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    right: constraints.maxWidth > 1000
                                                                        ? Get.width * 0.01
                                                                        : constraints.maxWidth < 1000 && editModeController.weeklyBudgetEditMode == true
                                                                            ? Get.width * 0.01
                                                                            : Get.width * 0.0),
                                                                child: editModeController.weeklyBudgetEditMode == false
                                                                    ? Text(
                                                                        '${GetIncomeController.to.weeklyBudgetList?[index].amount ?? ''}',
                                                                        style: blackMontserrat10W500,
                                                                        maxLines: 1,
                                                                      )
                                                                    : commonTextFormField(
                                                                        textEditingController: TextEditingController(text: GetIncomeController.to.tempWeeklyBudgetList?[index].amount.toString() ?? ''),
                                                                        prefixText: '\$',
                                                                        keyboardType: TextInputType.phone,
                                                                        prefixstyle: blackMontserrat10W500,
                                                                        inputAction: TextInputAction.done,
                                                                        onChangedFunction: (value) {
                                                                          GetIncomeController.to.tempWeeklyBudgetList?[index].amount = int.parse(value);
                                                                        },
                                                                        inputFormatter: [digitInputFormatter()],
                                                                        contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
                                                                        textStyle: blackMontserrat10W500,
                                                                        validationFunction: (value) {
                                                                          if (GetIncomeController.to.tempWeeklyBudgetList![index].amount!.toString().isEmpty) {
                                                                            validateOrNotWeeklyBudgetAmount[index].value = value.isEmpty;
                                                                            validateOrNotWeeklyBudgetAmount.refresh();
                                                                            // validateOrNot=true.obs;
                                                                            // validateOrNot.refresh();
                                                                            return amount;
                                                                          }
                                                                        },
                                                                      ),
                                                              ),
                                                            );
                                                          }),
                                                      if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
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
                                                                    DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.add(GetIncomeController.to.tempWeeklyBudgetList![index].id!);
                                                                    GetIncomeController.to.tempWeeklyBudgetList?.removeAt(index);
                                                                    GetIncomeController.to.tempWeeklyBudgetList?.refresh();
                                                                    Get.back();
                                                                  },
                                                                  onPressNo: () {
                                                                    Get.back();
                                                                  });
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                                // margin: const EdgeInsets.only(left: 10.0),
                                                                width: Get.width * 0.015,
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
                            visible: constraints.maxWidth > 1000 ? showWeeklyBudgetSaveTextController.weeklyBudgetShowTextWeb : editModeController.weeklyBudgetEditMode,
                            child: GetBuilder<ShowWeeklyBudgetSaveDataTextController>(
                              builder: (showSaveTextController) {
                                RxBool whenErrorOnlyShowRedBorder = false.obs;
                                RxBool whenErrorOnlyShowRedBorderAmount = false.obs;
                                return Column(
                                  children: [
                                    showSaveTextController.weeklyBudgetShowTextWeb == false || showSaveTextController.weeklyBudgetShowText == false
                                        ? Padding(
                                            // padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? 0.0 : 10.0),
                                            padding: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000 ? 6.0 : 10.0,
                                            ),
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
                                                                textEditingController: _weeklyBudgetNameController,
                                                                validationFunction: (value) {
                                                                  if (whenErrorOnlyShowRedBorder.value != value.isEmpty) {
                                                                    whenErrorOnlyShowRedBorder.value = value.isEmpty;
                                                                    whenErrorOnlyShowRedBorder.refresh();
                                                                  }
                                                                  if (_weeklyBudgetNameController.text.isEmpty) {
                                                                    return addBudgetName;
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
                                                              hintText: day,
                                                              value: dropDownController.weeklyBudgetDay,
                                                              itemList: days,
                                                              onChanged: (item) {
                                                                dropDownController.changeWeeklyBudgetSingleDay(item: item);
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
                                                              hintText: week,
                                                              hintTextStyle: blackMontserrat10W500,
                                                              value: monthDropDownController.weeklyBudgetWeek,
                                                              itemList: weeks,
                                                              onChanged: (item) {
                                                                monthDropDownController.changeWeeklyBudgetSingleWeek(item: item);
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
                                                              textEditingController: _weeklyBudgetAmountController,
                                                              validationFunction: (value) {
                                                                if (whenErrorOnlyShowRedBorderAmount.value != value.isEmpty) {
                                                                  whenErrorOnlyShowRedBorderAmount.value = value.isEmpty;
                                                                  whenErrorOnlyShowRedBorderAmount.refresh();
                                                                }
                                                                if (_weeklyBudgetAmountController.text.isEmpty) {
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
                                      visible: constraints.maxWidth > 1000 ? showSaveTextController.weeklyBudgetShowTextWeb : showSaveTextController.weeklyBudgetShowText,
                                      replacement: Row(
                                        children: [
                                          // SizedBox(
                                          //   width: Get.width * 0.01,
                                          // ),
                                          InkWell(
                                            onTap: () {
                                              final controller = Get.put(SelectedDropDownItem());
                                              if (_formKey.currentState!.validate()) {
                                                if (constraints.maxWidth < 1000) {
                                                  GetIncomeController.to.tempWeeklyBudgetList?.add(Data(
                                                      name: _weeklyBudgetNameController.text,
                                                      amount: int.parse(_weeklyBudgetAmountController.text),
                                                      paidOn: int.parse(controller.weeklyBudgetDay
                                                          .toString()
                                                          .replaceAll('Sun', '1')
                                                          .replaceAll('Mon', '2')
                                                          .replaceAll('Tue', '3')
                                                          .replaceAll('Wed', '4')
                                                          .replaceAll('Thu', '5')
                                                          .replaceAll('Fri', '6')
                                                          .replaceAll('Sat', '7')),
                                                      every: int.parse(controller.weeklyBudgetWeek!.replaceAll('W', '')),
                                                      onetimeWeekMonth: 2,
                                                      incomeOutgoing: 2,
                                                      date: currentDate.toString()));
                                                } else {
                                                  CreateIncomeController.to.createIncome(url: mSyncAllIncome, parameter: {
                                                    rUpsertIncome: [
                                                      DataModel(
                                                          name: _weeklyBudgetNameController.text,
                                                          amount: int.parse(_weeklyBudgetAmountController.text),
                                                          paidOn: int.parse(controller.weeklyBudgetDay
                                                              .toString()
                                                              .replaceAll('Sun', '1')
                                                              .replaceAll('Mon', '2')
                                                              .replaceAll('Tue', '3')
                                                              .replaceAll('Wed', '4')
                                                              .replaceAll('Thu', '5')
                                                              .replaceAll('Fri', '6')
                                                              .replaceAll('Sat', '7')),
                                                          every: int.parse(controller.weeklyBudgetWeek!.replaceAll('W', '')),
                                                          onetimeWeekMonth: 2,
                                                          incomeOutgoing: 2,
                                                          date: currentDate.toString())
                                                    ]
                                                  }).whenComplete(() {
                                                    GetIncomeController.to.weeklyBudgetList?.clear();
                                                    GetIncomeController.to.tempWeeklyBudgetList?.clear();
                                                    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "2"}).whenComplete(() {});
                                                  });
                                                }
                                                GetIncomeController.to.weeklyBudgetList?.refresh();
                                                GetIncomeController.to.tempWeeklyBudgetList?.refresh();
                                                TotalIncomeExpenseController.to.totalWeeklyBudgetList.clear();
                                                TotalIncomeExpenseController.to.totalWeeklyBudgetLogic();
                                                _weeklyBudgetNameController.clear();
                                                _weeklyBudgetAmountController.clear();
                                                controller.weeklyBudgetDay = 'Sun';
                                                controller.weeklyBudgetWeek = '1W';
                                                constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
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
                                              constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                              _weeklyBudgetAmountController.clear();
                                              _weeklyBudgetNameController.clear();
                                              dropDownController.weeklyBudgetDay = 'Sun';
                                              dropDownController.weeklyBudgetWeek = '1W';
                                            },
                                          )
                                        ],
                                      ),
                                      child: constraints.maxWidth > 1000 && editModeController.weeklyBudgetEditMode == true
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                              child: GestureDetector(
                                                onTap: () {
                                                  constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                                },
                                                child: Align(
                                                  alignment: const FractionalOffset(0.0, 0.0),
                                                  child: Text(
                                                    addWeeklyBudget,
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
                          visible: editModeController.weeklyBudgetCircleAvatarVisibility,
                          child: Positioned(
                            right: 0,
                            top: 1,
                            bottom: 1,
                            // left: 0,
                            child: GestureDetector(
                              onTap: () {
                                weeklyBudgetVisibilityController.changeVisibility();
                              },
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: const Color(0xffF2F2F2),
                                child: Padding(
                                  padding: EdgeInsets.only(left: weeklyBudgetVisibilityController.weeklyBudgetVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                  child: Icon(
                                    weeklyBudgetVisibilityController.weeklyBudgetVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
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

weeklyBudgetEditModeRow({BoxConstraints? constraints}) {
  return GetBuilder<WeeklyBudgetEditModeController>(
    builder: (weeklyBudgetController) {
      return Row(
        children: [
          Text(
            weeklyBudget,
            style: blackMontserrat13W600,
          ),
          weeklyBudgetController.weeklyBudgetEditMode == false
              ? Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.06),
                  child: InkWell(
                    onTap: () {
                      weeklyBudgetController.showEditMode();
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
                          weeklyBudgetController.showEditMode();
                          CreateIncomeController.to.createIncome(
                              url: mSyncAllIncome,
                              parameter: {rDeleteIncome: DeleteIncomeExpenseController.to.deleteWeeklyExpenseList, rUpsertIncome: GetIncomeController.to.tempWeeklyBudgetList}).whenComplete(() {
                            GetIncomeController.to.weeklyBudgetList?.clear();
                            GetIncomeController.to.tempWeeklyBudgetList?.clear();
                            GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "2"}).whenComplete(() {
                              TotalIncomeExpenseController.to.totalWeeklyBudgetList.clear();
                              TotalIncomeExpenseController.to.totalWeeklyBudgetLogic();
                              TotalIncomeExpenseController.to.totalPreviousWeekBalanceList.clear();
                              TotalIncomeExpenseController.to.totalEndOfTheWeekBalanceList.clear();
                              TotalIncomeExpenseController.to.totalPreviousWeekBalanceLogic();
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
                        DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.clear();
                        weeklyBudgetController.showEditMode();
                      },
                    )
                  ],
                ),
          const Spacer(),
          GetBuilder<WeeklyBudgetExpansionChange>(
            builder: (controller) {
              return Icon(
                controller.weeklyBudgetExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                color: color097EA2,
              );
            },
          )
        ],
      );
    },
  );
}
