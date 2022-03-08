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

class MonthlyExpensesScreen extends StatefulWidget {
  const MonthlyExpensesScreen({Key? key}) : super(key: key);

  @override
  _MonthlyExpensesScreenState createState() => _MonthlyExpensesScreenState();
}

class _MonthlyExpensesScreenState extends State<MonthlyExpensesScreen> {
  final TextEditingController _expenseName2 = TextEditingController();
  final TextEditingController _expenseAmount2 = TextEditingController();

  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final getIncomeController = Get.put(GetIncomeController());
  final screenIndexController = Get.put(ScreenIndexController());
  DateTime currentDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "week_month": "2"}).whenComplete(() {
      if (GetIncomeController.to.monthlyExpenseList!.isEmpty) {
        GetIncomeController.to.getMonthlyExpenseList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 3);
          GetIncomeController.to.weeklyIncomesList?.clear();
          GetIncomeController.to.weeklyIncomesList?.refresh();
          CheckBoxController.to.weeklyIncomeCheckBoxValueList.clear();
          return false;
        },
        child: StreamBuilder(
            stream: GetIncomeController.to.monthlyExpenseList?.stream,
            builder: (context, snapshot) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth > 1000;
                  return Scaffold(
                    backgroundColor: maxWidth ? backGroundColor : Colors.white,
                    body: Align(
                      alignment: maxWidth ? Alignment.center : Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                        decoration: BoxDecoration(color: maxWidth ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
                        width: maxWidth ? Get.width / 1.4 : null,
                        height: maxWidth ? Get.height * 0.78 : null,
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Column(
                            children: [
                              _headerWidget(constraints: constraints),
                              Expanded(
                                flex: maxWidth ? 2 : 2,
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                      GetIncomeController.to.weeklyIncomesList?.clear();
                      GetIncomeController.to.weeklyIncomesList?.refresh();
                      CheckBoxController.to.weeklyIncomeCheckBoxValueList.clear();
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
                      GetIncomeController.to.weeklyIncomesList?.clear();
                      GetIncomeController.to.weeklyIncomesList?.refresh();
                      CheckBoxController.to.weeklyIncomeCheckBoxValueList.clear();
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
      itemCount: GetIncomeController.to.monthlyExpenseList?.length,
      itemBuilder: (context, index) {
        TextEditingController? _monthlyExpenseName;
        TextEditingController? _monthlyAmount;
        RxBool whenErrorOnlyShowRedBorder = false.obs;
        RxBool whenErrorOnlyShowRedBorderAmount = false.obs;
        RxList<RxBool> whenErrorOnlyShowRedBorderList = List.generate(GetIncomeController.to.monthlyExpenseList!.length, (index) => false.obs).obs;
        RxList<RxBool> whenErrorOnlyShowRedBorderAmountList = List.generate(GetIncomeController.to.monthlyExpenseList!.length, (index) => false.obs).obs;
        _monthlyExpenseName = TextEditingController(text: GetIncomeController.to.monthlyExpenseList?[index].name ?? '');
        _monthlyAmount = TextEditingController(text: GetIncomeController.to.monthlyExpenseList?[index].amount.toString().replaceAll('null', '') ?? '');
        return Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.019),
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
                        GetIncomeController.to.monthlyExpenseList?.removeAt(index);
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
                    StreamBuilder(
                        stream: whenErrorOnlyShowRedBorderList.stream,
                        builder: (context, snapshot) {
                          return SizedBox(
                            // height: whenErrorOnlyShowRedBorderList[index].value == true ? Get.height * 0.07 : Get.height * 0.044,
                            height: checkBoxController.monthlyExpenseCheckBoxValueList[index]
                                ? whenErrorOnlyShowRedBorderList[index].value == true
                                    ? Get.height * 0.07
                                    : Get.height * 0.044
                                : checkBoxController.monthlyExpenseCheckBoxValueList[index] == false
                                    ? Get.height * 0.044
                                    : Get.height * 0.07,
                            child: Padding(
                                padding: EdgeInsets.only(right: Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                                child: commonTextFormField(
                                    errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                    hintText: expenseName,
                                    hintStyle: incomeNameStyle,
                                    inputAction: TextInputAction.next,
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
                                        ? checkBoxController.monthlyExpenseCheckBoxValueList[index]
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
                                      return checkBoxController.monthlyExpenseCheckBoxValueList[index]
                                          ? whenErrorOnlyShowRedBorderList[index].value == true
                                              ? addExpenseName
                                              : null
                                          : null;
                                    },
                                    inputFormatter: [characterInputFormatter()],
                                    // contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                    contentPadding: EdgeInsets.fromLTRB(10.0, constraints.maxWidth > 1000 ? Get.height * 0.030 : Get.height * 0.020, 10.0, 0.0),
                                    textStyle: incomeNameStyle,
                                    textEditingController: _monthlyExpenseName,
                                    onChangedFunction: (value) {
                                      GetIncomeController.to.monthlyExpenseList?[index].name = value;
                                    })),
                          );
                        }),
                    Container(
                      height: Get.height * 0.044,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1000 ? 8 : 4,
                      ),
                      child: commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: '${GetIncomeController.to.monthlyExpenseList?[index].paidOn ?? 1}th'
                              .replaceAllMapped('1th', (match) => '1st')
                              .replaceAllMapped('2th', (match) => '2nd')
                              .replaceAllMapped('3th', (match) => '3rd')
                              .replaceAllMapped('11st', (match) => '11th')
                              .replaceAllMapped('12nd', (match) => '12th')
                              .replaceAllMapped('13rd', (match) => '13th'),
                          itemList: dateList,
                          onChanged: (item) {
                            GetIncomeController.to.monthlyExpenseList?[index].paidOn = int.parse(item.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', ''));
                            GetIncomeController.to.monthlyExpenseList?.refresh();
                            // controller.changeMonthlyExpenseDate(item: item, index: index);
                            print(item);
                          }),
                      margin: EdgeInsets.only(right: Get.width * 0.02),
                      decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      height: Get.height * 0.044,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1000 ? 8 : 4,
                      ),
                      // width: widget.constraints!.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                      // height: Get.height * 0.044,

                      child: commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: '${GetIncomeController.to.monthlyExpenseList?[index].every ?? 1} mon',
                          // value: controller.selectedMonthlyExpenseMonth[index],
                          itemList: months,
                          onChanged: (item) {
                            GetIncomeController.to.monthlyExpenseList?[index].every = int.parse(item.replaceAll('mon', '').replaceAll(' ', ''));
                            GetIncomeController.to.monthlyExpenseList?.refresh();
                            // controller.changeMonthlyExpenseMonth(item: item, index: index);
                            print(item);
                          }),
                      margin: EdgeInsets.only(right: Get.width * 0.02),
                      decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
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
                          DateFormat('dd-MM-yyyy').format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![index].date.toString())),
                          // '${DateFormat('yyyy-MM-dd').format(currentDate)}',
                          style: dateStyle,
                          maxLines: 1,
                        ),
                        margin: EdgeInsets.only(right: Get.width * 0.02),
                        decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    StreamBuilder(
                        stream: whenErrorOnlyShowRedBorderAmountList.stream,
                        builder: (context, snapshot) {
                          return SizedBox(
                            // height: whenErrorOnlyShowRedBorderAmountList[index].value == true ? Get.height * 0.07 : Get.height * 0.044,
                            height: checkBoxController.monthlyExpenseCheckBoxValueList[index]
                                ? whenErrorOnlyShowRedBorderAmountList[index].value == true
                                    ? Get.height * 0.07
                                    : Get.height * 0.044
                                : checkBoxController.monthlyExpenseCheckBoxValueList[index] == false
                                    ? Get.height * 0.044
                                    : Get.height * 0.07,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02),
                              child: commonTextFormField(
                                  hintText: amount,
                                  hintStyle: incomeNameStyle,
                                  prefixText: '\$',
                                  prefixstyle: incomeNameStyle,
                                  keyboardType: TextInputType.phone,
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
                                      ? checkBoxController.monthlyExpenseCheckBoxValueList[index]
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
                                    return checkBoxController.monthlyExpenseCheckBoxValueList[index]
                                        ? whenErrorOnlyShowRedBorderAmountList[index].value == true
                                            ? addAmount
                                            : null
                                        : null;
                                  },
                                  inputAction: TextInputAction.done,
                                  inputFormatter: [digitInputFormatter()],
                                  // contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  contentPadding: EdgeInsets.fromLTRB(10.0, constraints.maxWidth > 1000 ? Get.height * 0.030 : Get.height * 0.020, 10.0, 0.0),
                                  textEditingController: _monthlyAmount,
                                  onChangedFunction: (value) {
                                    GetIncomeController.to.monthlyExpenseList?[index].amount = int.parse(value);
                                  }),
                            ),
                          );
                        })
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
      GetIncomeController.to.monthlyExpenseList?[index!].date = currentDate.toString();
      GetIncomeController.to.monthlyExpenseList?.refresh();
    }
  }

  _addNewMonthlyExpenseWidget({BoxConstraints? constraints}) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: GetBuilder<VisibilityController>(
        builder: (controller1) {
          RxBool whenErrorShowRedBorder = false.obs;
          RxBool whenErrorShowRedBorderAmount = false.obs;
          return Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.01, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
            child: GestureDetector(
              onTap: () {
                GetIncomeController.to.monthlyExpenseList?.add(DataModel(
                  name: '',
                  date: DateTime.now().toString(),
                  weekMonth: 2,
                  incomeOutgoing: 2,
                  paidOn: 1,
                  every: 1,
                ));
                checkBoxController.monthlyExpenseCheckBoxValueList.add(true);
                GetIncomeController.to.monthlyExpenseList?.refresh();
                // visibilityController.changeVisibility();
              },
              child: Align(
                alignment: const FractionalOffset(0.015, 0.0),
                child: Text(
                  addMonthlyExpense,
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
          //         visibilityController.changeVisibility();
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
          //                               inputAction: TextInputAction.next,
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
          //                       horizontal: 4,
          //                     ),
          //                     // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
          //                     // height: Get.height * 0.044,
          //                     // alignment: Alignment.center,
          //                     child: dropDownDayGetBuilder(dropDownList: dateList),
          //                     margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
          //                     decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
          //                   ),
          //                 ),
          //                 TableCell(
          //                   verticalAlignment: TableCellVerticalAlignment.fill,
          //                   child: Container(
          //                     padding: const EdgeInsets.symmetric(horizontal: 4),
          //                     // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
          //                     // height: Get.height * 0.044,
          //                     // alignment: Alignment.center,
          //                     child: dropDownWeekGetBuilder(dropDownList: months),
          //                     margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
          //                     decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
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
          //                         decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
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
          //                               prefixstyle: incomeNameStyle,
          //                               inputAction: TextInputAction.done,
          //                               inputFormatter: [digitInputFormatter()],
          //                               contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
          //                               textStyle: incomeNameStyle,
          //                               textEditingController: _expenseAmount2),
          //                         );
          //                       }),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(top: Get.height * 0.01, left: constraints.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.018),
          //           child: Row(
          //             children: [
          //               SizedBox(
          //                 width: Get.width * 0.01,
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   if (controller.selectedSingleMonthlyExpenseMonth == null || controller.selectedSingleMonthlyExpenseDate == null) {
          //                     Fluttertoast.showToast(
          //                         webPosition: 'center',
          //                         msg: "Select DropDown",
          //                         toastLength: Toast.LENGTH_SHORT,
          //                         gravity: ToastGravity.BOTTOM,
          //                         // webBgColor: Colors.black.withOpacity(0.5), // also possible "TOP" and "CENTER"
          //                         // backgroundColor: Colors.black.withOpacity(0.5),
          //                         textColor: const Color(0xffffffff));
          //                   } else if (_formKey.currentState!.validate()) {
          //                     GetIncomeController.to.monthlyExpenseList?.add(DataModel(
          //                         name: _expenseName2.text,
          //                         amount: int.parse(_expenseAmount2.text),
          //                         incomeOutgoing: 2,
          //                         weekMonth: 2,
          //                         every: int.parse(controller.selectedSingleMonthlyExpenseMonth!.replaceAll('mon', '').replaceAll(' ', '')),
          //                         paidOn: int.parse(controller.selectedSingleMonthlyExpenseDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
          //                         date: DateFormat('yyyy-MM-dd').format(currentDate)));
          //                     checkBoxController.monthlyExpenseCheckBoxValueList.add(true);
          //                     controller1.changeVisibility();
          //                     _expenseName2.clear();
          //                     _expenseAmount2.clear();
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
          //               )
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
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
          if (_formKey.currentState!.validate()) {
            if (constraints.maxWidth < 1000) {
              CreateIncomeController.to.createIncome(screenIndex: 5, parameter: {'income': GetIncomeController.to.monthlyExpenseList});
            } else {
              List<DataModel> tempMonthlyExpenseList = [];
              checkBoxController.monthlyExpenseCheckBoxValueList.asMap().forEach((index, value) {
                if (value) {
                  tempMonthlyExpenseList.add(GetIncomeController.to.monthlyExpenseList!.value[index]);
                }
              });

              CreateIncomeController.to.createIncome(screenIndex: 5, parameter: {'income': tempMonthlyExpenseList});
            }
            GetIncomeController.to.weeklyBudgetList?.clear();
            GetIncomeController.to.weeklyBudgetList?.refresh();
            CheckBoxController.to.weeklyBudgetCheckBoxValueList.clear();
          }
        },
      ),
    );
  }
}
