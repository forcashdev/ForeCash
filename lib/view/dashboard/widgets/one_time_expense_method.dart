import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/add_onetime_expense_showtext_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/on_one_time_expense_expansion_change_controller.dart';
import 'package:fore_cash/controller/onetime_expense_edit_mode_controller.dart';
import 'package:fore_cash/controller/onetime_expense_expansion_visibility_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/temp_income_expense_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
oneTimeExpenseData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
  TextEditingController _oneTimeExpenseNameController = TextEditingController();
  TextEditingController _oneTimeExpenseAmountController = TextEditingController();
  final oneTimeExpenseExpansionVisibilityController = Get.put(OneTimeExpenseExpansionVisibilityController());
  final showOneTimeExpenseSaveTextController = Get.put(ShowOneTimeExpenseSaveDataTextController());
  Rx<DateTime> currentDate = DateTime.now().obs;
  return Expanded(
    flex: boolValue == true
        ? 2
        : constraints!.maxWidth > 1000
            ? 2
            : 4,
    child: StreamBuilder(
        stream: GetIncomeController.to.oneTimeExpenseList!.stream,
        builder: (context, snapshot) {
          return GetBuilder<OneTimeExpenseEditModeController>(
            builder: (editModeController) {
              return Stack(
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: oneTimeExpenseExpansionVisibilityController.oneTimeExpenseVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                    ),
                    padding: EdgeInsets.only(right: editModeController.oneTimeExpenseEditMode == false ? 0.0 : Get.width * 0.005),
                    decoration: BoxDecoration(
                        border: Border(
                            right: oneTimeExpenseExpansionVisibilityController.oneTimeExpenseVisibility == true && constraints!.maxWidth < 1000 && editModeController.oneTimeExpenseEditMode == false
                                ? BorderSide.none
                                : const BorderSide(color: colorEDEDED))),
                    child: Column(
                      children: [
                        constraints!.maxWidth > 1000
                            ? Table(
                                columnWidths: <int, TableColumnWidth>{
                                  0: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 3.5 : 3.8),
                                  1: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 3 : 3.3),
                                  2: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 2 : 1.1),
                                },
                                children: [
                                  TableRow(children: [
                                    Text(
                                      incomeName,
                                      style: columnNameListStyle,
                                    ),
                                    Text(
                                      date,
                                      style: columnNameListStyle,
                                    ),
                                    Text(
                                      amount,
                                      style: columnNameListStyle,
                                    ),
                                  ]),
                                ],
                              )
                            : Column(),
                        StreamBuilder(
                            stream: GetIncomeController.to.tempOneTimeExpenseList!.stream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: editModeController.oneTimeExpenseEditMode ? GetIncomeController.to.tempOneTimeExpenseList?.length : GetIncomeController.to.oneTimeExpenseList?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: Get.height * 0.015,
                                      top: index == 0 ? Get.height * 0.01 : 0.0,
                                    ),
                                    child: boolValue == true && constraints.maxWidth < 1000
                                        ? Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                            height: editModeController.oneTimeExpenseEditMode == true ? Get.height * 0.04 : null,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '${GetIncomeController.to.oneTimeExpenseList?[index].name}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: blackMontserrat10W500,
                                            ),
                                            decoration:
                                                BoxDecoration(color: editModeController.oneTimeExpenseEditMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                          )
                                        : Table(
                                            columnWidths: <int, TableColumnWidth>{
                                              0: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 3.5 : 3.8),
                                              1: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 3 : 3.3),
                                              2: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 2 : 1.05),
                                            },
                                            children: [
                                              TableRow(
                                                children: [
                                                  TableCell(
                                                    child: SizedBox(
                                                      height: editModeController.oneTimeExpenseEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.045),
                                                        child: editModeController.oneTimeExpenseEditMode == false
                                                            ? Text(
                                                                '${GetIncomeController.to.oneTimeExpenseList?[index].name}',
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
                                                                textEditingController: TextEditingController(text: GetIncomeController.to.tempOneTimeExpenseList?[index].name ?? ''),
                                                                onChangedFunction: (value) {
                                                                  GetIncomeController.to.tempOneTimeExpenseList?[index].name = value;
                                                                  // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                },
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    verticalAlignment: TableCellVerticalAlignment.fill,
                                                    child: Container(
                                                      padding: EdgeInsets.only(left: editModeController.oneTimeExpenseEditMode == true ? 10 : 0.0),
                                                      // width: editModeController.oneTimeExpenseEditMode == true
                                                      //     ? constraints.maxWidth < 1000
                                                      //         ? Get.width * 0.18
                                                      //         : Get.width * 0.06
                                                      //     : null,
                                                      // height: editModeController.oneTimeExpenseEditMode == true ? Get.height * 0.04 : null,
                                                      alignment: Alignment.centerLeft,
                                                      child:
                                                          // editModeController.oneTimeExpenseEditMode == true
                                                          //     ? InkWell(
                                                          //   child: Text(
                                                          //     DateFormat('dd/MM/yyyy').format(DateTime.parse(GetIncomeController.to.tempOneTimeExpenseList![index].date!)),
                                                          //     style: blackMontserrat10W500,
                                                          //   ),
                                                          //   onTap: () {
                                                          //     _selectDate(context: context);
                                                          //   },
                                                          // )
                                                          //     :
                                                          Text(
                                                        DateFormat('dd/MM/yyyy').format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![index].date!)),
                                                        style: blackMontserrat10W500,
                                                      ),
                                                      margin: EdgeInsets.only(right: editModeController.oneTimeExpenseEditMode == true ? Get.width * 0.04 : Get.width * 0.045),
                                                      decoration: BoxDecoration(
                                                          color: editModeController.oneTimeExpenseEditMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    verticalAlignment: TableCellVerticalAlignment.fill,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.only(right: constraints.maxWidth > 1000 && editModeController.oneTimeExpenseEditMode == true ? Get.width * 0.02 : Get.width * 0.0),
                                                      child: editModeController.oneTimeExpenseEditMode == false
                                                          ? Text(
                                                              '${GetIncomeController.to.oneTimeExpenseList![index].amount}',
                                                              style: blackMontserrat10W500,
                                                              maxLines: 1,
                                                            )
                                                          : commonTextFormField(
                                                              textEditingController: TextEditingController(text: GetIncomeController.to.tempOneTimeExpenseList?[index].amount.toString() ?? ''),
                                                              prefixText: '\$',
                                                              keyboardType: TextInputType.phone,
                                                              prefixstyle: blackMontserrat10W500,
                                                              inputAction: TextInputAction.done,
                                                              onChangedFunction: (value) {
                                                                GetIncomeController.to.tempOneTimeExpenseList![index].amount = int.parse(value);
                                                              },
                                                              inputFormatter: [digitInputFormatter()],
                                                              contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                              textStyle: blackMontserrat10W500,
                                                            ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                  );
                                },
                              );
                            }),
                        Visibility(
                          visible: constraints.maxWidth > 1000 ? showOneTimeExpenseSaveTextController.oneTimeExpenseShowTextWeb : editModeController.oneTimeExpenseEditMode,
                          child: GetBuilder<ShowOneTimeExpenseSaveDataTextController>(
                            builder: (showSaveTextController) {
                              RxBool whenErrorOnlyShowRedBorder = false.obs;
                              RxBool whenErrorOnlyShowRedBorderAmount = false.obs;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  showSaveTextController.oneTimeExpenseShowTextWeb == false || showSaveTextController.oneTimeExpenseShowText == false
                                      ? Padding(
                                          padding: EdgeInsets.only(right: editModeController.oneTimeExpenseEditMode == true ? 0.0 : 10.0),
                                          child: Table(
                                            columnWidths: <int, TableColumnWidth>{
                                              0: FlexColumnWidth(constraints.maxWidth > 1000 ? 2.85 : 2.1),
                                              1: FlexColumnWidth(constraints.maxWidth > 1000 ? 2.5 : 1.8),
                                              2: FlexColumnWidth(constraints.maxWidth > 1000 ? 0.7 : 1.15),
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
                                                            padding: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.09 : Get.width * 0.04),
                                                            child: commonTextFormField(
                                                              errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                                              hintText: expenseName,
                                                              hintStyle: blackMontserrat10W500,
                                                              keyboardType: TextInputType.text,
                                                              inputAction: TextInputAction.next,
                                                              inputFormatter: [characterInputFormatter()],
                                                              contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                              textStyle: blackMontserrat10W500,
                                                              textEditingController: _oneTimeExpenseNameController,
                                                              validationFunction: (value) {
                                                                if (whenErrorOnlyShowRedBorder.value != value.isEmpty) {
                                                                  whenErrorOnlyShowRedBorder.value = value.isEmpty;
                                                                  whenErrorOnlyShowRedBorder.refresh();
                                                                }
                                                                if (_oneTimeExpenseNameController.text.isEmpty) {
                                                                  return addExpenseName;
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectDate(
                                                        currentDate: currentDate,
                                                        context: context,
                                                      );
                                                    },
                                                    child: Container(
                                                      height: Get.height * 0.044,
                                                      margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.11 : Get.width * 0.04),
                                                      padding: const EdgeInsets.only(
                                                        left: 10,
                                                      ),
                                                      // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.06,
                                                      // height: Get.height * 0.04,
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        DateFormat('dd/MM/yyyy').format(currentDate.value),
                                                        style: blackMontserrat10W500,
                                                      ),
                                                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                                                    ),
                                                  ),
                                                  StreamBuilder(
                                                      stream: whenErrorOnlyShowRedBorderAmount.stream,
                                                      builder: (context, snapshot) {
                                                        return SizedBox(
                                                          height: whenErrorOnlyShowRedBorderAmount.value ? Get.height * 0.07 : Get.height * 0.044,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                right: constraints.maxWidth > 1000 && editModeController.oneTimeExpenseEditMode == true ? Get.width * 0.02 : Get.width * 0.0),
                                                            child: commonTextFormField(
                                                              errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                                              textEditingController: _oneTimeExpenseAmountController,
                                                              prefixText: '\$',
                                                              keyboardType: TextInputType.phone,
                                                              prefixstyle: blackMontserrat10W500,
                                                              inputAction: TextInputAction.done,
                                                              inputFormatter: [digitInputFormatter()],
                                                              contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                              textStyle: blackMontserrat10W500,
                                                              validationFunction: (value) {
                                                                if (whenErrorOnlyShowRedBorderAmount.value != value.isEmpty) {
                                                                  whenErrorOnlyShowRedBorderAmount.value = value.isEmpty;
                                                                  whenErrorOnlyShowRedBorderAmount.refresh();
                                                                }
                                                                if (_oneTimeExpenseAmountController.text.isEmpty) {
                                                                  return addAmount;
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      })
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  Visibility(
                                    visible: constraints.maxWidth > 1000 ? showSaveTextController.oneTimeExpenseShowTextWeb : showSaveTextController.oneTimeExpenseShowText,
                                    replacement: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (_formKey.currentState!.validate()) {
                                              // setState(() {
                                              //   OneTimeExpenseModel.oneTimeExpenseList.add(
                                              //       OneTimeExpenseModel(incomeName: _oneTimeExpenseNameController.text, amount: _oneTimeExpenseAmountController.text, dateTime: currentDate.value));
                                              // });

                                              if (constraints.maxWidth < 1000) {
                                                GetIncomeController.to.tempOneTimeExpenseList?.add(Data(
                                                    name: _oneTimeExpenseNameController.text,
                                                    amount: int.parse(_oneTimeExpenseAmountController.text),
                                                    onetimeWeekMonth: 1,
                                                    incomeOutgoing: 2,
                                                    date: currentDate.toString()));
                                              } else {
                                                CreateIncomeController.to.createIncome(url: mSyncAllIncome, parameter: {
                                                  rUpsertIncome: [
                                                    DataModel(
                                                        name: _oneTimeExpenseNameController.text,
                                                        amount: int.parse(_oneTimeExpenseAmountController.text),
                                                        onetimeWeekMonth: 1,
                                                        incomeOutgoing: 2,
                                                        date: currentDate.toString())
                                                  ]
                                                }).whenComplete(() {
                                                  GetIncomeController.to.oneTimeExpenseList?.clear();
                                                  GetIncomeController.to.tempOneTimeExpenseList?.clear();
                                                  GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "1"});
                                                });
                                              }
                                              constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                              _oneTimeExpenseAmountController.clear();
                                              _oneTimeExpenseNameController.clear();
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
                                            _oneTimeExpenseAmountController.clear();
                                            _oneTimeExpenseNameController.clear();
                                          },
                                        )
                                      ],
                                    ),
                                    child: constraints.maxWidth > 1000 && editModeController.oneTimeExpenseEditMode == true
                                        ? Container()
                                        : Padding(
                                            padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                            child: GestureDetector(
                                              onTap: () {
                                                constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                              },
                                              child: Text(
                                                addOneTimeExpense2,
                                                style: addWeekIncomeStyle,
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
                  constraints.maxWidth > 1000
                      ? Container()
                      : Visibility(
                          visible: editModeController.oneTimeExpenseCircleAvatarVisibility,
                          child: Positioned(
                            right: 0,
                            top: 1,
                            bottom: 1,
                            // left: 0,
                            child: GestureDetector(
                              onTap: () {
                                oneTimeExpenseExpansionVisibilityController.changeVisibility();
                              },
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: const Color(0xffF2F2F2),
                                child: Padding(
                                  padding: EdgeInsets.only(left: oneTimeExpenseExpansionVisibilityController.oneTimeExpenseVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                  child: Icon(
                                    oneTimeExpenseExpansionVisibilityController.oneTimeExpenseVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
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

oneTimeExpenseEditModeRow({BoxConstraints? constraints}) {
  return GetBuilder<OneTimeExpenseEditModeController>(
    builder: (controller) {
      return Row(
        children: [
          Text(
            oneTimeIExpense,
            style: blackMontserrat13W600,
          ),
          controller.oneTimeExpenseEditMode == false
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
                        controller.showEditMode();
                        CreateIncomeController.to.createIncome(url: mSyncAllIncome, parameter: {rUpsertIncome: GetIncomeController.to.tempOneTimeExpenseList}).whenComplete(() {
                          GetIncomeController.to.oneTimeExpenseList?.clear();
                          GetIncomeController.to.tempOneTimeExpenseList?.clear();
                          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "1"}).whenComplete(() {
                            // TotalIncomeExpenseController.to.totalWeeklyBudgetList.clear();
                            // TotalIncomeExpenseController.to.totalWeeklyBudgetLogic();
                          });
                        });
                        GetIncomeController.to.oneTimeIncomeList?.refresh();
                        GetIncomeController.to.tempOneTimeIncomeList?.refresh();
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
                      },
                    )
                  ],
                ),
          const Spacer(),
          GetBuilder<OneTimeExpenseExpansionChange>(
            builder: (controller) {
              return Icon(
                controller.oneTimeExpenseExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                color: color097EA2,
              );
            },
          )
        ],
      );
    },
  );
}
