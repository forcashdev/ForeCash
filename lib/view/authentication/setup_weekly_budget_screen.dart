import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/checkbox_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/delete_income_expense_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/screen_index_controller.dart';
import 'package:fore_cash/controller/selected_dropdown_controller.dart';
import 'package:fore_cash/controller/visibility_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SetupWeeklyBudgetScreen extends StatefulWidget {
  const SetupWeeklyBudgetScreen({Key? key}) : super(key: key);

  @override
  State<SetupWeeklyBudgetScreen> createState() => _SetupWeeklyBudgetScreenState();
}

class _SetupWeeklyBudgetScreenState extends State<SetupWeeklyBudgetScreen> {
  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final screenIndexController = Get.put(ScreenIndexController());
  final getIncomeController = Get.put(GetIncomeController());
  DateTime currentDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "week_month": "1"}).whenComplete(() {
    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "2"}).whenComplete(() {
      if (GetIncomeController.to.weeklyBudgetList!.isEmpty) {
        GetIncomeController.to.getWeeklyBudgetList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 4);
          GetIncomeController.to.monthlyExpenseList?.clear();
          GetIncomeController.to.monthlyExpenseList?.refresh();
          CheckBoxController.to.monthlyExpenseCheckBoxValueList.clear();
          return false;
        },
        child: StreamBuilder(
            stream: GetIncomeController.to.weeklyBudgetList?.stream,
            builder: (context, snapshot) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth > 1000;
                  return Scaffold(
                    resizeToAvoidBottomInset: false,
                    backgroundColor: maxWidth ? colorEDF2F6 : Colors.white,
                    body: Align(
                      alignment: maxWidth ? Alignment.center : Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                        width: maxWidth ? Get.width / 1.4 : null,
                        height: maxWidth ? Get.height * 0.78 : null,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                        child: Form(
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Column(
                            children: [
                              _headerColumnWidget(constraints: constraints),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  // width: maxWidth ? sequenceSize.width / 1.5 : null,
                                  // height: maxWidth ? 300 : null,
                                  decoration: BoxDecoration(
                                      // color: Colors.red,
                                      border: maxWidth ? Border.all(color: color777C90.withOpacity(0.5)) : null,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _nameTableRowWidget(constraints: constraints),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      maxWidth
                                          ? Divider(
                                              color: color777C90.withOpacity(0.5),
                                            )
                                          : Container(),
                                      Expanded(
                                        flex: 2,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              _setUpWeeklyBudgetRowWidget(constraints: constraints),
                                              _addNewWeeklyBudgetWidget(constraints: constraints),
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

  _headerColumnWidget({BoxConstraints? constraints}) {
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
                      screenIndexController.updateIndex(index: 4);
                      GetIncomeController.to.monthlyExpenseList?.clear();
                      GetIncomeController.to.monthlyExpenseList?.refresh();
                      CheckBoxController.to.monthlyExpenseCheckBoxValueList.clear();
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
          height: maxWidth ? 0.0 : Get.height * 0.04,
        ),
        maxWidth
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      screenIndexController.updateIndex(index: 4);
                      GetIncomeController.to.monthlyExpenseList?.clear();
                      GetIncomeController.to.monthlyExpenseList?.refresh();
                      CheckBoxController.to.monthlyExpenseCheckBoxValueList.clear();
                    },
                    child: Text(
                      backButton,
                      style: backButtonStyle,
                    )))
            : SizedBox(),
        Text(
          setupWeeklyBudget,
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
              text: setupWeeklySubTitle,
              style: textSpanStyle1,
              children: [TextSpan(text: setupWeeklySubTitle2, style: textSpanStyle2)],
            ),
          ),
        ),
      ],
    );
  }

  _nameTableRowWidget({BoxConstraints? constraints}) {
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
        TableRow(children: [
          SizedBox(),
          Padding(
            padding: EdgeInsets.only(left: constraints!.maxWidth > 1000 ? 5 : 0.0),
            child: Text(
              expenseName,
              style: columnNameListStyle,
            ),
          ),
          Text(
            resetOn,
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
        ]),
      ],
    );
  }

  _addNewWeeklyBudgetWidget({BoxConstraints? constraints}) {
    return GetBuilder<VisibilityController>(
      builder: (controller1) {
        RxBool whenErrorShowRedBorder = false.obs;
        RxBool whenErrorShowRedBorderAmount = false.obs;
        return Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.01, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
          child: GestureDetector(
            onTap: () {
              GetIncomeController.to.weeklyBudgetList?.add(DataModel(
                  name: '',
                  // amount: 0,
                  date: DateTime.now().toString(),
                  incomeOutgoing: 2,
                  onetimeWeekMonth: 2,
                  every: 1,
                  paidOn: 1));
              checkBoxController.weeklyBudgetCheckBoxValueList.add(true);
              GetIncomeController.to.weeklyBudgetList?.refresh();
              // controller1.changeVisibility();
            },
            child: Align(
              alignment: const FractionalOffset(0.015, 0.0),
              child: Text(
                addWeeklyBudget,
                style: addWeekIncomeStyle,
              ),
            ),
          ),
        );
        //   Visibility(
        //   visible: controller1.visibility,
        //   replacement: Padding(
        //     padding: EdgeInsets.only(bottom: Get.height * 0.01, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
        //     child: GestureDetector(
        //       onTap: () {
        //         controller1.changeVisibility();
        //       },
        //       child: Align(
        //         alignment: const FractionalOffset(0.015, 0.0),
        //         child: Text(
        //           addWeeklyIncome,
        //           style: addWeekIncomeStyle,
        //         ),
        //       ),
        //     ),
        //   ),
        //   child: Padding(
        //     padding: EdgeInsets.only(
        //       bottom: Get.height * 0.019,
        //     ),
        //     child: Column(
        //       children: [
        //         Table(
        //           columnWidths: const <int, TableColumnWidth>{
        //             0: FlexColumnWidth(0.35),
        //             1: FlexColumnWidth(3),
        //             2: FlexColumnWidth(2),
        //             3: FlexColumnWidth(2),
        //             4: FlexColumnWidth(2),
        //             5: FlexColumnWidth(2),
        //           },
        //           children: [
        //             TableRow(
        //               children: [
        //                 SizedBox(height: Get.height * 0.044),
        //                 TableCell(
        //                   verticalAlignment: TableCellVerticalAlignment.fill,
        //                   child: StreamBuilder(
        //                       stream: whenErrorShowRedBorder.stream,
        //                       builder: (context, snapshot) {
        //                         return Padding(
        //                           padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
        //                           child: commonTextFormField(
        //                               hintText: addExpense,
        //                               hintStyle: incomeNameStyle,
        //                               inputAction: TextInputAction.next,
        //                               enabledBorder: whenErrorShowRedBorder.value
        //                                   ? OutlineInputBorder(
        //                                       borderSide: const BorderSide(color: Colors.red),
        //                                       borderRadius: BorderRadius.circular(4.0),
        //                                     )
        //                                   : null,
        //                               validationFunction: (value) {
        //                                 if (whenErrorShowRedBorder.value != value.isEmpty) {
        //                                   whenErrorShowRedBorder.value = value.isEmpty;
        //                                   print(whenErrorShowRedBorder.value);
        //                                   whenErrorShowRedBorder.refresh();
        //                                 }
        //                                 return null;
        //                               },
        //                               inputFormatter: [characterInputFormatter()],
        //                               contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
        //                               textStyle: incomeNameStyle,
        //                               textEditingController: _expenseName2),
        //                         );
        //                       }),
        //                 ),
        //                 TableCell(
        //                   verticalAlignment: TableCellVerticalAlignment.fill,
        //                   child: Container(
        //                     padding: const EdgeInsets.symmetric(
        //                       horizontal: 6,
        //                     ),
        //                     // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
        //                     // height: Get.height * 0.044,
        //                     // alignment: Alignment.center,
        //                     child: dropDownDayGetBuilder(dropDownList: days),
        //                     margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
        //                     decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
        //                   ),
        //                 ),
        //                 TableCell(
        //                   verticalAlignment: TableCellVerticalAlignment.fill,
        //                   child: Container(
        //                     padding: const EdgeInsets.symmetric(horizontal: 6),
        //                     // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
        //                     // height: Get.height * 0.044,
        //                     // alignment: Alignment.center,
        //                     child: dropDownWeekGetBuilder(dropDownList: weeks),
        //                     margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
        //                     decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
        //                   ),
        //                 ),
        //                 TableCell(
        //                     verticalAlignment: TableCellVerticalAlignment.fill,
        //                     child: GestureDetector(
        //                       onTap: () {
        //                         _selectDate(context: context);
        //                       },
        //                       child: Container(
        //                         alignment: Alignment.centerLeft,
        //                         child: Text(
        //                           '${DateFormat('yyyy-MM-dd').format(currentDate)}',
        //                           style: dateStyle,
        //                           maxLines: 1,
        //                         ),
        //                         margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
        //                         decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
        //                       ),
        //                     )),
        //                 TableCell(
        //                   verticalAlignment: TableCellVerticalAlignment.fill,
        //                   child: StreamBuilder(
        //                       stream: whenErrorShowRedBorderAmount.stream,
        //                       builder: (context, snapshot) {
        //                         return Padding(
        //                           padding: EdgeInsets.only(right: Get.width * 0.02),
        //                           child: commonTextFormField(
        //                               prefixText: '\$',
        //                               prefixstyle: incomeNameStyle,
        //                               enabledBorder: whenErrorShowRedBorderAmount.value
        //                                   ? OutlineInputBorder(
        //                                       borderSide: const BorderSide(color: Colors.red),
        //                                       borderRadius: BorderRadius.circular(4.0),
        //                                     )
        //                                   : null,
        //                               validationFunction: (value) {
        //                                 if (whenErrorShowRedBorderAmount.value != value.isEmpty) {
        //                                   whenErrorShowRedBorderAmount.value = value.isEmpty;
        //                                   print(whenErrorShowRedBorderAmount.value);
        //                                   whenErrorShowRedBorderAmount.refresh();
        //                                 }
        //                                 return null;
        //                               },
        //                               keyboardType: TextInputType.phone,
        //                               inputAction: TextInputAction.done,
        //                               inputFormatter: [digitInputFormatter()],
        //                               contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
        //                               textStyle: incomeNameStyle,
        //                               textEditingController: _amount2),
        //                         );
        //                       }),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //         Padding(
        //           padding: EdgeInsets.only(top: Get.height * 0.01, left: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.028),
        //           child: Row(
        //             children: [
        //               // SizedBox(
        //               //   width: Get.width * 0.01,
        //               // ),
        //               InkWell(
        //                 onTap: () {
        //                   if (controller.weeklyBudgetDay == null || controller.weeklyBudgetWeek == null) {
        //                     Fluttertoast.showToast(
        //                         webPosition: 'center',
        //                         msg: "Select DropDown",
        //                         toastLength: Toast.LENGTH_SHORT,
        //                         gravity: ToastGravity.BOTTOM,
        //                         // webBgColor: Colors.black.withOpacity(0.5), // also possible "TOP" and "CENTER"
        //                         // backgroundColor: Colors.black.withOpacity(0.5),
        //                         textColor: const Color(0xffffffff));
        //                   } else if (_formKey.currentState!.validate()) {
        //                     GetIncomeController.to.weeklyBudgetList?.add(DataModel(
        //                         name: _expenseName2.text,
        //                         amount: int.parse(_amount2.text),
        //                         incomeOutgoing: 2,
        //                         weekMonth: 1,
        //                         paidOn: int.parse(controller.weeklyBudgetDay
        //                             .toString()
        //                             .replaceAll('Sun', '1')
        //                             .replaceAll('Mon', '2')
        //                             .replaceAll('Tue', '3')
        //                             .replaceAll('Wed', '4')
        //                             .replaceAll('Thu', '5')
        //                             .replaceAll('Fri', '6')
        //                             .replaceAll('Sat', '7')),
        //                         // every: controller.selectedSingleWeeklyIncomeDay!.replaceAll('Sun', int.parse('1'.toString()).toInt()),
        //                         every: int.parse(controller.weeklyBudgetWeek!.replaceAll('W', '')),
        //                         date: currentDate.toString()));
        //                     checkBoxController.weeklyBudgetCheckBoxValueList.add(true);
        //                     controller1.changeVisibility();
        //                     _expenseName2.clear();
        //                     _amount2.clear();
        //                   }
        //                 },
        //                 child: Text(
        //                   save,
        //                   style: greenMontserrat11W500,
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: Get.width * 0.017,
        //               ),
        //               InkWell(
        //                 child: Text(
        //                   cancel,
        //                   style: redMontserrat11W500,
        //                 ),
        //                 onTap: () {
        //                   controller1.changeVisibility();
        //                   // monthlyIncomeEditMode.showEditMode();
        //                 },
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }

  _nextButtonWidget({BoxConstraints? constraints}) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: constraints!.maxWidth < 1000 ? Get.height * 0.010 : Get.height * 0.03,
          left: constraints.maxWidth > 1000 ? Get.width * 0.15 : Get.width * 0.04,
          right: constraints.maxWidth > 1000 ? Get.width * 0.15 : Get.width * 0.04,
          top: Get.width * 0.003),
      child: commonButton(
        height: 50,
        text: next,
        onPress: () {
          if (_formKey.currentState!.validate()) {
            if (constraints.maxWidth < 1000) {
              CreateIncomeController.to.createIncome(screenIndex: 6, parameter: {rUpsertIncome: GetIncomeController.to.weeklyBudgetList}).whenComplete(() {
                if (DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.isNotEmpty) {
                  DeleteIncomeExpenseController.to.callDelete(idList: DeleteIncomeExpenseController.to.deleteWeeklyExpenseList).whenComplete(() {
                    DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.clear();
                  });
                }
              });
            } else {
              List<DataModel> tempMonthlyExpenseList = [];
              checkBoxController.weeklyBudgetCheckBoxValueList.asMap().forEach((index, value) {
                if (value) {
                  tempMonthlyExpenseList.add(GetIncomeController.to.weeklyBudgetList!.value[index]);
                } else {
                  if (GetIncomeController.to.weeklyBudgetList![index].id != null) {
                    DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.add(GetIncomeController.to.weeklyBudgetList![index].id!);
                  }
                }
              });
              CreateIncomeController.to.createIncome(screenIndex: 6, parameter: {rUpsertIncome: tempMonthlyExpenseList}).whenComplete(() {
                if (DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.isNotEmpty) {
                  DeleteIncomeExpenseController.to.callDelete(idList: DeleteIncomeExpenseController.to.deleteWeeklyExpenseList).whenComplete(() {
                    DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.clear();
                  });
                }
              });
            }
          }
        },
      ),
    );
  }

  _setUpWeeklyBudgetRowWidget({BoxConstraints? constraints}) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: GetIncomeController.to.weeklyBudgetList?.length,
      itemBuilder: (context, index) {
        TextEditingController? _expenseName;
        TextEditingController? _amount;
        _expenseName = TextEditingController(text: GetIncomeController.to.weeklyBudgetList?[index].name ?? '');
        _amount = TextEditingController(text: GetIncomeController.to.weeklyBudgetList?[index].amount.toString().replaceAll('null', '') ?? '');
        RxList<RxBool> whenErrorOnlyShowRedBorderList = List.generate(GetIncomeController.to.weeklyBudgetList!.length, (index) => false.obs).obs;
        RxList<RxBool> whenErrorOnlyShowRedBorderAmountList = List.generate(GetIncomeController.to.weeklyBudgetList!.length, (index) => false.obs).obs;
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SwipeActionCell(
            backgroundColor: Colors.transparent,
            isDraggable: constraints!.maxWidth > 1000 ? false : true,
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
                        DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.add(GetIncomeController.to.weeklyBudgetList![index].id!);
                        GetIncomeController.to.weeklyBudgetList?.removeAt(index);
                        Get.back();
                      },
                      onPressNo: () {
                        Get.back();
                      });
                },
              ),
            ],
            key: UniqueKey(),
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
                    constraints.maxWidth < 1000
                        ? Container(
                            height: Get.height * 0.044,
                            // width: 8,
                            margin: EdgeInsets.only(right: Get.width * 0.02),
                            decoration: BoxDecoration(color: color12CC8E, borderRadius: BorderRadius.circular(2)),
                          )
                        : SizedBox(
                            height: Get.height * 0.044,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: GetBuilder<CheckBoxController>(
                                builder: (controller) {
                                  return Checkbox(
                                    activeColor: color12CC8E,
                                    checkColor: Colors.white,
                                    value: checkBoxController.weeklyBudgetCheckBoxValueList[index],
                                    onChanged: (value) {
                                      checkBoxController.selectedWeeklyBudgetCheckBox(value: value, index: index);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                    StreamBuilder(
                        stream: whenErrorOnlyShowRedBorderList.stream,
                        builder: (context, snapshot) {
                          return SizedBox(
                            // height: whenErrorOnlyShowRedBorderList[index].value == true ? Get.height * 0.07 : Get.height * 0.044,
                            height: checkBoxController.weeklyBudgetCheckBoxValueList[index]
                                ? whenErrorOnlyShowRedBorderList[index].value == true
                                    ? Get.height * 0.07
                                    : Get.height * 0.044
                                : checkBoxController.weeklyBudgetCheckBoxValueList[index] == false
                                    ? Get.height * 0.044
                                    : Get.height * 0.07,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                              child: commonTextFormField(
                                  errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                  inputAction: TextInputAction.next,
                                  inputFormatter: [characterInputFormatter()],
                                  // contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                  contentPadding: EdgeInsets.fromLTRB(10.0, constraints.maxWidth > 1000 ? Get.height * 0.030 : Get.height * 0.020, 10.0, 0.0),
                                  textStyle: incomeNameStyle,
                                  hintText: expenseName,
                                  hintStyle: incomeNameStyle,
                                  // errorBorder: whenErrorOnlyShowRedBorderList[index].value
                                  //     ? OutlineInputBorder(
                                  //         borderSide: const BorderSide(color: Colors.red),
                                  //         borderRadius: BorderRadius.circular(4.0),
                                  //       )
                                  //     : null,
                                  // focusedErrorBorder: whenErrorOnlyShowRedBorderList[index].value
                                  //     ? OutlineInputBorder(
                                  //         borderSide: const BorderSide(color: Colors.red),
                                  //         borderRadius: BorderRadius.circular(4.0),
                                  //       )
                                  //     : null,
                                  errorBorder: constraints.maxWidth > 1000
                                      ? checkBoxController.weeklyBudgetCheckBoxValueList[index]
                                          ? whenErrorOnlyShowRedBorderList[index].value
                                              ? OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.red),
                                                  borderRadius: BorderRadius.circular(4.0),
                                                )
                                              : null
                                          : null
                                      : whenErrorOnlyShowRedBorderList[index].value
                                          ? OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.red),
                                              borderRadius: BorderRadius.circular(4.0),
                                            )
                                          : null,
                                  focusedErrorBorder: whenErrorOnlyShowRedBorderList[index].value
                                      ? OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.circular(4.0),
                                        )
                                      : null,
                                  validationFunction: (value) {
                                    if (whenErrorOnlyShowRedBorderList[index].value != value.isEmpty) {
                                      whenErrorOnlyShowRedBorderList[index].value = value.isEmpty;
                                      print(whenErrorOnlyShowRedBorderList[index].value);
                                      whenErrorOnlyShowRedBorderList.refresh();
                                    }
                                    // return whenErrorOnlyShowRedBorderList[index].value == true ? '' : null;
                                    return checkBoxController.weeklyBudgetCheckBoxValueList[index]
                                        ? whenErrorOnlyShowRedBorderList[index].value == true
                                            ? addBudgetName
                                            : null
                                        : null;
                                  },
                                  textEditingController: _expenseName,
                                  onChangedFunction: (value) {
                                    GetIncomeController.to.weeklyBudgetList?[index].name = value ?? "";
                                  }),
                            ),
                          );
                        }),
                    Container(
                      height: Get.height * 0.044,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1000 ? 8 : 4,
                      ),
                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                      child: commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: '${GetIncomeController.to.weeklyBudgetList?[index].paidOn ?? 1}'
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
                            GetIncomeController.to.weeklyBudgetList?[index].paidOn = int.parse(
                                item.replaceAll('Sun', '1').replaceAll('Mon', '2').replaceAll('Tue', '3').replaceAll('Wed', '4').replaceAll('Thu', '5').replaceAll('Fri', '6').replaceAll('Sat', '7'));
                            GetIncomeController.to.weeklyBudgetList?.refresh();

                            // controller.changeWeeklyBudgetDayList(item: item, index: index);
                            print(item);
                          }),
                      margin: EdgeInsets.only(right: Get.width * 0.02),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1000 ? 8 : 4,
                      ),
                      // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                      height: Get.height * 0.044,
                      alignment: Alignment.center,
                      child: commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: '${GetIncomeController.to.weeklyBudgetList?[index].every ?? 1}W',
                          // value: controller.weeklyBudgetWeekDropDownList[index],
                          itemList: weeks,
                          onChanged: (item) {
                            GetIncomeController.to.weeklyBudgetList?[index].every = int.parse(item.replaceAll('W', ''));
                            GetIncomeController.to.weeklyBudgetList?.refresh();
                            // controller.changeWeeklyBudgetWeekList(item: item, index: index);
                            print(item);
                          }),
                      margin: EdgeInsets.only(right: Get.width * 0.02),
                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context: context, index: index);
                      },
                      child: Container(
                        height: Get.height * 0.044,
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.010),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('dd-MM-yyyy').format(DateTime.parse(GetIncomeController.to.weeklyBudgetList![index].date.toString())),
                          // '${DateFormat('yyyy-MM-dd').format(currentDate)}',
                          style: dateStyle,
                          maxLines: 1,
                        ),
                        margin: EdgeInsets.only(right: Get.width * 0.02),
                        decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    StreamBuilder(
                        stream: whenErrorOnlyShowRedBorderAmountList.stream,
                        builder: (context, snapshot) {
                          return SizedBox(
                            height: checkBoxController.weeklyBudgetCheckBoxValueList[index]
                                ? whenErrorOnlyShowRedBorderAmountList[index].value == true
                                    ? Get.height * 0.07
                                    : Get.height * 0.044
                                : checkBoxController.weeklyBudgetCheckBoxValueList[index] == false
                                    ? Get.height * 0.044
                                    : Get.height * 0.07,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02),
                              child: commonTextFormField(
                                  hintText: amount,
                                  hintStyle: incomeNameStyle,
                                  prefixText: '\$',
                                  // errorBorder: whenErrorOnlyShowRedBorderAmountList[index].value
                                  //     ? OutlineInputBorder(
                                  //         borderSide: const BorderSide(color: Colors.red),
                                  //         borderRadius: BorderRadius.circular(4.0),
                                  //       )
                                  //     : null,
                                  // focusedErrorBorder: whenErrorOnlyShowRedBorderAmountList[index].value
                                  //     ? OutlineInputBorder(
                                  //         borderSide: const BorderSide(color: Colors.red),
                                  //         borderRadius: BorderRadius.circular(4.0),
                                  //       )
                                  //     : null,
                                  errorBorder: constraints.maxWidth > 1000
                                      ? checkBoxController.weeklyBudgetCheckBoxValueList[index]
                                          ? whenErrorOnlyShowRedBorderAmountList[index].value
                                              ? OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.red),
                                                  borderRadius: BorderRadius.circular(4.0),
                                                )
                                              : null
                                          : null
                                      : whenErrorOnlyShowRedBorderAmountList[index].value
                                          ? OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.red),
                                              borderRadius: BorderRadius.circular(4.0),
                                            )
                                          : null,
                                  focusedErrorBorder: whenErrorOnlyShowRedBorderAmountList[index].value
                                      ? OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.circular(4.0),
                                        )
                                      : null,
                                  validationFunction: (value) {
                                    if (whenErrorOnlyShowRedBorderAmountList[index].value != value.isEmpty) {
                                      whenErrorOnlyShowRedBorderAmountList[index].value = value.isEmpty;
                                      print(whenErrorOnlyShowRedBorderAmountList[index].value);
                                      whenErrorOnlyShowRedBorderAmountList.refresh();
                                    }
                                    // return whenErrorOnlyShowRedBorderAmountList[index].value == true ? '' : null;
                                    return checkBoxController.weeklyBudgetCheckBoxValueList[index]
                                        ? whenErrorOnlyShowRedBorderAmountList[index].value == true
                                            ? addAmount
                                            : null
                                        : null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  prefixstyle: incomeNameStyle,
                                  inputAction: TextInputAction.done,
                                  inputFormatter: [digitInputFormatter()],
                                  // contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  contentPadding: EdgeInsets.fromLTRB(10.0, constraints.maxWidth > 1000 ? Get.height * 0.030 : Get.height * 0.020, 10.0, 0.0),
                                  textEditingController: _amount,
                                  onChangedFunction: (value) {
                                    GetIncomeController.to.weeklyBudgetList?[index].amount = value.toString().isNotEmpty ? int.parse(value) : 0;
                                  }),
                            ),
                          );
                        }),
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
      GetIncomeController.to.weeklyBudgetList?[index!].date = currentDate.toString();
      GetIncomeController.to.weeklyBudgetList?.refresh();
    }
  }
}
