import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/add_onetime_income_showtext_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/on_one_time_income_expansion_change_controller.dart';
import 'package:fore_cash/controller/onetime_income_edit_mode_controller.dart';
import 'package:fore_cash/controller/onetime_income_expansion_visibility_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/temp_income_expense_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
oneTimeIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
  final showOneTimeIncomeSaveTextController = Get.put(ShowOneTimeIncomeSaveDataTextController());
  final oneTimeIncomeExpansionVisibilityController = Get.put(OneTimeIncomeExpansionVisibilityController());
  Rx<DateTime> currentDate = DateTime.now().obs;
  TextEditingController _oneTimeIncomeNameController = TextEditingController();
  TextEditingController _oneTimeIncomeAmountController = TextEditingController();
  return Expanded(
    flex: boolValue == true
        ? 2
        : constraints!.maxWidth > 1000
            ? 2
            : 4,
    child: StreamBuilder(
        stream: GetIncomeController.to.oneTimeIncomeList?.stream,
        builder: (context, snapshot) {
          return GetBuilder<OneTimeIncomeEditModeController>(
            builder: (editModeController) {
              return Stack(
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                    ),
                    padding: EdgeInsets.only(right: editModeController.oneTimeIncomeEditMode == false ? 0.0 : Get.width * 0.005),
                    decoration: BoxDecoration(
                        border: Border(
                            right: oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == true && constraints!.maxWidth < 1000 && editModeController.oneTimeIncomeEditMode == false
                                ? BorderSide.none
                                : BorderSide(color: colorEDEDED))),
                    child: Column(
                      children: [
                        constraints!.maxWidth > 1000 ||
                                oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == true && oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibilityIncome == false
                            ? Table(
                                columnWidths: <int, TableColumnWidth>{
                                  0: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true && constraints.maxWidth > 1000 ? 3.5 : 3.8),
                                  1: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 3 : 3.3),
                                  2: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 2 : 1.2),
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
                            stream: GetIncomeController.to.tempOneTimeIncomeList?.stream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: editModeController.oneTimeIncomeEditMode ? GetIncomeController.to.tempOneTimeIncomeList?.length : GetIncomeController.to.oneTimeIncomeList?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: Get.height * 0.015,
                                      top: index == 0 ? Get.height * 0.01 : 0.0,
                                    ),
                                    child: boolValue == true && constraints.maxWidth < 1000
                                        ? Text(
                                            '${GetIncomeController.to.oneTimeIncomeList?[index].name}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: blackMontserrat10W500,
                                          )
                                        : Table(
                                            columnWidths: <int, TableColumnWidth>{
                                              0: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 3.5 : 3.6),
                                              1: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 3 : 3.1),
                                              2: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 2 : 1.1),
                                            },
                                            children: [
                                              TableRow(
                                                children: [
                                                  TableCell(
                                                    child: SizedBox(
                                                      height: editModeController.oneTimeIncomeEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(right: Get.width * 0.04),
                                                        child: editModeController.oneTimeIncomeEditMode == false
                                                            ? Text(
                                                                '${GetIncomeController.to.oneTimeIncomeList?[index].name}',
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
                                                                textEditingController: TextEditingController(text: GetIncomeController.to.tempOneTimeIncomeList?[index].name ?? ''),
                                                                onChangedFunction: (value) {
                                                                  GetIncomeController.to.tempOneTimeIncomeList?[index].name = value;
                                                                  // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                },
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    verticalAlignment: TableCellVerticalAlignment.fill,
                                                    child: Container(
                                                      padding: EdgeInsets.only(left: editModeController.oneTimeIncomeEditMode == true ? 10 : 0.0),
                                                      alignment: Alignment.centerLeft,
                                                      child:
                                                          // editModeController.oneTimeIncomeEditMode == true
                                                          //     ? InkWell(
                                                          //         child: Text(
                                                          //           DateFormat('dd-MM-yyyy').format(DateTime.parse(GetIncomeController.to.tempOneTimeIncomeList![index].date.toString())),
                                                          //           style: blackMontserrat10W500,
                                                          //         ),
                                                          //         onTap: () {
                                                          //           selectDate(context: context, currentDate: currentDate);
                                                          //         },
                                                          //       )
                                                          //     :

                                                          Text(
                                                        DateFormat('dd-MM-yyyy').format(DateTime.parse(GetIncomeController.to.oneTimeIncomeList![index].date.toString())),
                                                        style: blackMontserrat10W500,
                                                      ),
                                                      margin: EdgeInsets.only(right: editModeController.oneTimeIncomeEditMode == true ? Get.width * 0.04 : Get.width * 0.045),
                                                      decoration: BoxDecoration(
                                                          color: editModeController.oneTimeIncomeEditMode == true ? colorEDF2F6 : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    verticalAlignment: TableCellVerticalAlignment.fill,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.only(right: constraints.maxWidth > 1000 && editModeController.oneTimeIncomeEditMode == true ? Get.width * 0.02 : Get.width * 0.0),
                                                      child: editModeController.oneTimeIncomeEditMode == false
                                                          ? Text(
                                                              '${GetIncomeController.to.oneTimeIncomeList?[index].amount}',
                                                              style: blackMontserrat10W500,
                                                              maxLines: 1,
                                                            )
                                                          : commonTextFormField(
                                                              textEditingController: TextEditingController(text: GetIncomeController.to.tempOneTimeIncomeList?[index].amount.toString() ?? ''),
                                                              prefixText: '\$',
                                                              keyboardType: TextInputType.phone,
                                                              prefixstyle: blackMontserrat10W500,
                                                              inputAction: TextInputAction.done,
                                                              onChangedFunction: (value) {
                                                                GetIncomeController.to.tempOneTimeIncomeList?[index].amount = int.parse(value);
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
                          visible: constraints.maxWidth > 1000 ? showOneTimeIncomeSaveTextController.oneTimeIncomeShowTextWeb : editModeController.oneTimeIncomeEditMode,
                          child: GetBuilder<ShowOneTimeIncomeSaveDataTextController>(
                            builder: (showSaveTextController) {
                              RxBool whenErrorOnlyShowRedBorder = false.obs;
                              RxBool whenErrorOnlyShowRedBorderAmount = false.obs;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  showSaveTextController.oneTimeIncomeShowTextWeb == false || showSaveTextController.oneTimeIncomeShowText == false
                                      ? Padding(
                                          padding: EdgeInsets.only(right: editModeController.oneTimeIncomeEditMode == true ? 0.0 : 10.0),
                                          child: Table(
                                            columnWidths: <int, TableColumnWidth>{
                                              0: FlexColumnWidth(constraints.maxWidth > 1000 ? 2.85 : 2.1),
                                              1: FlexColumnWidth(constraints.maxWidth > 1000 ? 2.5 : 1.8),
                                              2: FlexColumnWidth(constraints.maxWidth > 1000 ? 0.8 : 1.15),
                                              // 3: FlexColumnWidth(weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 2.5 : 1.33),
                                              // 4: FlexColumnWidth(weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 2.3 : 2.2),
                                              // 5: const FlexColumnWidth(1),
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
                                                              hintText: incomeName,
                                                              keyboardType: TextInputType.text,
                                                              hintStyle: blackMontserrat10W500,
                                                              inputAction: TextInputAction.next,
                                                              inputFormatter: [characterInputFormatter()],
                                                              contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                              textStyle: blackMontserrat10W500,
                                                              textEditingController: _oneTimeIncomeNameController,
                                                              validationFunction: (value) {
                                                                if (whenErrorOnlyShowRedBorder.value != value.isEmpty) {
                                                                  whenErrorOnlyShowRedBorder.value = value.isEmpty;
                                                                  whenErrorOnlyShowRedBorder.refresh();
                                                                }
                                                                if (_oneTimeIncomeNameController.text.isEmpty) {
                                                                  return addIncomeName;
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectDate(context: context, currentDate: currentDate);
                                                    },
                                                    child: Container(
                                                      height: Get.height * 0.044,
                                                      margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.10 : Get.width * 0.03),
                                                      padding: const EdgeInsets.only(
                                                        left: 6,
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
                                                          child: commonTextFormField(
                                                            errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                                            textEditingController: _oneTimeIncomeAmountController,
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
                                                              if (_oneTimeIncomeAmountController.text.isEmpty) {
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
                                      : Container(),
                                  Visibility(
                                    visible: constraints.maxWidth > 1000 ? showSaveTextController.oneTimeIncomeShowTextWeb : showSaveTextController.oneTimeIncomeShowText,
                                    replacement: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (_formKey.currentState!.validate()) {
                                              if (constraints.maxWidth < 1000) {
                                                GetIncomeController.to.tempOneTimeIncomeList?.add(Data(
                                                    name: _oneTimeIncomeNameController.text,
                                                    amount: int.parse(_oneTimeIncomeAmountController.text),
                                                    onetimeWeekMonth: 1,
                                                    incomeOutgoing: 1,
                                                    date: currentDate.toString()));
                                              } else {
                                                CreateIncomeController.to.createIncome(url: mSyncAllIncome, parameter: {
                                                  rUpsertIncome: [
                                                    DataModel(
                                                        name: _oneTimeIncomeNameController.text,
                                                        amount: int.parse(_oneTimeIncomeAmountController.text),
                                                        onetimeWeekMonth: 1,
                                                        incomeOutgoing: 1,
                                                        date: currentDate.toString())
                                                  ]
                                                }).whenComplete(() {
                                                  GetIncomeController.to.oneTimeIncomeList?.clear();
                                                  GetIncomeController.to.tempOneTimeIncomeList?.clear();
                                                  GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "1"});
                                                });
                                              }
                                              constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                            }
                                            GetIncomeController.to.oneTimeIncomeList?.refresh();
                                            GetIncomeController.to.tempOneTimeIncomeList?.refresh();
                                            _oneTimeIncomeNameController.clear();
                                            _oneTimeIncomeAmountController.clear();
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
                                            _oneTimeIncomeAmountController.clear();
                                            _oneTimeIncomeNameController.clear();
                                          },
                                        )
                                      ],
                                    ),
                                    child: constraints.maxWidth > 1000 && editModeController.oneTimeIncomeEditMode == true
                                        ? Container()
                                        : Padding(
                                            padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                            child: GestureDetector(
                                              onTap: () {
                                                constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                              },
                                              child: Text(
                                                addOneTimeIncome2,
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
                          visible: editModeController.oneTimeIncomeCircleAvatarVisibility,
                          child: Positioned(
                            right: 0,
                            top: 1,
                            bottom: 1,
                            // left: 0,
                            child: GestureDetector(
                              onTap: () {
                                oneTimeIncomeExpansionVisibilityController.changeVisibility();
                              },
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: const Color(0xffF2F2F2),
                                child: Padding(
                                  padding: EdgeInsets.only(left: oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                  child: Icon(
                                    oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
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

oneTimeIncomeEditModeRow({BoxConstraints? constraints}) {
  return GetBuilder<OneTimeIncomeEditModeController>(
    builder: (controller) {
      return Row(
        children: [
          Text(
            oneTimeIncome,
            style: blackMontserrat13W600,
          ),
          controller.oneTimeIncomeEditMode == false
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
                          CreateIncomeController.to.createIncome(url: mSyncAllIncome, parameter: {rUpsertIncome: GetIncomeController.to.tempOneTimeIncomeList}).whenComplete(() {
                            GetIncomeController.to.oneTimeIncomeList?.clear();
                            GetIncomeController.to.tempOneTimeIncomeList?.clear();
                            GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "1"}).whenComplete(() {
                              // TotalIncomeExpenseController.to.totalWeeklyBudgetList.clear();
                              // TotalIncomeExpenseController.to.totalWeeklyBudgetLogic();
                            });
                          });
                          GetIncomeController.to.oneTimeIncomeList?.refresh();
                          GetIncomeController.to.tempOneTimeIncomeList?.refresh();
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
                      },
                    )
                  ],
                ),
          const Spacer(),
          GetBuilder<OneTimeIncomeExpansionChange>(
            builder: (controller) {
              return Icon(
                controller.oneTimeIncomeExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                color: color097EA2,
              );
            },
          )
        ],
      );
    },
  );
}
