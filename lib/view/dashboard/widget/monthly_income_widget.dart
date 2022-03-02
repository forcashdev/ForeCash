import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/getx/add_monthly_income_controller.dart';
import 'package:fore_cash/getx/monthly_expansion_visibility_controller.dart';
import 'package:fore_cash/getx/monthlyincome_edit_mode_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

monthlyIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
  final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
  final showSaveTextController = Get.put(SaveDataTextController());
  final TextEditingController _monthlyIncomeNameController = TextEditingController();
  final TextEditingController _monthlyIncomeAmountController = TextEditingController();
  final dropDownController = Get.put(SelectedDropDownItem());
  final monthlyIncomeEditMode = Get.put(MonthlyIncomeEditModeController());
  DateTime currentDate = DateTime.now();
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
                                : const BorderSide(color: borderColor))),
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
                                                  GetIncomeController.to.tempMonthlyIncomeList?.removeAt(index);
                                                  GetIncomeController.to.monthlyIncomeList?.refresh();
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
                                                    TableCell(
                                                      // verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: SizedBox(
                                                        height: editModeController.editMode ? Get.height * 0.044 : Get.height * 0.02,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02,
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
                                                                  keyboardType: TextInputType.text,
                                                                  inputAction: TextInputAction.next,
                                                                  inputFormatter: [characterInputFormatter()],
                                                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
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
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: Container(
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
                                                        margin: EdgeInsets.only(
                                                            right: constraints.maxWidth < 1000
                                                                ? Get.width * 0.02
                                                                : editModeController.editMode == true
                                                                    ? Get.width * 0.02
                                                                    : Get.width * 0.02),
                                                        decoration:
                                                            BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: Container(
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
                                                        margin: EdgeInsets.only(
                                                            right: constraints.maxWidth < 1000
                                                                ? editModeController.editMode == false
                                                                    ? Get.width * 0.02
                                                                    : Get.width * 0.02
                                                                : Get.width * 0.02),
                                                        decoration:
                                                            BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: InkWell(
                                                        onTap: () {
                                                          // _selectDate(context: context, index: index);
                                                        },
                                                        child: Container(
                                                            margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                            decoration:
                                                                BoxDecoration(color: editModeController.editMode ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(5)),
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
                                                                        ? GetIncomeController.to.tempMonthlyIncomeList![index].date
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
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
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
                                                                contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                // textStyle: incomeNameStyle,
                                                                textEditingController: TextEditingController(text: GetIncomeController.to.tempMonthlyIncomeList?[index].amount.toString()),
                                                                onChangedFunction: (value) {
                                                                  GetIncomeController.to.tempMonthlyIncomeList?[index].amount = int.parse(value);
                                                                  // GetIncomeController.to.monthlyExpenseList?[index].name = _monthlyExpenseName?.text;
                                                                }),
                                                      ),
                                                    ),
                                                    // if (editModeController.editMode == true && constraints.maxWidth > 1000)

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
                                                                  // tempMonthlyIncomeList?.removeAt(index);
                                                                  // GetIncomeController.to.monthlyIncomeList?.refresh();
                                                                  Get.back();
                                                                },
                                                                onPressNo: () {
                                                                  Get.back();
                                                                });
                                                            // setState(() {
                                                            //   MonthlyIncomeModelOld.monthlyIncomeList.removeAt(index);
                                                            // });
                                                            // GetIncomeController.to.monthlyIncomeList?.removeAt(index);
                                                            // GetIncomeController.to.monthlyIncomeList?.refresh();
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                              margin: const EdgeInsets.only(left: 10.0),
                                                              width: Get.width * 0.015,
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
                              return Column(
                                children: [
                                  if (showSaveTextController.showTextWeb == false || showSaveTextController.showText == false)
                                    Padding(
                                      padding: EdgeInsets.only(right: editModeController.editMode == true ? 0.0 : 10.0),
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
                                              SizedBox(
                                                height: Get.height * 0.044,
                                                child: Padding(
                                                  padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth > 1000 ? 0.0 : 5),
                                                  child: commonTextFormField(
                                                      hintText: incomeName,
                                                      hintStyle: blackMontserrat10W500,
                                                      keyboardType: TextInputType.text,
                                                      inputAction: TextInputAction.next,
                                                      inputFormatter: [characterInputFormatter()],
                                                      contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                      textEditingController: _monthlyIncomeNameController),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment: TableCellVerticalAlignment.fill,
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: 5,
                                                  ),

                                                  // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,

                                                  // height: Get.height * 0.04,

                                                  // alignment: Alignment.center,
                                                  child: GetBuilder<SelectedDropDownItem>(
                                                    builder: (dropDownController) {
                                                      return commonDropDown(
                                                          valueTextStyle: blackMontserrat10W500,
                                                          selectedItemTextStyle: blackMontserrat10W500,
                                                          hintTextStyle: blackMontserrat10W500,
                                                          hintText: chooseDate,
                                                          value: dropDownController.selectedDate,
                                                          itemList: dateList,
                                                          onChanged: (item) {
                                                            dropDownController.changeMonthlyIncomeDate(item: item);
                                                          });
                                                    },
                                                  ),
                                                  // child: dropDownDayGetBuilder(dropDownList: dateList),
                                                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                  decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment: TableCellVerticalAlignment.fill,
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 5),

                                                  // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                                  //
                                                  // height: Get.height * 0.04,

                                                  alignment: Alignment.center,
                                                  child: GetBuilder<SelectedDropDownItem>(
                                                    builder: (monthDropDownController) {
                                                      return commonDropDown(
                                                          selectedItemTextStyle: blackMontserrat10W500,
                                                          valueTextStyle: blackMontserrat10W500,
                                                          hintText: chooseMonth,
                                                          hintTextStyle: blackMontserrat10W500,
                                                          value: monthDropDownController.selectedMonth,
                                                          itemList: months,
                                                          onChanged: (item) {
                                                            monthDropDownController.changeMonthlyIncomeMonth(item: item);
                                                          });
                                                    },
                                                  ),
                                                  // child: dropDownWeekGetBuilder(dropDownList: months),
                                                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                  decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                                ),
                                              ),
                                              TableCell(
                                                  verticalAlignment: TableCellVerticalAlignment.fill,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      selectDate(context: context, currentDate: currentDate);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: constraints.maxWidth < 1000
                                                              ? Get.width * 0.015
                                                              : constraints.maxWidth > 1000
                                                                  ? Get.width * 0.005
                                                                  : 0.0),
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        DateFormat('dd-MM-yyyy').format(currentDate),
                                                        style: blackMontserrat10W500,
                                                        maxLines: 1,
                                                      ),
                                                      margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                      decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                                                    ),
                                                  )),
                                              TableCell(
                                                verticalAlignment: TableCellVerticalAlignment.fill,
                                                child: commonTextFormField(
                                                    hintText: amount,
                                                    hintStyle: blackMontserrat10W500,
                                                    keyboardType: TextInputType.phone,
                                                    inputAction: TextInputAction.done,
                                                    prefixText: '\$',
                                                    prefixstyle: blackMontserrat10W500,
                                                    inputFormatter: [digitInputFormatter()],
                                                    contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                    textEditingController: _monthlyIncomeAmountController),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  else
                                    Container(),
                                  Visibility(
                                    visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : showSaveTextController.showText,
                                    replacement: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.01,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            // setState(() {
                                            final controller = Get.put(SelectedDropDownItem());
                                            if (constraints.maxWidth < 1000) {
                                              GetIncomeController.to.tempMonthlyIncomeList?.add(DataModel(
                                                  name: _monthlyIncomeNameController.text,
                                                  amount: int.parse(_monthlyIncomeAmountController.text),
                                                  every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                  paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                  weekMonth: 2,
                                                  incomeOutgoing: 1,
                                                  date: currentDate.toString()));
                                              // tempMonthlyIncomeList?.refresh();
                                            } else {
                                              var response = await CreateIncomeController.to.createIncome(parameter: {
                                                'income': [
                                                  DataModel(
                                                      name: _monthlyIncomeNameController.text,
                                                      amount: int.parse(_monthlyIncomeAmountController.text),
                                                      every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                      paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                      weekMonth: 2,
                                                      incomeOutgoing: 1,
                                                      date: currentDate.toString())
                                                ]
                                              }).whenComplete(() {
                                                GetIncomeController.to.monthlyIncomeList?.clear();
                                                GetIncomeController.to.tempMonthlyIncomeList?.clear();
                                                GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "2"});
                                              });
                                              print("{{{{{{{{{{{{{{{{$response");
                                              // if (response["success"] == true) {
                                              //   GetIncomeController.to.monthlyIncomeList?.add(DataModel(
                                              //       name: _monthlyIncomeNameController.text,
                                              //       amount: int.parse(_monthlyIncomeAmountController.text),
                                              //       every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                              //       paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                              //       weekMonth: 2,
                                              //       incomeOutgoing: 1,
                                              //       date: currentDate.toString()));
                                              //   GetIncomeController.to.monthlyIncomeList?.refresh();
                                              // }
                                            }
                                            _monthlyIncomeAmountController.clear();
                                            _monthlyIncomeNameController.clear();
                                            controller.selectedMonth = null;
                                            controller.selectedDate = null;
                                            // MonthlyIncomeModelOld.monthlyIncomeList
                                            //     .add(MonthlyIncomeModelOld(expenseName: _monthlyIncomeNameController.text, amount: _monthlyAmountController.text));
                                            // controller.selectedMonthlyIncomeDateList.add(controller.selectedSingleMonthlyExpenseDate as Object);
                                            // controller.selectedMonthlyIncomeMonthList.add(controller.selectedSingleMonthlyExpenseMonth as Object);
                                            // checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
                                            // });
                                            constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
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
                                    ),
                                    child: constraints.maxWidth > 1000 && monthlyIncomeEditMode.editMode == true
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
                  Positioned(
                    right: 0,
                    top: 1,
                    bottom: 1,
                    child: constraints.maxWidth > 1000
                        ? Container()
                        : GetBuilder<MonthlyIncomeEditModeController>(
                            builder: (circleVisibilityController) {
                              // final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
                              return Visibility(
                                  visible: circleVisibilityController.circleAvatarVisibility,
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
                                  ));
                            },
                          ),
                  ),
                ],
              );
            },
          );
        }),
  );
}
