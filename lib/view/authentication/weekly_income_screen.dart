import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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

class WeeklyIncomeScreen extends StatefulWidget {
  const WeeklyIncomeScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyIncomeScreen> createState() => _WeeklyIncomeScreenState();
}

class _WeeklyIncomeScreenState extends State<WeeklyIncomeScreen> {
  final TextEditingController _incomeName2 = TextEditingController();
  final TextEditingController _amount2 = TextEditingController();
  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());

  final checkBoxController = Get.put(CheckBoxController());
  final screenIndexController = Get.put(ScreenIndexController());
  DateTime currentDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // GetIncomeController.to.weeklyIncomesList!.clear();
    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "1"}).whenComplete(() {
      if (GetIncomeController.to.weeklyIncomesList!.isEmpty) {
        GetIncomeController.to.getWeeklyIncomeList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 2);
          GetIncomeController.to.monthlyIncomeList?.clear();
          GetIncomeController.to.monthlyIncomeList?.refresh();
          CheckBoxController.to.monthlyIncomeCheckBoxValueList.clear();
          return false;
        },
        child: StreamBuilder(
            stream: GetIncomeController.to.weeklyIncomesList?.stream,
            builder: (context, snapshot) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth > 1000;
                  return Scaffold(
                    backgroundColor: maxWidth ? colorEDF2F6 : Colors.white,
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
                              _headerColumn(constraints: constraints),
                              Expanded(
                                flex: maxWidth ? 2 : 2,
                                child: Container(
                                  // height: constraints.maxWidth > 1000 ? double.infinity : null,
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(border: maxWidth ? Border.all(color: color777C90.withOpacity(0.5)) : null, borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: maxWidth ? Get.height * 0.015 : 0.0,
                                      ),
                                      _nameTableRowWidget(),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      maxWidth
                                          ? Divider(
                                              color: color777C90.withOpacity(0.5),
                                            )
                                          : Container(),
                                      SizedBox(
                                        height: maxWidth ? Get.height * 0.005 : Get.height * 0.005,
                                      ),
                                      Expanded(
                                        flex: maxWidth ? 2 : 2,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              _weeklyincomeRowList(constraints: constraints),
                                              _addNewWeeklyIncomeWidget(constraints: constraints),
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
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              Text(
                incomeName,
                style: columnNameListStyle,
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

  _addNewWeeklyIncomeWidget({BoxConstraints? constraints}) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: GetBuilder<VisibilityController>(
        builder: (controller1) {
          RxBool whenErrorShowRedBorder = false.obs;
          RxBool whenErrorShowRedBorderAmount = false.obs;
          return Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.03, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
            child: GestureDetector(
              onTap: () {
                // visibilityController.changeVisibility();
                GetIncomeController.to.weeklyIncomesList?.add(DataModel(
                  name: '',
                  date: DateTime.now().toString(),
                  paidOn: 1, every: 1,
                  // amount: 0,
                  incomeOutgoing: 1,
                  weekMonth: 1,
                ));
                checkBoxController.weeklyIncomeCheckBoxValueList.add(true);
                GetIncomeController.to.weeklyIncomesList?.refresh();
              },
              child: Align(
                alignment: const FractionalOffset(0.015, 0.0),
                child: Text(
                  addWeeklyIncome,
                  style: addWeekIncomeStyle,
                ),
              ),
            ),
          );
          //   Visibility(
          //   visible: controller1.visibility,
          //   replacement: Padding(
          //     padding: EdgeInsets.only(bottom: Get.height * 0.03, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
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
          //                             hintText: addIncome,
          //                             hintStyle: incomeNameStyle,
          //                             inputAction: TextInputAction.next,
          //                             inputFormatter: [characterInputFormatter()],
          //                             contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
          //                             textStyle: incomeNameStyle,
          //                             textEditingController: _incomeName2,
          //                             enabledBorder: whenErrorShowRedBorder.value
          //                                 ? OutlineInputBorder(
          //                                     borderSide: const BorderSide(color: Colors.red),
          //                                     borderRadius: BorderRadius.circular(4.0),
          //                                   )
          //                                 : null,
          //                             validationFunction: (value) {
          //                               if (whenErrorShowRedBorder.value != value.isEmpty) {
          //                                 whenErrorShowRedBorder.value = value.isEmpty;
          //                                 print(whenErrorShowRedBorder.value);
          //                                 whenErrorShowRedBorder.refresh();
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
          //                     child: dropDownDayGetBuilder(dropDownList: days),
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
          //                           DateFormat('yyyy-MM-dd').format(currentDate),
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
          //                               keyboardType: TextInputType.phone,
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
          //           padding: EdgeInsets.only(top: Get.height * 0.01, left: constraints.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.018),
          //           child: Row(
          //             children: [
          //               SizedBox(
          //                 width: Get.width * 0.01,
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   if (controller.selectedSingleWeeklyIncomeWeek == null || controller.selectedSingleWeeklyIncomeDay == null) {
          //                     Fluttertoast.showToast(
          //                         webPosition: 'center',
          //                         msg: "Select DropDown",
          //                         toastLength: Toast.LENGTH_SHORT,
          //                         gravity: ToastGravity.BOTTOM,
          //                         // webBgColor: Colors.black.withOpacity(0.5), // also possible "TOP" and "CENTER"
          //                         // backgroundColor: Colors.black.withOpacity(0.5),
          //                         textColor: const Color(0xffffffff));
          //                   } else if (_formKey.currentState!.validate()) {
          //                     GetIncomeController.to.weeklyIncomesList?.add(DataModel(
          //                         name: _incomeName2.text,
          //                         amount: int.parse(_amount2.text),
          //                         incomeOutgoing: 1,
          //                         weekMonth: 1,
          //                         paidOn: int.parse(controller.selectedSingleWeeklyIncomeDay
          //                             .toString()
          //                             .replaceAll('Sun', '1')
          //                             .replaceAll('Mon', '2')
          //                             .replaceAll('Tue', '3')
          //                             .replaceAll('Wed', '4')
          //                             .replaceAll('Thu', '5')
          //                             .replaceAll('Fri', '6')
          //                             .replaceAll('Sat', '7')),
          //                         // every: controller.selectedSingleWeeklyIncomeDay!.replaceAll('Sun', int.parse('1'.toString()).toInt()),
          //                         every: int.parse(controller.selectedSingleWeeklyIncomeWeek!.replaceAll('W', '')),
          //                         date: currentDate.toString()));
          //
          //                     // controller.selectDayDropDown.add(controller.selectedSingleWeeklyIncomeDay as Object);
          //                     // controller.selectWeekDropDown.add(controller.selectedSingleWeeklyIncomeWeek as Object);
          //                     checkBoxController.weeklyIncomeCheckBoxValueList.add(true);
          //                     // });
          //                     controller1.changeVisibility();
          //                     _amount2.clear();
          //                     _incomeName2.clear();
          //                   }
          //                   // _amount?.clear();
          //                   // _incomeName?.clear();
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
        },
      ),
    );
  }

  _headerColumn({BoxConstraints? constraints}) {
    final maxWidth = constraints!.maxWidth > 1000;
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            maxWidth
                ? const SizedBox()
                : IconButton(
                    splashRadius: 0.1,
                    onPressed: () {
                      screenIndexController.updateIndex(index: 2);
                      // GetIncomeController.to.weeklyIncomesList?.clear();
                      GetIncomeController.to.monthlyIncomeList?.clear();
                      GetIncomeController.to.monthlyIncomeList?.refresh();
                      CheckBoxController.to.monthlyIncomeCheckBoxValueList.clear();
                      // Navigator.pop(context);
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
        maxWidth ? Container() : commonDivider(),
        SizedBox(
          height: Get.height * 0.04,
        ),
        maxWidth
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      screenIndexController.updateIndex(index: 2);
                      // GetIncomeController.to.weeklyIncomesList?.clear();
                      GetIncomeController.to.monthlyIncomeList?.clear();
                      GetIncomeController.to.monthlyIncomeList?.refresh();
                      CheckBoxController.to.monthlyIncomeCheckBoxValueList.clear();
                      // Navigator.pop(context);
                    },
                    child: Text(
                      backButton,
                      style: backButtonStyle,
                    )))
            : const SizedBox(),
        Text(
          selectWeeklyIncome,
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
              text: weeklyIncomeSubTitle,
              style: textSpanStyle1,
              children: [TextSpan(text: weeklyIncomeSubTitle2, style: textSpanStyle2)],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
      ],
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
              CreateIncomeController.to.createIncome(screenIndex: 4, parameter: {'income': GetIncomeController.to.weeklyIncomesList});
            } else {
              List<DataModel> tempWeeklyIncomeList = [];
              checkBoxController.weeklyIncomeCheckBoxValueList.asMap().forEach((index, value) {
                if (value) {
                  tempWeeklyIncomeList.add(GetIncomeController.to.weeklyIncomesList!.value[index]);
                }
              });
              CreateIncomeController.to.createIncome(screenIndex: 4, parameter: {'income': tempWeeklyIncomeList});
              // GetIncomeController.to.weeklyIncomesList?.clear();

            }
            GetIncomeController.to.monthlyExpenseList?.clear();
            GetIncomeController.to.monthlyExpenseList?.refresh();
            CheckBoxController.to.monthlyExpenseCheckBoxValueList.clear();
          }
        },
      ),
    );
  }

  Future<void> _selectDate({BuildContext? context, int? index}) async {
    final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
      GetIncomeController.to.weeklyIncomesList?[index!].date = currentDate.toString();
      GetIncomeController.to.weeklyIncomesList?.refresh();
    }
  }

  _weeklyincomeRowList({BoxConstraints? constraints}) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: GetIncomeController.to.weeklyIncomesList?.length,
      itemBuilder: (context, index) {
        TextEditingController? _incomeName;
        TextEditingController? _amount;
        _incomeName = TextEditingController(text: GetIncomeController.to.weeklyIncomesList?[index].name ?? "");
        _amount = TextEditingController(text: GetIncomeController.to.weeklyIncomesList?[index].amount.toString().replaceAll('null', '') ?? "");
        // RxBool whenErrorOnlyShowRedBorder = false.obs;
        // RxBool whenErrorOnlyShowRedBorderAmount = false.obs;
        RxList<RxBool> whenErrorOnlyShowRedBorderListWeekly = List.generate(GetIncomeController.to.weeklyIncomesList!.length, (index) => false.obs).obs;
        RxList<RxBool> whenErrorOnlyShowRedBorderAmountListWeekly = List.generate(GetIncomeController.to.weeklyIncomesList!.length, (index) => false.obs).obs;
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
                        GetIncomeController.to.weeklyIncomesList?.removeAt(index);
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
                              padding: const EdgeInsets.only(left: 5),
                              child: GetBuilder<CheckBoxController>(
                                builder: (controller) {
                                  return Checkbox(
                                    activeColor: color12CC8E,
                                    checkColor: Colors.white,
                                    value: checkBoxController.weeklyIncomeCheckBoxValueList[index],
                                    onChanged: (value) {
                                      checkBoxController.selectedWeeklyIncomeCheckBox(value: value, index: index);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                    StreamBuilder(
                        stream: whenErrorOnlyShowRedBorderListWeekly.stream,
                        builder: (context, snapshot) {
                          return SizedBox(
                            // height: whenErrorOnlyShowRedBorderListWeekly[index].value == true ? Get.height * 0.07 : Get.height * 0.044,
                            height: checkBoxController.weeklyIncomeCheckBoxValueList[index]
                                ? whenErrorOnlyShowRedBorderListWeekly[index].value == true
                                    ? Get.height * 0.07
                                    : Get.height * 0.044
                                : checkBoxController.weeklyIncomeCheckBoxValueList[index] == false
                                    ? Get.height * 0.044
                                    : Get.height * 0.07,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                              child: commonTextFormField(
                                errorTextStyle: TextStyle(fontSize: constraints.maxWidth < 1000 ? 8.sp : null),
                                hintText: incomeName,
                                hintStyle: incomeNameStyle,
                                inputAction: TextInputAction.next,
                                inputFormatter: [characterInputFormatter()],
                                contentPadding: EdgeInsets.fromLTRB(10.0, constraints.maxWidth > 1000 ? Get.height * 0.030 : Get.height * 0.020, 10.0, 0.0),
                                textStyle: incomeNameStyle,
                                textEditingController: _incomeName,
                                onChangedFunction: (value) {
                                  GetIncomeController.to.weeklyIncomesList?[index].name = value ?? "";
                                  // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                },
                                // errorBorder: whenErrorOnlyShowRedBorderListWeekly[index].value
                                //     ? OutlineInputBorder(
                                //         borderSide: const BorderSide(color: Colors.red),
                                //         borderRadius: BorderRadius.circular(4.0),
                                //       )
                                //     : null,
                                // focusedErrorBorder: whenErrorOnlyShowRedBorderListWeekly[index].value
                                //     ? OutlineInputBorder(
                                //         borderSide: const BorderSide(color: Colors.red),
                                //         borderRadius: BorderRadius.circular(4.0),
                                //       )
                                //     : null,
                                errorBorder: constraints.maxWidth > 1000
                                    ? checkBoxController.weeklyIncomeCheckBoxValueList[index]
                                        ? whenErrorOnlyShowRedBorderListWeekly[index].value
                                            ? OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.red),
                                                borderRadius: BorderRadius.circular(4.0),
                                              )
                                            : null
                                        : null
                                    : whenErrorOnlyShowRedBorderListWeekly[index].value
                                        ? OutlineInputBorder(
                                            borderSide: const BorderSide(color: Colors.red),
                                            borderRadius: BorderRadius.circular(4.0),
                                          )
                                        : null,
                                focusedErrorBorder: whenErrorOnlyShowRedBorderListWeekly[index].value
                                    ? OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(4.0),
                                      )
                                    : null,
                                validationFunction: (value) {
                                  if (whenErrorOnlyShowRedBorderListWeekly[index].value != value.isEmpty) {
                                    whenErrorOnlyShowRedBorderListWeekly[index].value = value.isEmpty;
                                    print(whenErrorOnlyShowRedBorderListWeekly[index].value);
                                    whenErrorOnlyShowRedBorderListWeekly.refresh();
                                  }
                                  // return whenErrorOnlyShowRedBorderListWeekly[index].value == true ? '' : null;
                                  return checkBoxController.weeklyIncomeCheckBoxValueList[index]
                                      ? whenErrorOnlyShowRedBorderListWeekly[index].value == true
                                          ? addIncomeName
                                          : null
                                      : null;
                                },
                              ),
                            ),
                          );
                        }),
                    Container(
                      height: Get.height * 0.044,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1000 ? 8 : 4,
                      ),
                      // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                      // height: Get.height * 0.044,
                      alignment: Alignment.center,
                      child: GetBuilder<SelectedDropDownItem>(
                        builder: (controller1) {
                          return commonDropDown(
                              selectedItemTextStyle: dropDownStyle2,
                              valueTextStyle: dropDownStyle,
                              value: '${GetIncomeController.to.weeklyIncomesList?[index].paidOn ?? 1}'
                                  .toString()
                                  .replaceAll('1', 'Sun')
                                  .replaceAll('2', 'Mon')
                                  .replaceAll('3', 'Tue')
                                  .replaceAll('4', 'Wed')
                                  .replaceAll('5', 'Thu')
                                  .replaceAll('6', 'Fri')
                                  .replaceAll('7', 'Sat'),

                              // value: controller.selectDayDropDown[index],
                              // value: GetIncomeController.to.weeklyIncomesList?[index].paidOn,
                              itemList: days,
                              onChanged: (item) {
                                GetIncomeController.to.weeklyIncomesList?[index].paidOn = int.parse(item
                                    .replaceAll('Sun', '1')
                                    .replaceAll('Mon', '2')
                                    .replaceAll('Tue', '3')
                                    .replaceAll('Wed', '4')
                                    .replaceAll('Thu', '5')
                                    .replaceAll('Fri', '6')
                                    .replaceAll('Sat', '7'));
                                GetIncomeController.to.weeklyIncomesList?.refresh();
                                // controller.changeDay(item: item, index: index);
                                print(item);
                              });
                        },
                      ),
                      margin: EdgeInsets.only(right: Get.width * 0.02),
                      decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      height: Get.height * 0.044,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1000 ? 8 : 4,
                      ),
                      // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                      // height: Get.height * 0.044,
                      alignment: Alignment.center,
                      child: GetBuilder<SelectedDropDownItem>(
                        builder: (controller1) {
                          return commonDropDown(
                              selectedItemTextStyle: dropDownStyle2,
                              valueTextStyle: dropDownStyle,
                              value: '${GetIncomeController.to.weeklyIncomesList?[index].every ?? 1}W',
                              itemList: weeks,
                              onChanged: (item) {
                                GetIncomeController.to.weeklyIncomesList?[index].every = int.parse(item.replaceAll('W', ''));
                                GetIncomeController.to.weeklyIncomesList?.refresh();
                                print(item);
                              });
                        },
                      ),
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
                          DateFormat('dd-MM-yyyy').format(DateTime.parse(GetIncomeController.to.weeklyIncomesList![index].date.toString())),
                          // '${DateFormat('yyyy-MM-dd').format(currentDate)}',
                          style: dateStyle,
                          maxLines: 1,
                        ),
                        margin: EdgeInsets.only(right: Get.width * 0.02),
                        decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    StreamBuilder(
                        stream: whenErrorOnlyShowRedBorderAmountListWeekly.stream,
                        builder: (context, snapshot) {
                          return SizedBox(
                            // height: whenErrorOnlyShowRedBorderAmountListWeekly[index].value == true ? Get.height * 0.07 : Get.height * 0.044,
                            height: checkBoxController.weeklyIncomeCheckBoxValueList[index]
                                ? whenErrorOnlyShowRedBorderAmountListWeekly[index].value == true
                                    ? Get.height * 0.07
                                    : Get.height * 0.044
                                : checkBoxController.weeklyIncomeCheckBoxValueList[index] == false
                                    ? Get.height * 0.044
                                    : Get.height * 0.07,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02),
                              child: commonTextFormField(
                                hintText: amount,
                                hintStyle: incomeNameStyle,
                                prefixText: '\$',
                                keyboardType: TextInputType.phone,
                                prefixstyle: incomeNameStyle,
                                inputAction: TextInputAction.done,
                                inputFormatter: [digitInputFormatter()],
                                contentPadding: EdgeInsets.fromLTRB(10.0, constraints.maxWidth > 1000 ? Get.height * 0.030 : Get.height * 0.020, 10.0, 0.0),
                                textStyle: incomeNameStyle,
                                textEditingController: _amount,
                                // errorBorder: whenErrorOnlyShowRedBorderAmountListWeekly[index].value
                                //     ? OutlineInputBorder(
                                //         borderSide: const BorderSide(color: Colors.red),
                                //         borderRadius: BorderRadius.circular(4.0),
                                //       )
                                //     : null,
                                // focusedErrorBorder: whenErrorOnlyShowRedBorderAmountListWeekly[index].value
                                //     ? OutlineInputBorder(
                                //         borderSide: const BorderSide(color: Colors.red),
                                //         borderRadius: BorderRadius.circular(4.0),
                                //       )
                                //     : null,
                                errorBorder: constraints.maxWidth > 1000
                                    ? checkBoxController.weeklyIncomeCheckBoxValueList[index]
                                        ? whenErrorOnlyShowRedBorderAmountListWeekly[index].value
                                            ? OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.red),
                                                borderRadius: BorderRadius.circular(4.0),
                                              )
                                            : null
                                        : null
                                    : whenErrorOnlyShowRedBorderAmountListWeekly[index].value
                                        ? OutlineInputBorder(
                                            borderSide: const BorderSide(color: Colors.red),
                                            borderRadius: BorderRadius.circular(4.0),
                                          )
                                        : null,
                                focusedErrorBorder: whenErrorOnlyShowRedBorderAmountListWeekly[index].value
                                    ? OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(4.0),
                                      )
                                    : null,
                                validationFunction: (value) {
                                  if (whenErrorOnlyShowRedBorderAmountListWeekly[index].value != value.isEmpty) {
                                    whenErrorOnlyShowRedBorderAmountListWeekly[index].value = value.isEmpty;
                                    print(whenErrorOnlyShowRedBorderAmountListWeekly[index].value);
                                    whenErrorOnlyShowRedBorderAmountListWeekly.refresh();
                                  }
                                  // return whenErrorOnlyShowRedBorderAmountListWeekly[index].value == true ? '' : null;

                                  return checkBoxController.weeklyIncomeCheckBoxValueList[index]
                                      ? whenErrorOnlyShowRedBorderAmountListWeekly[index].value == true
                                          ? addAmount
                                          : null
                                      : null;
                                },
                                // validationFunction: (value) {
                                //   if (whenErrorOnlyShowRedBorderAmount.value != value.isEmpty) {
                                //     whenErrorOnlyShowRedBorderAmount.value = value.isEmpty;
                                //     print(whenErrorOnlyShowRedBorderAmount.value);
                                //     whenErrorOnlyShowRedBorderAmount.refresh();
                                //   }
                                //   return null;
                                // },
                                onChangedFunction: (value) {
                                  GetIncomeController.to.weeklyIncomesList?[index].amount = value.toString().isNotEmpty ? int.parse(value) : 0;
                                  // GetIncomeController.to.weeklyIncomesList?[index].amount = int.parse(_amount!.text);
                                },
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
