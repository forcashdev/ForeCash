import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/common_widget/mix_panel.dart';
import 'package:fore_cash/controller/checkbox_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/delete_income_expense_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/monthly_income_show_text_visibility.dart';
import 'package:fore_cash/controller/screen_index_controller.dart';
import 'package:fore_cash/controller/selected_dropdown_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MonthlyIncomeScreen extends StatefulWidget {
  const MonthlyIncomeScreen({Key? key}) : super(key: key);

  @override
  _MonthlyIncomeScreenState createState() => _MonthlyIncomeScreenState();
}

class _MonthlyIncomeScreenState extends State<MonthlyIncomeScreen> {
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final screenIndexController = Get.put(ScreenIndexController());
  final getIncomeController = Get.put(GetIncomeController());
  final addMonthlyIncomeTextVisibility = Get.put(AddMonthlyIncomeVisibilityController());
  final formKeyValidator = GlobalKey<FormState>();
  Rx<DateTime> currentDate = DateTime.now().obs;
  List<String> deleteMonthlyIncomeList = [];
  late final Mixpanel _mixpanel;
  Future<void> _initMixpanel() async {
    _mixpanel = await MixpanelManager.init();
    _mixpanel.track('$monthlyIncome' '$screen');
  }

  @override
  void initState() {
    super.initState();

    // GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "2"}).whenComplete(() {
    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "3"}).whenComplete(() {
      if (GetIncomeController.to.monthlyIncomeList!.isEmpty) {
        GetIncomeController.to.getMonthlyIncomeList();
      }
    });
    _initMixpanel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            screenIndexController.updateIndex(index: 1);
            return true;
          },
          child: StreamBuilder(
              stream: GetIncomeController.to.monthlyIncomeList?.stream,
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
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                          width: maxWidth ? Get.width / 1.4 : null,
                          height: maxWidth ? Get.height * 0.78 : null,
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: formKeyValidator,
                            child: Column(
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
                                            splashRadius: 0.1,
                                            onPressed: () {
                                              screenIndexController.updateIndex(index: 1);
                                            },
                                            icon: const Icon(
                                              Icons.chevron_left,
                                            )),
                                    maxWidth
                                        ? Container()
                                        : Align(
                                            alignment: const FractionalOffset(0.5, 0.0),
                                            child: Image.asset(
                                              foreCashLogo2,
                                              height: Get.height * 0.055,
                                              width: Get.height * 0.25,
                                            ),
                                          ),
                                    Container(),
                                  ],
                                ),
                                SizedBox(
                                  height: maxWidth ? Get.height * 0.03 : 0.0,
                                ),
                                maxWidth ? Container() : commonDivider(),
                                SizedBox(
                                  height: maxWidth ? Get.height * 0.02 : Get.height * 0.04,
                                ),
                                maxWidth
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextButton(
                                            onPressed: () {
                                              screenIndexController.updateIndex(index: 1);
                                            },
                                            child: Text(
                                              backButton,
                                              style: backButtonStyle,
                                            )))
                                    : const SizedBox(),
                                Text(
                                  selectMonthlyIncomes,
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
                                      text: identified,
                                      style: textSpanStyle1,
                                      children: [
                                        TextSpan(
                                          text: towards,
                                          style: textSpanStyle2,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                                    height: maxWidth ? double.infinity : null,
                                    decoration: BoxDecoration(color: Colors.white, border: maxWidth ? Border.all(color: color777C90.withOpacity(0.5)) : null, borderRadius: BorderRadius.circular(5)),
                                    child: Column(
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
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: [rowList(constraints: constraints, context: context), _addNewMonthlyIncomeWidget(constraints: constraints, context: context)],
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
              })),
    );
  }

  _addNewMonthlyIncomeWidget({BoxConstraints? constraints, BuildContext? context}) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: GetBuilder<AddMonthlyIncomeVisibilityController>(
        builder: (controller1) {
          // return Visibility(
          //   visible: controller1.monthlyIncomeVisibility,
          //   replacement: Padding(
          //     padding: EdgeInsets.only(bottom: Get.height * 0.03, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
          //     child: GestureDetector(
          //       onTap: () {
          //         // if (GetIncomeController.to.monthlyIncomeList?.length == 1) {
          //         //   GetIncomeController.to.monthlyIncomeList?[0].amount = int.parse(_amount!.text.toString());
          //         //   GetIncomeController.to.monthlyIncomeList?[0].name = _incomeName!.text;
          //         //   GetIncomeController.to.monthlyIncomeList?[0].incomeOutgoing = 1;
          //         //   GetIncomeController.to.monthlyIncomeList?[0].weekMonth = 2;
          //         //   GetIncomeController.to.monthlyIncomeList?[0].date = DateFormat('yyyy-MM-dd').format(DateTime.now());
          //         //
          //         //   // controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
          //         //   // controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
          //         //   // checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
          //         // }
          //         print(GetIncomeController.to.monthlyIncomeList);
          //         controller1.changeVisibility();
          //
          //         // _amount2.clear();
          //         // _incomeName2.clear();
          //       },
          //       child: Align(
          //         alignment: const FractionalOffset(0.015, 0.0),
          //         child: Text(
          //           addMonthlyIncome,
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
          //                       stream: whenErrorOnlyShowRedBorder.stream,
          //                       builder: (context, snapshot) {
          //                         return Padding(
          //                           padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
          //                           child: commonTextFormField(
          //                             hintText: addIncome,
          //                             hintStyle: incomeNameStyle,
          //                             inputAction: TextInputAction.done,
          //                             inputFormatter: [characterInputFormatter()],
          //                             contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
          //                             textStyle: incomeNameStyle,
          //                             textEditingController: _incomeName2,
          //                             enabledBorder: whenErrorOnlyShowRedBorder.value
          //                                 ? OutlineInputBorder(
          //                                     borderSide: const BorderSide(color: Colors.red),
          //                                     borderRadius: BorderRadius.circular(4.0),
          //                                   )
          //                                 : null,
          //                             validationFunction: (value) {
          //                               if (whenErrorOnlyShowRedBorder.value != value.isEmpty) {
          //                                 whenErrorOnlyShowRedBorder.value = value.isEmpty;
          //                                 print(whenErrorOnlyShowRedBorder.value);
          //                                 whenErrorOnlyShowRedBorder.refresh();
          //                               }
          //                               return null;
          //                             },
          //                           ),
          //                         );
          //                       }),
          //                 ),
          //                 TableCell(
          //                   verticalAlignment: TableCellVerticalAlignment.fill,
          //                   child: Container(
          //                     padding: const EdgeInsets.only(
          //                       left: 6,
          //                     ),
          //                     // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
          //                     // height: Get.height * 0.044,
          //                     alignment: Alignment.center,
          //                     child: dropDownDayGetBuilder(dropDownList: dateList),
          //                     margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
          //                     decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
          //                   ),
          //                 ),
          //                 TableCell(
          //                   verticalAlignment: TableCellVerticalAlignment.fill,
          //                   child: Container(
          //                     padding: const EdgeInsets.only(left: 6),
          //                     // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
          //                     // height: Get.height * 0.044,
          //                     alignment: Alignment.center,
          //                     child: dropDownWeekGetBuilder(dropDownList: months),
          //                     margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
          //                     decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
          //                   ),
          //                 ),
          //                 TableCell(
          //                   verticalAlignment: TableCellVerticalAlignment.fill,
          //                   child: StreamBuilder(
          //                       stream: currentDate.obs.stream,
          //                       builder: (context, snapshot) {
          //                         return GestureDetector(
          //                           onTap: () {
          //                             _selectDate(context: context);
          //                           },
          //                           child: Container(
          //                             // height: Get.height * 0.044,
          //                             alignment: Alignment.centerLeft,
          //                             child: Text(
          //                               DateFormat('yyyy-MM-dd').format(currentDate),
          //                               style: dateStyle,
          //                               maxLines: 1,
          //                             ),
          //                             margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
          //                             decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
          //                           ),
          //                         );
          //                       }),
          //                 ),
          //                 TableCell(
          //                   verticalAlignment: TableCellVerticalAlignment.fill,
          //                   child: StreamBuilder(
          //                       stream: whenErrorOnlyShowRedBorderAmount.stream,
          //                       builder: (context, snapshot) {
          //                         return Padding(
          //                           padding: EdgeInsets.only(right: Get.width * 0.02),
          //                           child: commonTextFormField(
          //                               prefixText: '\$',
          //                               keyboardType: TextInputType.phone,
          //                               prefixstyle: incomeNameStyle,
          //                               inputAction: TextInputAction.done,
          //                               enabledBorder: whenErrorOnlyShowRedBorder.value
          //                                   ? OutlineInputBorder(
          //                                       borderSide: const BorderSide(color: Colors.red),
          //                                       borderRadius: BorderRadius.circular(4.0),
          //                                     )
          //                                   : null,
          //                               validationFunction: (value) {
          //                                 if (whenErrorOnlyShowRedBorderAmount.value != value.isEmpty) {
          //                                   whenErrorOnlyShowRedBorderAmount.value = value.isEmpty;
          //                                   print(whenErrorOnlyShowRedBorderAmount.value);
          //                                   whenErrorOnlyShowRedBorderAmount.refresh();
          //                                 }
          //                                 return null;
          //                               },
          //                               inputFormatter: [digitInputFormatter()],
          //                               // contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
          //                               contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
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
          //           padding: EdgeInsets.only(top: Get.height * 0.01, left: constraints.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.018),
          //           child: Row(
          //             children: [
          //               SizedBox(
          //                 width: Get.width * 0.01,
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   if (controller.selectedMonth == null || controller.selectedDate == null) {
          //                     Fluttertoast.showToast(
          //                         webPosition: 'center',
          //                         msg: "Select DropDown",
          //                         toastLength: Toast.LENGTH_SHORT,
          //                         gravity: ToastGravity.BOTTOM,
          //                         // webBgColor: Colors.black.withOpacity(0.5), // also possible "TOP" and "CENTER"
          //                         // backgroundColor: Colors.black.withOpacity(0.5),
          //                         textColor: const Color(0xffffffff));
          //                   } else if (_formKeyValidator.currentState!.validate()) {
          //                     GetIncomeController.to.monthlyIncomeList?.add(DataModel(
          //                         name: _incomeName2.text,
          //                         amount: int.parse(_amount2.text),
          //                         incomeOutgoing: 1,
          //                         weekMonth: 2,
          //                         every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
          //                         paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
          //                         date: DateFormat('yyyy-MM-dd').format(currentDate)));
          //                     // controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
          //                     // controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
          //                     checkBoxController.monthlyIncomeCheckBoxValueList.add(true);
          //
          //                     controller1.changeVisibility();
          //                     _amount2.clear();
          //                     _incomeName2.clear();
          //                   }
          //
          //                   // if (_incomeName2.text.isNotEmpty && _amount2.text.isNotEmpty) {
          //                   // if (_formKeyValidator.currentState!.validate()) {
          //                   // setState(() {
          //                   // CreateIncomeController.to.IncomesList.add(MonthlyIncomeModel(
          //                   //     every: controller.selectedMonth, incomeName: _incomeName2.text, amount: _amount2.text, paidOn: controller.selectedDate, dateTime: currentDate));
          //
          //                   // GetIncomeController.to.monthlyIncomeList?.add(DataModel(
          //                   //     name: _incomeName2.text,
          //                   //     amount: int.parse(_amount2.text),
          //                   //     incomeOutgoing: 1,
          //                   //     weekMonth: 2,
          //                   //     every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
          //                   //     paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
          //                   //     date: DateFormat('yyyy-MM-dd').format(currentDate)));
          //                   // controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
          //                   // controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
          //                   // checkBoxController.monthlyIncomeCheckBoxValueList.add(true);
          //                   // });
          //                   // controller1.changeVisibility();
          //                   // }
          //                   // else {
          //                   //   setState(() {
          //                   //     validate = true;
          //                   //   });
          //                   // }
          //
          //                   // monthlyIncomeEditMode.showEditMode();
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
          return Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.03, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
            child: GestureDetector(
              onTap: () {
                GetIncomeController.to.monthlyIncomeList?.add(DataModel(
                  // amount: int.parse(''),
                  name: '',
                  date: DateTime.now().toString(),
                  onetimeWeekMonth: 3,
                  incomeOutgoing: 1, paidOn: 1, every: 1,
                ));
                checkBoxController.monthlyIncomeCheckBoxValueList.add(true);
                GetIncomeController.to.monthlyIncomeList?.refresh();
              },
              child: Align(
                alignment: const FractionalOffset(0.015, 0.0),
                child: Text(
                  addMonthlyIncome,
                  style: addWeekIncomeStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Future<void> _selectDate({BuildContext? context, int? index}) async {
  //   final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
  //   if (pickedDate != null && pickedDate != currentDate) {
  //     currentDate = pickedDate;
  //     GetIncomeController.to.monthlyIncomeList?[index!].date = currentDate.toString();
  //     GetIncomeController.to.monthlyIncomeList?.refresh();
  //   }
  // }

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
          const SizedBox(),
          Padding(
            padding: EdgeInsets.only(left: constraints!.maxWidth > 1000 ? 5 : 0.0),
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

  _nextButtonWidget({BoxConstraints? constraints}) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: constraints!.maxWidth < 1000 ? Get.height * 0.010 : Get.height * 0.03,
          left: constraints.maxWidth > 1000 ? Get.width * 0.15 : Get.width * 0.04,
          right: constraints.maxWidth > 1000 ? Get.width * 0.15 : Get.width * 0.04,
          top: Get.width * 0.016),
      child: commonButton(
        height: 50,
        text: next,
        onPress: () {
          if (formKeyValidator.currentState!.validate()) {
            if (constraints.maxWidth < 1000) {
              CreateIncomeController.to.createIncome(screenIndex: 3, parameter: {rUpsertIncome: GetIncomeController.to.monthlyIncomeList}).whenComplete(() {
                if (DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.isNotEmpty) {
                  DeleteIncomeExpenseController.to.callDelete(idList: DeleteIncomeExpenseController.to.deleteMonthlyIncomeList).whenComplete(() {
                    DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.clear();
                  });
                }
              });
            } else {
              List<DataModel> tempMonthlyIncome = [];
              checkBoxController.monthlyIncomeCheckBoxValueList.asMap().forEach((index, value) {
                if (value) {
                  print(value);
                  tempMonthlyIncome.add(GetIncomeController.to.monthlyIncomeList![index]);
                } else {
                  if (GetIncomeController.to.monthlyIncomeList![index].id != null) {
                    DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.add(GetIncomeController.to.monthlyIncomeList![index].id!);
                  }
                }
              });
              CreateIncomeController.to.createIncome(screenIndex: 3, parameter: {rUpsertIncome: tempMonthlyIncome}).whenComplete(() {
                if (DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.isNotEmpty) {
                  DeleteIncomeExpenseController.to.callDelete(idList: DeleteIncomeExpenseController.to.deleteMonthlyIncomeList).whenComplete(() {
                    DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.clear();
                  });
                }
              });
            }
          }
          GetIncomeController.to.weeklyIncomesList?.clear();
          GetIncomeController.to.weeklyIncomesList?.refresh();
          CheckBoxController.to.weeklyIncomeCheckBoxValueList.clear();
        },
      ),
    );
  }

  rowList({BoxConstraints? constraints, BuildContext? context}) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: GetIncomeController.to.monthlyIncomeList?.length,
      itemBuilder: (context, index) {
        TextEditingController? _incomeName;
        TextEditingController? _amount;
        _incomeName = TextEditingController(text: GetIncomeController.to.monthlyIncomeList?[index].name ?? '');
        _amount = TextEditingController(text: GetIncomeController.to.monthlyIncomeList?[index].amount.toString().replaceAll('null', '') ?? '');
        RxList<RxBool> whenErrorOnlyShowRedBorderList = List.generate(GetIncomeController.to.monthlyIncomeList!.length, (index) => false.obs).obs;
        RxList<RxBool> whenErrorOnlyShowRedBorderAmountList = List.generate(GetIncomeController.to.monthlyIncomeList!.length, (index) => false.obs).obs;
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SwipeActionCell(
            isDraggable: constraints!.maxWidth > 1000 ? false : true,
            backgroundColor: Colors.transparent,
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
                        if (GetIncomeController.to.monthlyIncomeList![index].id == null) {
                          GetIncomeController.to.monthlyIncomeList?.removeAt(index);
                        } else {
                          DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.add(GetIncomeController.to.monthlyIncomeList![index].id!);
                          GetIncomeController.to.monthlyIncomeList?.removeAt(index);
                        }

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
                            margin: EdgeInsets.only(right: Get.width * 0.02),
                            decoration: BoxDecoration(color: color12CC8E, borderRadius: BorderRadius.circular(2)),
                          )
                        : SizedBox(
                            height: Get.height * 0.044,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: GetBuilder<CheckBoxController>(
                                builder: (controller) {
                                  return Checkbox(
                                    activeColor: color12CC8E,
                                    checkColor: Colors.white,
                                    value: checkBoxController.monthlyIncomeCheckBoxValueList[index],
                                    onChanged: (value) {
                                      checkBoxController.selectCheckBox(value: value, index: index);
                                    },
                                  );
                                },
                              ),
                            )),
                    StreamBuilder(
                        stream: whenErrorOnlyShowRedBorderList.stream,
                        builder: (context, snapshot) {
                          return SizedBox(
                            // color: Colors.redAccent,
                            // height: whenErrorOnlyShowRedBorderList[index].value == true ? Get.height * 0.07 : Get.height * 0.044,
                            height: checkBoxController.monthlyIncomeCheckBoxValueList[index]
                                ? whenErrorOnlyShowRedBorderList[index].value == true
                                    ? Get.height * 0.07
                                    : Get.height * 0.044
                                : checkBoxController.monthlyIncomeCheckBoxValueList[index] == false
                                    ? Get.height * 0.044
                                    : Get.height * 0.07,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02, left: constraints.maxWidth > 1000 ? 5 : 0.0),
                              child: commonTextFormField(
                                errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                // isErrorShow: whenErrorOnlyShowRedBorder.value,
                                textEditingController: _incomeName,
                                onChangedFunction: (value) {
                                  GetIncomeController.to.monthlyIncomeList?[index].name = value;
                                },
                                // focusedErrorBorder: whenErrorOnlyShowRedBorderList[index].value
                                //     ? OutlineInputBorder(
                                //         borderSide: const BorderSide(color: Colors.red),
                                //         borderRadius: BorderRadius.circular(4.0),
                                //       )
                                //     : null,
                                // errorBorder: whenErrorOnlyShowRedBorderList[index].value
                                //     ? OutlineInputBorder(
                                //         borderSide: const BorderSide(color: Colors.red),
                                //         borderRadius: BorderRadius.circular(
                                //           4.0,
                                //         ),
                                //       )
                                //     : null,
                                errorBorder: constraints.maxWidth > 1000
                                    ? checkBoxController.monthlyIncomeCheckBoxValueList[index]
                                        ? whenErrorOnlyShowRedBorderList[index].value
                                            ? OutlineInputBorder(
                                                borderSide: const BorderSide(color: colorsEE4242),
                                                borderRadius: BorderRadius.circular(4.0),
                                              )
                                            : null
                                        : null
                                    : whenErrorOnlyShowRedBorderList[index].value
                                        ? OutlineInputBorder(
                                            borderSide: const BorderSide(color: colorsEE4242),
                                            borderRadius: BorderRadius.circular(4.0),
                                          )
                                        : null,
                                focusedErrorBorder: whenErrorOnlyShowRedBorderList[index].value
                                    ? OutlineInputBorder(
                                        borderSide: const BorderSide(color: colorsEE4242),
                                        borderRadius: BorderRadius.circular(4.0),
                                      )
                                    : null,
                                validationFunction: (value) {
                                  if (whenErrorOnlyShowRedBorderList[index].value != value.isEmpty) {
                                    whenErrorOnlyShowRedBorderList[index].value = value.isEmpty;
                                    print(whenErrorOnlyShowRedBorderList[index].value);
                                    whenErrorOnlyShowRedBorderList.refresh();
                                  }
                                  // return whenErrorOnlyShowRedBorderList[index].value == true ? 'Add Income Name' : null;
                                  return checkBoxController.monthlyIncomeCheckBoxValueList[index]
                                      ? whenErrorOnlyShowRedBorderList[index].value == true
                                          ? addIncomeName
                                          : null
                                      : null;
                                },
                                hintText: incomeName,
                                hintStyle: incomeNameStyle,
                                inputAction: TextInputAction.next,
                                inputFormatter: [characterInputFormatter()],
                                // contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                contentPadding: EdgeInsets.fromLTRB(10.0, constraints.maxWidth > 1000 ? Get.height * 0.030 : Get.height * 0.020, 10.0, 0.0),
                                textStyle: incomeNameStyle,
                              ),
                            ),
                          );
                        }),
                    Container(
                      height: Get.height * 0.044,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1000 ? 8 : 4,
                      ),
                      alignment: Alignment.center,
                      child: commonDropDown(
                          hintText: date,
                          hintTextStyle: dropDownStyle2,
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: '${GetIncomeController.to.monthlyIncomeList?[index].paidOn ?? 1}th'
                              .replaceAllMapped('1th', (match) => '1st')
                              .replaceAllMapped('2th', (match) => '2nd')
                              .replaceAllMapped('3th', (match) => '3rd')
                              .replaceAllMapped('11st', (match) => '11th')
                              .replaceAllMapped('12nd', (match) => '12th')
                              .replaceAllMapped('13rd', (match) => '13th'),
                          itemList: dateList,
                          onChanged: (item) {
                            GetIncomeController.to.monthlyIncomeList?[index].paidOn = int.parse(item.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', ''));
                            GetIncomeController.to.monthlyIncomeList?.refresh();
                          }),
                      margin: EdgeInsets.only(right: Get.width * 0.02),
                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      height: Get.height * 0.044,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1000 ? 8 : 4,
                      ),
                      alignment: Alignment.center,
                      child: commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: '${GetIncomeController.to.monthlyIncomeList?[index].every ?? 1} mon',
                          itemList: months,
                          onChanged: (item) {
                            GetIncomeController.to.monthlyIncomeList?[index].every = int.parse(item.replaceAll('mon', '').replaceAll(' ', ''));
                            GetIncomeController.to.monthlyIncomeList?.refresh();
                          }),
                      margin: EdgeInsets.only(right: Get.width * 0.02),
                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectDate(
                            context: context,
                            currentDate: currentDate,
                            onChange: () {
                              GetIncomeController.to.monthlyIncomeList?[index].date = currentDate.value.toString();
                              GetIncomeController.to.monthlyIncomeList?.refresh();
                            });
                      },
                      child: Container(
                        height: Get.height * 0.044,
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.010),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('dd-MM-yyyy').format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![index].date.toString())),
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
                            height: checkBoxController.monthlyIncomeCheckBoxValueList[index]
                                ? whenErrorOnlyShowRedBorderAmountList[index].value == true
                                    ? Get.height * 0.07
                                    : Get.height * 0.044
                                : checkBoxController.monthlyIncomeCheckBoxValueList[index] == false
                                    ? Get.height * 0.044
                                    : Get.height * 0.07,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02),
                              child: commonTextFormField(
                                textEditingController: _amount,
                                hintText: amount,
                                hintStyle: incomeNameStyle,
                                prefixText: '\$',
                                keyboardType: TextInputType.phone,
                                prefixstyle: incomeNameStyle,
                                inputAction: TextInputAction.done,
                                errorBorder: constraints.maxWidth > 1000
                                    ? checkBoxController.monthlyIncomeCheckBoxValueList[index]
                                        ? whenErrorOnlyShowRedBorderAmountList[index].value
                                            ? OutlineInputBorder(
                                                borderSide: const BorderSide(color: colorsEE4242),
                                                borderRadius: BorderRadius.circular(4.0),
                                              )
                                            : null
                                        : null
                                    : whenErrorOnlyShowRedBorderAmountList[index].value
                                        ? OutlineInputBorder(
                                            borderSide: const BorderSide(color: colorsEE4242),
                                            borderRadius: BorderRadius.circular(4.0),
                                          )
                                        : null,
                                focusedErrorBorder: whenErrorOnlyShowRedBorderAmountList[index].value
                                    ? OutlineInputBorder(
                                        borderSide: const BorderSide(color: colorsEE4242),
                                        borderRadius: BorderRadius.circular(4.0),
                                      )
                                    : null,
                                validationFunction: (value) {
                                  if (whenErrorOnlyShowRedBorderAmountList[index].value != value.isEmpty) {
                                    whenErrorOnlyShowRedBorderAmountList[index].value = value.isEmpty;
                                    print(whenErrorOnlyShowRedBorderAmountList[index].value);
                                    whenErrorOnlyShowRedBorderAmountList.refresh();
                                  }
                                  return checkBoxController.monthlyIncomeCheckBoxValueList[index]
                                      ? whenErrorOnlyShowRedBorderAmountList[index].value == true
                                          ? addAmount
                                          : null
                                      : null;
                                },
                                onChangedFunction: (value) {
                                  // GetIncomeController.to.monthlyIncomeList?[index].amount = int.parse(value);
                                  GetIncomeController.to.monthlyIncomeList?[index].amount = value.toString().isNotEmpty ? int.parse(value) : 0;
                                },
                                inputFormatter: [digitInputFormatter()],
                                contentPadding: EdgeInsets.fromLTRB(10.0, constraints.maxWidth > 1000 ? Get.height * 0.030 : Get.height * 0.020, 10.0, 0.0),
                                textStyle: incomeNameStyle,
                              ),
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
}
