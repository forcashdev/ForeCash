import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/add_monthly_income_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/delete_income_expense_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/monthly_expansion_visibility_controller.dart';
import 'package:fore_cash/controller/monthlyincome_edit_mode_controller.dart';
import 'package:fore_cash/controller/on_monthly_income_expansion_change_controller.dart';
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

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
monthlyIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
  final TextEditingController _monthlyIncomeNameController = TextEditingController();
  final TextEditingController _monthlyIncomeAmountController = TextEditingController();
  final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
  final showSaveTextController = Get.put(SaveDataTextController());
  Rx<DateTime> currentDate = DateTime.now().obs;
  return Expanded(
    flex: boolValue == true
        ? 2
        : constraints!.maxWidth > 1000
            ? 2
            : 4,
    child: StreamBuilder(
        stream: GetIncomeController.to.monthlyIncomeList?.stream,
        builder: (context, snapshot) {
          return GetBuilder<MonthlyIncomeEditModeController>(
            builder: (editModeController) {
              return Stack(
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(right: monthlyIncomeVisibilityController.visibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0, left: editModeController.editMode == true ? 5 : 0.0),
                    padding: EdgeInsets.only(right: editModeController.editMode == false ? 0.0 : Get.width * 0.005),
                    decoration: BoxDecoration(
                        border: Border(
                            right: monthlyIncomeVisibilityController.visibility == true && constraints!.maxWidth < 1000 && editModeController.editMode == true
                                ? BorderSide.none
                                : const BorderSide(color: colorEDEDED))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          constraints!.maxWidth > 1000 || monthlyIncomeVisibilityController.visibility == true && monthlyIncomeVisibilityController.visibilityIncome == false
                              ? Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(editModeController.editMode == true ? 3 : 2.95),
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
                                            left: editModeController.editMode == true && constraints.maxWidth > 1000
                                                ? 0.0
                                                : editModeController.editMode == true && constraints.maxWidth < 1000
                                                    ? 5.0
                                                    : editModeController.editMode == false && constraints.maxWidth > 1000
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

                                      // if (editModeController.editMode && constraints.maxWidth > 1000)
                                      Text(
                                        effectiveDate,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        amount,
                                        style: columnNameListStyle,
                                      ),
                                      if (editModeController.editMode && constraints.maxWidth > 1000)
                                        Text(
                                          action,
                                          style: columnNameListStyle,
                                        )
                                    ]),
                                  ],
                                )
                              : Column(),
                          StreamBuilder(
                              stream: GetIncomeController.to.tempMonthlyIncomeList?.stream,
                              builder: (context, snapshot) {
                                RxList<RxBool> validateOrNotMonthlyIncomeName = List.generate(GetIncomeController.to.tempMonthlyIncomeList!.length, (index) => false.obs).obs;
                                RxList<RxBool> validateOrNotMonthlyIncomeAmount = List.generate(GetIncomeController.to.tempMonthlyIncomeList!.length, (index) => false.obs).obs;
                                // RxBool validateOrNotMonthlyIncomeName=false.obs;
                                // RxBool validateOrNotMonthlyIncomeAmount = false.obs;
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: editModeController.editMode == true ? GetIncomeController.to.tempMonthlyIncomeList?.length : GetIncomeController.to.monthlyIncomeList?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: Get.height * 0.015,
                                        top: index == 0 ? Get.height * 0.009 : 0.0,
                                      ),
                                      child: SwipeActionCell(
                                        backgroundColor: Colors.transparent,
                                        isDraggable: constraints.maxWidth > 1000
                                            ? false
                                            : editModeController.editMode
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
                                                    DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.add(GetIncomeController.to.tempMonthlyIncomeList![index].id!);
                                                    print(DeleteIncomeExpenseController.to.deleteMonthlyIncomeList[index]);
                                                    GetIncomeController.to.tempMonthlyIncomeList?.removeAt(index);
                                                    GetIncomeController.to.tempMonthlyIncomeList?.refresh();
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
                                                    GetIncomeController.to.monthlyIncomeList?[index].name ?? '',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: blackMontserrat10W500,
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
                                                          stream: validateOrNotMonthlyIncomeName.stream,
                                                          builder: (context, snapshot) {
                                                            return SizedBox(
                                                              height: validateOrNotMonthlyIncomeName[index].value
                                                                  ? Get.height * 0.069
                                                                  : editModeController.editMode
                                                                      ? Get.height * 0.044
                                                                      : Get.height * 0.02,
                                                              // height: editModeController.editMode ? Get.height * 0.044 : Get.height * 0.02,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    right: Get.width * 0.02,
                                                                    left: editModeController.editMode == true && constraints.maxWidth < 1000
                                                                        ? 5
                                                                        : constraints.maxWidth < 1000
                                                                            ? 10.0
                                                                            : 0.0),
                                                                child: editModeController.editMode == false
                                                                    ? Text(
                                                                        GetIncomeController.to.monthlyIncomeList?[index].name ?? '',
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: blackMontserrat10W500,
                                                                      )
                                                                    : commonTextFormField(
                                                                        errorTextStyle: TextStyle(fontSize: 9.sp),
                                                                        validationFunction: (value) {
                                                                          if (GetIncomeController.to.tempMonthlyIncomeList![index].name!.isEmpty) {
                                                                            validateOrNotMonthlyIncomeName[index].value = value.isEmpty;
                                                                            validateOrNotMonthlyIncomeName.refresh();
                                                                            // validateOrNot=true.obs;
                                                                            // validateOrNot.refresh();
                                                                            return incomeName;
                                                                          }
                                                                        },
                                                                        keyboardType: TextInputType.text,
                                                                        inputAction: TextInputAction.next,
                                                                        inputFormatter: [characterInputFormatter()],
                                                                        contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.008),
                                                                        textEditingController: TextEditingController(text: GetIncomeController.to.tempMonthlyIncomeList?[index].name ?? ''),
                                                                        onFieldSubmit: (value) {
                                                                          print('????${GetIncomeController.to.tempMonthlyIncomeList?[0].name}');
                                                                          print(GetIncomeController.to.monthlyIncomeList?[0].name);
                                                                        },
                                                                        onChangedFunction: (value) {
                                                                          // _monthlyIncomeName?.value[index].text = value;
                                                                          GetIncomeController.to.tempMonthlyIncomeList?[index].name = value;
                                                                          // GetIncomeController.to.monthlyExpenseList?[index].name = _monthlyExpenseName?.text;
                                                                        }),
                                                              ),
                                                            );
                                                          }),
                                                      Container(
                                                        height: editModeController.editMode ? Get.height * 0.044 : Get.height * 0.02,
                                                        padding: EdgeInsets.symmetric(horizontal: editModeController.editMode == true ? 5 : 0.0),
                                                        child: editModeController.editMode == true
                                                            ? GetBuilder<SelectedDropDownItem>(
                                                                builder: (controller1) {
                                                                  return commonDropDown(
                                                                      valueTextStyle: blackMontserrat10W500,
                                                                      selectedItemTextStyle: blackMontserrat10W500,
                                                                      value: '${GetIncomeController.to.tempMonthlyIncomeList?[index].paidOn ?? 1}th'
                                                                          .replaceAllMapped('1th', (match) => '1st')
                                                                          .replaceAllMapped('2th', (match) => '2nd')
                                                                          .replaceAllMapped('3th', (match) => '3rd')
                                                                          .replaceAllMapped('11st', (match) => '11th')
                                                                          .replaceAllMapped('12nd', (match) => '12th')
                                                                          .replaceAllMapped('13rd', (match) => '13th'),
                                                                      // value: controller1.selectedMonthlyIncomeDateList[index],
                                                                      itemList: dateList,
                                                                      onChanged: (item) {
                                                                        // controller1.changeDate(item: item, index: index);
                                                                        GetIncomeController.to.tempMonthlyIncomeList?[index].paidOn =
                                                                            int.parse(item.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', ''));
                                                                        GetIncomeController.to.tempMonthlyIncomeList?.refresh();
                                                                      });
                                                                },
                                                              )
                                                            : Text(
                                                                '${GetIncomeController.to.monthlyIncomeList?[index].paidOn ?? 1}th'
                                                                    .replaceAllMapped('1th', (match) => '1st')
                                                                    .replaceAllMapped('2th', (match) => '2nd')
                                                                    .replaceAllMapped('3th', (match) => '3rd')
                                                                    .replaceAllMapped('11st', (match) => '11th')
                                                                    .replaceAllMapped('12nd', (match) => '12th')
                                                                    .replaceAllMapped('13rd', (match) => '13th'),
                                                                style: blackMontserrat10W500,
                                                              ),
                                                        margin: EdgeInsets.only(right: Get.width * 0.02),
                                                        decoration:
                                                            BoxDecoration(color: editModeController.editMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                      Container(
                                                        height: editModeController.editMode ? Get.height * 0.044 : Get.height * 0.02,
                                                        padding: EdgeInsets.symmetric(horizontal: editModeController.editMode == true ? 5 : 0.0),
                                                        child: editModeController.editMode == true
                                                            ? GetBuilder<SelectedDropDownItem>(
                                                                builder: (controller1) {
                                                                  return commonDropDown(
                                                                      selectedItemTextStyle: blackMontserrat10W500,
                                                                      valueTextStyle: blackMontserrat10W500,
                                                                      value: '${GetIncomeController.to.tempMonthlyIncomeList?[index].every ?? 1} mon',
                                                                      // value: controller1.selectedMonthlyIncomeMonthList[index],
                                                                      itemList: months,
                                                                      onChanged: (item) {
                                                                        // controller1.changeItem(item: item, index: index);
                                                                        GetIncomeController.to.tempMonthlyIncomeList?[index].every = int.parse(item.replaceAll('mon', '').replaceAll(' ', ''));
                                                                        GetIncomeController.to.tempMonthlyIncomeList?.refresh();
                                                                      });
                                                                },
                                                              )
                                                            : Text(
                                                                '${GetIncomeController.to.monthlyIncomeList?[index].every ?? 1} mon',
                                                                style: blackMontserrat10W500,
                                                              ),
                                                        margin: EdgeInsets.only(right: Get.width * 0.02),
                                                        decoration:
                                                            BoxDecoration(color: editModeController.editMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // _selectDate(context: context, index: index);
                                                        },
                                                        child: Container(
                                                            height: editModeController.editMode ? Get.height * 0.044 : Get.height * 0.02,
                                                            margin: EdgeInsets.only(right: Get.width * 0.02),
                                                            decoration: BoxDecoration(color: editModeController.editMode ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                                            // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: editModeController.editMode == true && constraints.maxWidth < 1000
                                                                    ? Get.width * 0.015
                                                                    : editModeController.editMode == true && constraints.maxWidth > 1000
                                                                        ? Get.width * 0.005
                                                                        : 0.0),

                                                            // width: Get.width * 0.080,
                                                            // height: Get.height * 0.04,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    DateFormat('dd-MM-yyyy').format(DateTime.parse(editModeController.editMode == true
                                                                        ? GetIncomeController.to.tempMonthlyIncomeList![index].date.toString()
                                                                        : GetIncomeController.to.monthlyIncomeList![index].date.toString())),
                                                                    // tempMonthlyIncomeList![index].date.toString().replaceAll('T10:16:38.185Z', ''),
                                                                    // '${GetIncomeController.to.monthlyIncomeList?[index].date}',
                                                                    style: blackMontserrat10W500,
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                ),
                                                                constraints.maxWidth > 1000 && editModeController.editMode == true
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
                                                          stream: validateOrNotMonthlyIncomeAmount[index].stream,
                                                          builder: (context, snapshot) {
                                                            return SizedBox(
                                                              height: validateOrNotMonthlyIncomeAmount[index].value
                                                                  ? Get.height * 0.068
                                                                  : editModeController.editMode
                                                                      ? Get.height * 0.044
                                                                      : Get.height * 0.02,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(right: constraints.maxWidth < 1000 && editModeController.editMode == true ? Get.width * 0.01 : 0.0),
                                                                child: editModeController.editMode == false
                                                                    ? Text(
                                                                        '${GetIncomeController.to.monthlyIncomeList?[index].amount}',
                                                                        style: blackMontserrat10W500,
                                                                        maxLines: 1,
                                                                      )
                                                                    : commonTextFormField(
                                                                        prefixText: '\$',
                                                                        prefixstyle: blackMontserrat10W500,
                                                                        keyboardType: TextInputType.phone,
                                                                        inputAction: TextInputAction.done,
                                                                        inputFormatter: [digitInputFormatter()],
                                                                        //contentPadding: const EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 14.0),
                                                                        contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.018, 10.0, Get.height * 0.008),
                                                                        // textStyle: incomeNameStyle,
                                                                        textEditingController: TextEditingController(text: GetIncomeController.to.tempMonthlyIncomeList?[index].amount.toString()),
                                                                        onChangedFunction: (value) {
                                                                          GetIncomeController.to.tempMonthlyIncomeList?[index].amount = value.toString().isNotEmpty ? int.parse(value) : 0;
                                                                          // GetIncomeController.to.monthlyExpenseList?[index].name = _monthlyExpenseName?.text;
                                                                        },
                                                                        validationFunction: (value) {
                                                                          if (GetIncomeController.to.tempMonthlyIncomeList![index].amount!.toString().isEmpty) {
                                                                            validateOrNotMonthlyIncomeAmount[index].value = value.isEmpty;
                                                                            validateOrNotMonthlyIncomeAmount.refresh();
                                                                            // validateOrNot=true.obs;
                                                                            // validateOrNot.refresh();
                                                                            return amount;
                                                                          }
                                                                        },
                                                                      ),
                                                              ),
                                                            );
                                                          }),
                                                      if (editModeController.editMode && constraints.maxWidth > 1000)
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
                                                                    DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.add(GetIncomeController.to.tempMonthlyIncomeList![index].id!);
                                                                    // DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.refresh();
                                                                    print(DeleteIncomeExpenseController.to.deleteMonthlyIncomeList);
                                                                    GetIncomeController.to.tempMonthlyIncomeList?.removeAt(index);
                                                                    GetIncomeController.to.tempMonthlyIncomeList?.refresh();
                                                                    Get.back();
                                                                  },
                                                                  onPressNo: () {
                                                                    Get.back();
                                                                  });
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                                margin: const EdgeInsets.only(left: 10.0),
                                                                // width: Get.width * 0.015,
                                                                height: Get.height * 0.03,
                                                                child: Image.asset(
                                                                  deleteImage,
                                                                  height: Get.height * 0.01,
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
                            visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : editModeController.editMode,
                            child: GetBuilder<SaveDataTextController>(
                              builder: (showSaveTextController) {
                                RxBool whenErrorOnlyShowRedBorder = false.obs;
                                RxBool whenErrorOnlyShowRedBorderAmount = false.obs;
                                return Column(
                                  children: [
                                    if (showSaveTextController.showTextWeb == false || showSaveTextController.showText == false)
                                      Padding(
                                        // padding: EdgeInsets.only(right: editModeController.editMode == true ? 0.0 : 10.0),
                                        padding: EdgeInsets.only(
                                          right: constraints.maxWidth < 1000 ? 5.0 : 10.0,
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
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                StreamBuilder(
                                                    stream: whenErrorOnlyShowRedBorderAmount.stream,
                                                    builder: (context, snapshot) {
                                                      return SizedBox(
                                                        height: whenErrorOnlyShowRedBorder.value ? Get.height * 0.07 : Get.height * 0.044,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: Get.width * 0.02, left: constraints.maxWidth > 1000 ? 0.0 : 5),
                                                          child: commonTextFormField(
                                                            // isDense: true,
                                                            errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                                            hintText: incomeName,
                                                            hintStyle: blackMontserrat10W500,
                                                            keyboardType: TextInputType.text,
                                                            inputAction: TextInputAction.next,
                                                            inputFormatter: [characterInputFormatter()],
                                                            contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                            textEditingController: _monthlyIncomeNameController,
                                                            validationFunction: (value) {
                                                              if (whenErrorOnlyShowRedBorder.value != value.isEmpty) {
                                                                whenErrorOnlyShowRedBorder.value = value.isEmpty;
                                                                print(whenErrorOnlyShowRedBorder.value);
                                                                whenErrorOnlyShowRedBorder.refresh();
                                                              }
                                                              if (_monthlyIncomeNameController.text.isEmpty) {
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

                                                  // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,

                                                  height: Get.height * 0.044,

                                                  // alignment: Alignment.center,
                                                  child: GetBuilder<SelectedDropDownItem>(
                                                    builder: (dropDownController) {
                                                      return commonDropDown(
                                                          valueTextStyle: blackMontserrat10W500,
                                                          selectedItemTextStyle: blackMontserrat10W500,
                                                          // hintTextStyle: blackMontserrat10W500,
                                                          // hintText: chooseDate,
                                                          value: dropDownController.selectedDate,
                                                          itemList: dateList,
                                                          onChanged: (item) {
                                                            dropDownController.changeMonthlyIncomeDate(item: item);
                                                          });
                                                    },
                                                  ),
                                                  // child: dropDownDayGetBuilder(dropDownList: dateList),
                                                  margin: EdgeInsets.only(right: Get.width * 0.02),
                                                  decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 5),

                                                  // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                                  //
                                                  height: Get.height * 0.044,

                                                  alignment: Alignment.center,
                                                  child: GetBuilder<SelectedDropDownItem>(
                                                    builder: (monthDropDownController) {
                                                      return commonDropDown(
                                                          selectedItemTextStyle: blackMontserrat10W500,
                                                          valueTextStyle: blackMontserrat10W500,
                                                          // hintText: chooseMonth,
                                                          // hintTextStyle: blackMontserrat10W500,
                                                          value: monthDropDownController.selectedMonth,
                                                          itemList: months,
                                                          onChanged: (item) {
                                                            monthDropDownController.changeMonthlyIncomeMonth(item: item);
                                                          });
                                                    },
                                                  ),
                                                  // child: dropDownWeekGetBuilder(dropDownList: months),
                                                  margin: EdgeInsets.only(right: Get.width * 0.02),
                                                  decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                                ),
                                                StreamBuilder(
                                                    stream: currentDate.obs.stream,
                                                    builder: (context, snapshot) {
                                                      return GestureDetector(
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
                                                      );
                                                    }),
                                                StreamBuilder(
                                                    stream: whenErrorOnlyShowRedBorderAmount.stream,
                                                    builder: (context, snapshot) {
                                                      return SizedBox(
                                                        height: whenErrorOnlyShowRedBorderAmount.value ? Get.height * 0.07 : Get.height * 0.044,
                                                        child: commonTextFormField(
                                                          errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                                          hintText: amount,
                                                          hintStyle: blackMontserrat10W500,
                                                          keyboardType: TextInputType.phone,
                                                          inputAction: TextInputAction.done,
                                                          prefixText: '\$',
                                                          // errorBorder: OutlineInputBorder(
                                                          //   borderSide: const BorderSide(color: Colors.red),
                                                          //   borderRadius: BorderRadius.circular(4.0),
                                                          // ),
                                                          prefixstyle: blackMontserrat10W500,
                                                          inputFormatter: [digitInputFormatter()],
                                                          contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                          textEditingController: _monthlyIncomeAmountController,
                                                          validationFunction: (value) {
                                                            if (whenErrorOnlyShowRedBorderAmount.value != value.isEmpty) {
                                                              whenErrorOnlyShowRedBorderAmount.value = value.isEmpty;
                                                              print(whenErrorOnlyShowRedBorderAmount.value);
                                                              whenErrorOnlyShowRedBorderAmount.refresh();
                                                            }
                                                            if (_monthlyIncomeAmountController.text.isEmpty) {
                                                              return addAmount;
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    })
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    else
                                      Container(),
                                    Visibility(
                                      visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : showSaveTextController.showText,
                                      replacement: GetBuilder<SelectedDropDownItem>(
                                        builder: (dropDownController) {
                                          return Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (_formKey.currentState!.validate()) {
                                                    if (constraints.maxWidth < 1000) {
                                                      GetIncomeController.to.tempMonthlyIncomeList?.add(Data(
                                                          name: _monthlyIncomeNameController.text,
                                                          amount: int.parse(_monthlyIncomeAmountController.text),
                                                          every: int.parse(dropDownController.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                          paidOn: int.parse(dropDownController.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                          onetimeWeekMonth: 3,
                                                          incomeOutgoing: 1,
                                                          date: currentDate.toString()));
                                                    } else {
                                                      CreateIncomeController.to.createIncome(url: mSyncAllIncome, parameter: {
                                                        // 'delete_income': DeleteIncomeExpenseController.to.deleteMonthlyIncomeList,
                                                        'upsert_income': [
                                                          DataModel(
                                                              name: _monthlyIncomeNameController.text,
                                                              amount: int.parse(_monthlyIncomeAmountController.text),
                                                              every: int.parse(dropDownController.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                              paidOn: int.parse(dropDownController.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                              onetimeWeekMonth: 3,
                                                              incomeOutgoing: 1,
                                                              date: currentDate.toString())
                                                        ]
                                                      }).whenComplete(() {
                                                        GetIncomeController.to.monthlyIncomeList?.clear();
                                                        GetIncomeController.to.tempMonthlyIncomeList?.clear();
                                                        GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "3"}).whenComplete(() {
                                                          GetIncomeController.to.tempMonthlyIncomeList?.refresh();
                                                          TotalIncomeExpenseController.to.totalMonthlyIncomeList.clear();
                                                          TotalIncomeExpenseController.to.totalMonthlyIncomeLogic();
                                                        });
                                                      });
                                                    }
                                                    _monthlyIncomeAmountController.clear();
                                                    _monthlyIncomeNameController.clear();
                                                    dropDownController.selectedMonth = '1 mon';
                                                    dropDownController.selectedDate = '1st';
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
                                                  _monthlyIncomeAmountController.clear();
                                                  _monthlyIncomeNameController.clear();
                                                  dropDownController.selectedMonth = null;
                                                  dropDownController.selectedDate = null;
                                                },
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                      child: constraints.maxWidth > 1000 && editModeController.editMode == true
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
                                                    addMonthlyIncome,
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
                  Positioned(
                    right: 0,
                    top: 1,
                    bottom: 1,
                    child: constraints.maxWidth > 1000
                        ? Container()
                        : Visibility(
                            visible: editModeController.circleAvatarVisibility,
                            child: GestureDetector(
                              onTap: () {
                                monthlyIncomeVisibilityController.changeVisibility();
                              },
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: const Color(0xffF2F2F2),
                                child: Padding(
                                  padding: EdgeInsets.only(left: monthlyIncomeVisibilityController.visibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                  child: Icon(
                                    monthlyIncomeVisibilityController.visibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: 14.sp,
                                  ),
                                ),
                              ),
                            )),
                  ),
                ],
              );
            },
          );
        }),
  );
}

monthlyIncomeEditModeRow({BoxConstraints? constraints}) {
  final monthlyIncomeEditMode = Get.put(MonthlyIncomeEditModeController());
  return GetBuilder<MonthlyIncomeEditModeController>(
    builder: (controller) {
      return Row(
        children: [
          Text(
            monthlyIncome,
            style: blackMontserrat13W600,
          ),
          monthlyIncomeEditMode.editMode == false
              ? Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.06),
                  child: InkWell(
                    onTap: () {
                      final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
                      monthlyIncomeEditMode.showEditMode();

                      // if (monthlyIncomeEditMode.editMode) {
                      //   tempMonthlyIncomeList = GetIncomeController.to.monthlyIncomeList;
                      //   print(List.generate(tempMonthlyIncomeList!.length, (index) {
                      //     print(tempMonthlyIncomeList?[index].name);
                      //   }));
                      // } else {
                      //   tempMonthlyIncomeList?.clear();
                      // }
                      // if (monthlyIncomeVisibilityController.visibility == false) {
                      //   monthlyIncomeVisibilityController.changeVisibility();
                      // }
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
                          monthlyIncomeEditMode.showEditMode();
                          // DeleteIncomeExpenseController.to.callDelete(idList: DeleteIncomeExpenseController.to.deleteMonthlyIncomeList);
                          // DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.clear();
                          CreateIncomeController.to.createIncome(
                              url: mSyncAllIncome,
                              parameter: {rDeleteIncome: DeleteIncomeExpenseController.to.deleteMonthlyIncomeList, rUpsertIncome: GetIncomeController.to.tempMonthlyIncomeList}).whenComplete(() {
                            // DeleteIncomeExpenseController.to.callDelete(idList: DeleteIncomeExpenseController.to.deleteMonthlyIncomeList);
                            DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.clear();
                            GetIncomeController.to.monthlyIncomeList?.clear();
                            GetIncomeController.to.tempMonthlyIncomeList?.clear();
                            GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "3"}).whenComplete(() {
                              // GetIncomeController.to.monthlyIncomeList?.refresh();
                              GetIncomeController.to.tempMonthlyIncomeList?.refresh();
                              TotalIncomeExpenseController.to.totalMonthlyIncomeList.clear();
                              TotalIncomeExpenseController.to.totalMonthlyIncomeLogic();
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
                        monthlyIncomeEditMode.showEditMode();
                        GetIncomeController.to.tempMonthlyIncomeList?.refresh();
                        DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.clear();
                        // GetIncomeController.to.tempMonthlyIncomeList?.clear();
                        // GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "3"});
                      },
                    )
                  ],
                ),
          const Spacer(),
          GetBuilder<MonthlyIncomeExpansionChange>(
            builder: (controller) {
              return Icon(
                controller.expansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                color: color097EA2,
              );
            },
          )
        ],
      );
    },
  );
}
