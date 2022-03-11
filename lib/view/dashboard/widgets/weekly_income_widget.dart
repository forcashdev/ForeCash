import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/add_weekly_income_showtext_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/selected_dropdown_controller.dart';
import 'package:fore_cash/controller/total_income_expense_controller.dart';
import 'package:fore_cash/controller/weekly_income_edit_mode_controller.dart';
import 'package:fore_cash/controller/weekly_income_expansion_visibility_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

weeklyIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
  final dropDownController = Get.put(SelectedDropDownItem());
  TextEditingController _weeklyIncomeNameController = TextEditingController();
  TextEditingController _weeklyAmountController = TextEditingController();
  final weeklyIncomeDataVisibilityController = Get.put(WeeklyIncomeDataVisibilityController());
  final showSaveTextController = Get.put(ShowWeeklyIncomeSaveDataTextController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Rx<DateTime> currentDate = DateTime.now().obs;
  return Expanded(
    flex: boolValue == true
        ? 2
        : constraints!.maxWidth > 1000
            ? 2
            : 4,
    child: StreamBuilder(
        stream: GetIncomeController.to.weeklyIncomesList?.stream,
        builder: (context, snapshot) {
          return GetBuilder<WeeklyIncomeEditModeController>(
            builder: (weeklyEditModeController) {
              return Stack(
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: weeklyIncomeDataVisibilityController.weeklyDataVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                        left: weeklyEditModeController.weeklyIncomeEditMode == true ? 5 : 0.0),
                    padding: EdgeInsets.only(right: weeklyEditModeController.weeklyIncomeEditMode == false ? 0.0 : Get.width * 0.003),
                    decoration: BoxDecoration(
                        border: Border(
                            right: weeklyIncomeDataVisibilityController.weeklyDataVisibility == true && constraints!.maxWidth < 1000 && weeklyEditModeController.weeklyIncomeEditMode == true
                                ? BorderSide.none
                                : const BorderSide(color: colorEDEDED))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          constraints!.maxWidth > 1000 || weeklyIncomeDataVisibilityController.weeklyDataVisibility == true && weeklyIncomeDataVisibilityController.incomeListVisibility == false
                              ? Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(weeklyEditModeController.weeklyIncomeEditMode == true ? 3 : 2.95),
                                    1: const FlexColumnWidth(2),
                                    2: const FlexColumnWidth(2),
                                    3: const FlexColumnWidth(2),
                                    4: const FlexColumnWidth(2),
                                    5: const FlexColumnWidth(1),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: weeklyEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth > 1000
                                                ? 0.0
                                                : weeklyEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth < 1000
                                                    ? 5.0
                                                    : weeklyEditModeController.weeklyIncomeEditMode == false && constraints.maxWidth > 1000
                                                        ? 0.0
                                                        : 9.0),
                                        child: Text(
                                          incomeName,
                                          style: columnNameListStyle,
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

                                      // if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
                                      Text(
                                        effectiveDate,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        amount,
                                        style: columnNameListStyle,
                                      ),
                                      if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
                                        Text(
                                          action,
                                          style: columnNameListStyle,
                                        )
                                    ]),
                                  ],
                                )
                              : Column(),
                          StreamBuilder(
                              stream: GetIncomeController.to.tempWeeklyIncomeList?.stream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: weeklyEditModeController.weeklyIncomeEditMode ? GetIncomeController.to.tempWeeklyIncomeList?.length : GetIncomeController.to.weeklyIncomesList?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: Get.height * 0.015, top: index == 0 ? Get.height * 0.01 : 0.0),
                                      child: SwipeActionCell(
                                        backgroundColor: Colors.transparent,
                                        isDraggable: constraints.maxWidth > 1000
                                            ? false
                                            : weeklyEditModeController.weeklyIncomeEditMode
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
                                                    GetIncomeController.to.tempWeeklyIncomeList?.removeAt(index);
                                                    GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                    // GetIncomeController.to.monthlyIncomeList?.refresh();
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
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    GetIncomeController.to.weeklyIncomesList?[index].name ?? '',
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
                                                      TableCell(
                                                        // verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: SizedBox(
                                                          height: weeklyEditModeController.weeklyIncomeEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02,
                                                                left: weeklyEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth < 1000
                                                                    ? 5
                                                                    : constraints.maxWidth < 1000
                                                                        ? 10.0
                                                                        : 0.0),
                                                            child: weeklyEditModeController.weeklyIncomeEditMode == false
                                                                ? Text(
                                                                    GetIncomeController.to.weeklyIncomesList?[index].name ?? '',
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: blackMontserrat10W500,
                                                                    // textAlign: TextAlign.center,
                                                                  )
                                                                : commonTextFormField(
                                                                    inputAction: TextInputAction.next,
                                                                    keyboardType: TextInputType.text,
                                                                    inputFormatter: [characterInputFormatter()],
                                                                    contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                    textStyle: blackMontserrat10W500,
                                                                    textEditingController: TextEditingController(text: GetIncomeController.to.tempWeeklyIncomeList?[index].name ?? ''),
                                                                    onChangedFunction: (value) {
                                                                      GetIncomeController.to.tempWeeklyIncomeList?[index].name = value;
                                                                      // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                    },
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: weeklyEditModeController.weeklyIncomeEditMode == true ? 5 : 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: weeklyEditModeController.weeklyIncomeEditMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        value: '${GetIncomeController.to.tempWeeklyIncomeList?[index].paidOn ?? 1}'
                                                                            .toString()
                                                                            .replaceAll('1', 'Sun')
                                                                            .replaceAll('2', 'Mon')
                                                                            .replaceAll('3', 'Tue')
                                                                            .replaceAll('4', 'Wed')
                                                                            .replaceAll('5', 'Thu')
                                                                            .replaceAll('6', 'Fri')
                                                                            .replaceAll('7', 'Sat'),
                                                                        itemList: days,
                                                                        onChanged: (item) {
                                                                          // controller1.changeDate(item: item, index: index);
                                                                          GetIncomeController.to.tempWeeklyIncomeList?[index].paidOn = int.parse(item
                                                                              .replaceAll('Sun', '1')
                                                                              .replaceAll('Mon', '2')
                                                                              .replaceAll('Tue', '3')
                                                                              .replaceAll('Wed', '4')
                                                                              .replaceAll('Thu', '5')
                                                                              .replaceAll('Fri', '6')
                                                                              .replaceAll('Sat', '7'));
                                                                          GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.weeklyIncomesList?[index].paidOn ?? 1}'
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
                                                              color: weeklyEditModeController.weeklyIncomeEditMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: weeklyEditModeController.weeklyIncomeEditMode == true ? 5 : 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: weeklyEditModeController.weeklyIncomeEditMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        // value: controller1.selectWeekDropDown[index],
                                                                        value: '${GetIncomeController.to.tempWeeklyIncomeList?[index].every ?? 1}W',
                                                                        itemList: weeks,
                                                                        onChanged: (item) {
                                                                          // controller1.changeItem(item: item, index: index);
                                                                          GetIncomeController.to.tempWeeklyIncomeList?[index].every = int.parse(item.replaceAll('W', ''));
                                                                          GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.weeklyIncomesList?[index].every ?? 1}W',
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(right: Get.width * 0.02),
                                                          decoration: BoxDecoration(
                                                              color: weeklyEditModeController.weeklyIncomeEditMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: InkWell(
                                                          onTap: () {
                                                            // _selectDate(context: context, index: index);
                                                          },
                                                          child: Container(
                                                              margin: EdgeInsets.only(right: Get.width * 0.02),
                                                              decoration: BoxDecoration(
                                                                  color: weeklyEditModeController.weeklyIncomeEditMode ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                                              // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: weeklyEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth < 1000
                                                                      ? Get.width * 0.02
                                                                      : weeklyEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth > 1000
                                                                          ? Get.width * 0.005
                                                                          : 0.0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      DateFormat('dd-MM-yyyy').format(DateTime.parse(weeklyEditModeController.weeklyIncomeEditMode
                                                                          ? GetIncomeController.to.tempWeeklyIncomeList![index].date.toString()
                                                                          : GetIncomeController.to.weeklyIncomesList![index].date.toString())),
                                                                      style: blackMontserrat10W500,
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                  constraints.maxWidth > 1000 && weeklyEditModeController.weeklyIncomeEditMode == true
                                                                      ? Image.asset(
                                                                          calendarImage2,
                                                                          height: Get.height * 0.02,
                                                                          width: Get.width * 0.010,
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              right: constraints.maxWidth > 1000
                                                                  ? Get.width * 0.01
                                                                  : constraints.maxWidth < 1000 && weeklyEditModeController.weeklyIncomeEditMode == true
                                                                      ? Get.width * 0.01
                                                                      : Get.width * 0.0),
                                                          child: weeklyEditModeController.weeklyIncomeEditMode == false
                                                              ? Text(
                                                                  '${GetIncomeController.to.weeklyIncomesList?[index].amount ?? ''}'.toString(),
                                                                  style: blackMontserrat10W500,
                                                                  maxLines: 1,
                                                                )
                                                              : commonTextFormField(
                                                                  inputAction: TextInputAction.done,
                                                                  keyboardType: TextInputType.phone,
                                                                  inputFormatter: [digitInputFormatter()],
                                                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                  textStyle: blackMontserrat10W500,
                                                                  prefixText: '\$',
                                                                  prefixstyle: blackMontserrat10W500,
                                                                  textEditingController: TextEditingController(text: GetIncomeController.to.tempWeeklyIncomeList?[index].amount.toString() ?? ''),
                                                                  onChangedFunction: (value) {
                                                                    GetIncomeController.to.tempWeeklyIncomeList?[index].amount = int.parse(value);
                                                                    // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                  },
                                                                ),
                                                        ),
                                                      ),
                                                      if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
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
                                                                    GetIncomeController.to.tempWeeklyIncomeList?.removeAt(index);
                                                                    GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                    // GetIncomeController.to.monthlyIncomeList?.refresh();
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
                            visible: constraints.maxWidth > 1000 ? showSaveTextController.weeklyIncomeShowTextWeb : weeklyEditModeController.weeklyIncomeEditMode,
                            child: GetBuilder<ShowWeeklyIncomeSaveDataTextController>(
                              builder: (showWeeklyIncomeSaveTextController) {
                                RxBool whenErrorOnlyShowRedBorder = false.obs;
                                RxBool whenErrorOnlyShowRedBorderAmount = false.obs;
                                return Column(
                                  children: [
                                    showWeeklyIncomeSaveTextController.weeklyIncomeShowTextWeb == false || showWeeklyIncomeSaveTextController.weeklyIncomeShowText == false
                                        ? Padding(
                                            padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? 0.0 : 10.0),
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
                                                              padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                              child: commonTextFormField(
                                                                errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                                                hintText: incomeName,
                                                                hintStyle: blackMontserrat10W500,
                                                                keyboardType: TextInputType.text,
                                                                inputAction: TextInputAction.next,
                                                                inputFormatter: [characterInputFormatter()],
                                                                contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                textEditingController: _weeklyIncomeNameController,
                                                                validationFunction: (value) {
                                                                  if (whenErrorOnlyShowRedBorder.value != value.isEmpty) {
                                                                    whenErrorOnlyShowRedBorder.value = value.isEmpty;
                                                                    whenErrorOnlyShowRedBorder.refresh();
                                                                  }
                                                                  if (_weeklyIncomeNameController.text.isEmpty) {
                                                                    return addIncomeName;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                      ),
                                                      height: Get.height * 0.044,
                                                      alignment: Alignment.center,
                                                      child: GetBuilder<SelectedDropDownItem>(
                                                        builder: (dropDownController) {
                                                          return commonDropDown(
                                                              hintText: day,
                                                              hintTextStyle: blackMontserrat10W500,
                                                              valueTextStyle: blackMontserrat10W500,
                                                              selectedItemTextStyle: blackMontserrat10W500,
                                                              value: dropDownController.selectedSingleWeeklyIncomeDay,
                                                              itemList: days,
                                                              onChanged: (item) {
                                                                dropDownController.changeSingleDay(item: item);
                                                              });
                                                        },
                                                      ),
                                                      margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 5),

                                                      height: Get.height * 0.044,
                                                      alignment: Alignment.center,
                                                      child: GetBuilder<SelectedDropDownItem>(
                                                        builder: (weeklyDropDownController) {
                                                          return commonDropDown(
                                                              selectedItemTextStyle: blackMontserrat10W500,
                                                              valueTextStyle: blackMontserrat10W500,
                                                              hintText: week,
                                                              hintTextStyle: blackMontserrat10W500,
                                                              value: weeklyDropDownController.selectedSingleWeeklyIncomeWeek,
                                                              itemList: weeks,
                                                              onChanged: (item) {
                                                                weeklyDropDownController.changeSingleWeek(item: item);
                                                              });
                                                        },
                                                      ),
                                                      // child: dropDownWeekGetBuilder(dropDownList: months),
                                                      margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        selectDate(context: context, currentDate: currentDate);
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
                                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
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
                                                              textEditingController: _weeklyAmountController,
                                                              validationFunction: (value) {
                                                                if (whenErrorOnlyShowRedBorderAmount.value != value.isEmpty) {
                                                                  whenErrorOnlyShowRedBorderAmount.value = value.isEmpty;
                                                                  whenErrorOnlyShowRedBorderAmount.refresh();
                                                                }
                                                                if (_weeklyAmountController.text.isEmpty) {
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
                                      visible: constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.weeklyIncomeShowTextWeb : showWeeklyIncomeSaveTextController.weeklyIncomeShowText,
                                      replacement: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              final controller = Get.put(SelectedDropDownItem());
                                              if (_formKey.currentState!.validate()) {
                                                if (constraints.maxWidth < 1000) {
                                                  GetIncomeController.to.tempWeeklyIncomeList?.add(DataModel(
                                                      name: _weeklyIncomeNameController.text,
                                                      amount: int.parse(_weeklyAmountController.text),
                                                      paidOn: int.parse(controller.selectedSingleWeeklyIncomeDay
                                                          .toString()
                                                          .replaceAll('Sun', '1')
                                                          .replaceAll('Mon', '2')
                                                          .replaceAll('Tue', '3')
                                                          .replaceAll('Wed', '4')
                                                          .replaceAll('Thu', '5')
                                                          .replaceAll('Fri', '6')
                                                          .replaceAll('Sat', '7')),
                                                      every: int.parse(controller.selectedSingleWeeklyIncomeWeek!.replaceAll('W', '')),
                                                      weekMonth: 1,
                                                      incomeOutgoing: 1,
                                                      date: currentDate.toString().replaceAll('T00:00:00.000Z', '')));
                                                } else {
                                                  CreateIncomeController.to.createIncome(parameter: {
                                                    'income': [
                                                      DataModel(
                                                          name: _weeklyIncomeNameController.text,
                                                          amount: int.parse(_weeklyAmountController.text),
                                                          paidOn: int.parse(controller.selectedSingleWeeklyIncomeDay
                                                              .toString()
                                                              .replaceAll('Sun', '1')
                                                              .replaceAll('Mon', '2')
                                                              .replaceAll('Tue', '3')
                                                              .replaceAll('Wed', '4')
                                                              .replaceAll('Thu', '5')
                                                              .replaceAll('Fri', '6')
                                                              .replaceAll('Sat', '7')),
                                                          every: int.parse(controller.selectedSingleWeeklyIncomeWeek!.replaceAll('W', '')),
                                                          weekMonth: 1,
                                                          incomeOutgoing: 1,
                                                          date: currentDate.toString().replaceAll('T00:00:00.000Z', ''))
                                                    ]
                                                  }).whenComplete(() {
                                                    GetIncomeController.to.weeklyIncomesList?.clear();
                                                    GetIncomeController.to.tempWeeklyIncomeList?.clear();
                                                    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "1"}).whenComplete(() {
                                                      GetIncomeController.to.weeklyIncomesList?.refresh();
                                                      TotalIncomeExpenseController.to.totalWeeklyIncomeList.clear();
                                                      TotalIncomeExpenseController.to.totalWeeklyIncomeLogic();
                                                    });
                                                  });
                                                }
                                                GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                _weeklyIncomeNameController.clear();
                                                _weeklyAmountController.clear();
                                                controller.selectedSingleWeeklyIncomeWeek = '1W';
                                                controller.selectedSingleWeeklyIncomeDay = 'Sun';
                                                constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.changeVisibilityForWeb() : showWeeklyIncomeSaveTextController.changeVisibility();
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
                                              constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.changeVisibilityForWeb() : showWeeklyIncomeSaveTextController.changeVisibility();
                                              _weeklyAmountController.clear();
                                              _weeklyIncomeNameController.clear();
                                              dropDownController.selectedSingleWeeklyIncomeWeek = null;
                                              dropDownController.selectedSingleWeeklyIncomeDay = null;
                                            },
                                          )
                                        ],
                                      ),
                                      child: constraints.maxWidth > 1000 && weeklyEditModeController.weeklyIncomeEditMode == true
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                              child: GestureDetector(
                                                onTap: () {
                                                  constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.changeVisibilityForWeb() : showWeeklyIncomeSaveTextController.changeVisibility();
                                                },
                                                child: Align(
                                                  alignment: const FractionalOffset(0.0, 0.0),
                                                  child: Text(
                                                    addWeeklyIncome,
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
                      : GetBuilder<WeeklyIncomeEditModeController>(
                          builder: (weeklyCircleVisibilityController) {
                            return Visibility(
                                visible: weeklyCircleVisibilityController.weeklyCircleAvatarVisibility,
                                child: Positioned(
                                  right: 0,
                                  top: 1,
                                  bottom: 1,
                                  // left: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      weeklyIncomeDataVisibilityController.changeVisibility();
                                    },
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: const Color(0xffF2F2F2),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: weeklyIncomeDataVisibilityController.weeklyDataVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                        child: Icon(
                                          weeklyIncomeDataVisibilityController.weeklyDataVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                          color: Colors.black,
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        )
                ],
              );
            },
          );
        }),
  );
}
