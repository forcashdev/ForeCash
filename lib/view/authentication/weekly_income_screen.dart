import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/visibility_controller.dart';
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
  TextEditingController? _incomeName;
  TextEditingController? _amount;
  @override
  void initState() {
    super.initState();
    GetIncomeController.to.callIncome(income_outgoing: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 2);
          return false;
        },
        child: StreamBuilder(
            stream: GetIncomeController.to.weeklyIncomesList?.stream,
            builder: (context, snapshot) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth > 1000;
                  return Scaffold(
                    backgroundColor: constraints.maxWidth > 1000 ? backGroundColor : Colors.white,
                    body: Align(
                      alignment: maxWidth ? Alignment.center : Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : 0.0),
                        decoration: BoxDecoration(color: maxWidth ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
                        width: maxWidth ? Get.width / 1.4 : null,
                        height: maxWidth ? Get.height * 0.78 : null,
                        child: Column(
                          children: [
                            _headerColumn(constraints: constraints),
                            Expanded(
                              flex: maxWidth ? 2 : 2,
                              child: Container(
                                // height: constraints.maxWidth > 1000 ? double.infinity : null,
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(border: maxWidth ? Border.all(color: commonGreyColor.withOpacity(0.5)) : null, borderRadius: BorderRadius.circular(5)),
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
                                            color: commonGreyColor.withOpacity(0.5),
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
                                            // weeklyIncomeWidget(constraints: constraints),
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
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            hintText: day,
            hintTextStyle: chooseDateStyle,
            value: controller.selectedSingleWeeklyIncomeDay,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeSingleDay(item: item);
              print(item);
            });
        //   DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     hint: Text(
        //       day,
        //       style: chooseDateStyle,
        //     ),
        //     value: controller.selectedSingleDay,
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
        //       controller.changeSingleDay(item: item);
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
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            hintText: every,
            hintTextStyle: chooseDateStyle,
            value: controller.selectedSingleWeeklyIncomeWeek,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeSingleWeek(item: item);
              print(item);
            });
        //   DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     hint: Text(
        //       every,
        //       style: chooseDateStyle,
        //     ),
        //     value: controller.selectedSingleWeek,
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
        //       controller.changeSingleWeek(item: item);
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
          return Visibility(
            visible: controller1.visibility,
            replacement: Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.03, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
              child: GestureDetector(
                onTap: () {
                  if (GetIncomeController.to.weeklyIncomesList?.length == 1) {
                    //CreateIncomeController.to.IncomesList.add(MonthlyIncomeModelOld(expenseName: _incomeName2.text, amount: _amount2.text));
                    GetIncomeController.to.weeklyIncomesList?[0].amount = int.parse(_amount!.text.toString());
                    GetIncomeController.to.weeklyIncomesList?[0].name = _incomeName!.text;
                    GetIncomeController.to.weeklyIncomesList?[0].date = DateTime.now().toString();
                    GetIncomeController.to.weeklyIncomesList?[0].weekMonth = 1;
                    GetIncomeController.to.weeklyIncomesList?[0].incomeOutgoing = 1;
                    // GetIncomeController.to.weeklyIncomesList?[0].paidOn = controller.selectedDate as int?;
                    // controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
                    // controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
                    // checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
                  }
                  visibilityController.changeVisibility();
                },
                child: Align(
                  alignment: const FractionalOffset(0.015, 0.0),
                  child: Text(
                    addWeeklyIncome,
                    style: addWeekIncomeStyle,
                  ),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: Get.height * 0.019,
              ),
              child: Column(
                children: [
                  Table(
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
                          SizedBox(height: Get.height * 0.044),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Padding(
                              padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                              child: commonTextFormField(
                                  hintText: addIncome,
                                  hintStyle: incomeNameStyle,
                                  inputAction: TextInputAction.next,
                                  inputFormatter: [characterInputFormatter()],
                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  textEditingController: _incomeName2),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 6,
                              ),
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              // height: Get.height * 0.044,
                              alignment: Alignment.center,
                              child: dropDownDayGetBuilder(dropDownList: days),
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                              decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.only(left: 6),
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              // height: Get.height * 0.044,
                              alignment: Alignment.center,
                              child: dropDownWeekGetBuilder(dropDownList: weeks),
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                              decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          TableCell(
                              verticalAlignment: TableCellVerticalAlignment.fill,
                              child: GestureDetector(
                                onTap: () {
                                  _selectDate(context: context);
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${DateFormat('yyyy-MM-dd').format(currentDate)}',
                                    style: dateStyle,
                                    maxLines: 1,
                                  ),
                                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                                ),
                              )),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.02),
                              child: commonTextFormField(
                                  prefixText: '\$',
                                  keyboardType: TextInputType.phone,
                                  prefixstyle: incomeNameStyle,
                                  // hintText: '\$',
                                  // hintStyle: incomeNameStyle,
                                  inputAction: TextInputAction.done,
                                  inputFormatter: [digitInputFormatter()],
                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  textEditingController: _amount2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.01, left: constraints.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.018),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        InkWell(
                          onTap: () {
                            if (_incomeName2.text.isNotEmpty && _amount2.text.isNotEmpty) {
                              GetIncomeController.to.weeklyIncomesList?.add(DataModel(
                                  name: _incomeName2.text,
                                  amount: int.parse(_amount2.text),
                                  incomeOutgoing: 1,
                                  weekMonth: 1,
                                  paidOn: int.parse(controller.selectedSingleWeeklyIncomeDay
                                      .toString()
                                      .replaceAll('Sun', '1')
                                      .replaceAll('Mon', '2')
                                      .replaceAll('Tue', '3')
                                      .replaceAll('Wed', '4')
                                      .replaceAll('Thu', '5')
                                      .replaceAll('Fri', '6')
                                      .replaceAll('Sat', '7')),
                                  // every: controller.selectedSingleWeeklyIncomeDay!.replaceAll('Sun', int.parse('1'.toString()).toInt()),
                                  every: int.parse(controller.selectedSingleWeeklyIncomeWeek!.replaceAll('W', '')),
                                  date: currentDate.toString()));

                              // controller.selectDayDropDown.add(controller.selectedSingleWeeklyIncomeDay as Object);
                              // controller.selectWeekDropDown.add(controller.selectedSingleWeeklyIncomeWeek as Object);
                              checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
                              // });
                              controller1.changeVisibility();
                            }
                            _amount?.clear();
                            _incomeName?.clear();

                            // monthlyIncomeEditMode.showEditMode();
                          },
                          child: Text(
                            save,
                            style: greenMontserrat11W500,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.017,
                        ),
                        InkWell(
                          child: Text(
                            cancel,
                            style: redMontserrat11W500,
                          ),
                          onTap: () {
                            controller1.changeVisibility();
                            // monthlyIncomeEditMode.showEditMode();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
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
                      screenIndexController.updateIndex(index: 1);
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
          // List.generate(GetIncomeController.to.weeklyIncomesList!.length, (index) {
          //   GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
          //   GetIncomeController.to.weeklyIncomesList?[index].amount = int.parse(_amount!.text);
          // });
          print("length===>${GetIncomeController.to.weeklyIncomesList}");
          CreateIncomeController.to.createIncome(screenIndex: 4, parameter: {'income': GetIncomeController.to.weeklyIncomesList});

          // screenIndex = 4;
          // print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
          // screenIndexController.updateIndex(index: 4);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => MonthlyExpensesScreen(),
          //     ));

          // Get.to(MonthlyExpensesScreen());
        },
      ),
    );
  }

  Future<void> _selectDate({BuildContext? context, int? index}) async {
    final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      // setState(() {
      currentDate = pickedDate;
      print('>>>>>>>>>>>>>>>>>$currentDate');
      // CreateIncomeController.to.IncomesList[index!].dateTime = currentDate;
      GetIncomeController.to.weeklyIncomesList?[index!].date = currentDate.toString();
      GetIncomeController.to.weeklyIncomesList?.refresh();

      // });
    }
  }

  _weeklyincomeRowList({BoxConstraints? constraints}) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: GetIncomeController.to.weeklyIncomesList?.length,
      itemBuilder: (context, index) {
        _incomeName = TextEditingController(text: GetIncomeController.to.weeklyIncomesList?[index].name);
        _amount = TextEditingController(text: GetIncomeController.to.weeklyIncomesList?[index].amount.toString());
        return Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.019),
          child: Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actionExtentRatio: 0.13,
            enabled: constraints!.maxWidth > 1000 ? false : true,
            secondaryActions: [
              deleteImageWidget(onTap: () {
                GetIncomeController.to.weeklyIncomesList?.removeAt(index);
              }),
            ],
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
                                    value: checkBoxController.weeklyIncomeCheckBoxValueList[index],
                                    onChanged: (value) {
                                      checkBoxController.selectedWeeklyIncomeCheckBox(value: value, index: index);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Padding(
                        padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                        child: commonTextFormField(
                          hintText: 'Income Name',
                          hintStyle: incomeNameStyle,
                          inputAction: TextInputAction.next,
                          inputFormatter: [characterInputFormatter()],
                          contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                          textStyle: incomeNameStyle,
                          textEditingController: _incomeName,
                          onChangedFunction: (value) {
                            GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                          },
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                        height: Get.height * 0.044,
                        alignment: Alignment.center,
                        child: GetBuilder<SelectedDropDownItem>(
                          builder: (controller1) {
                            return commonDropDown(
                                selectedItemTextStyle: dropDownStyle2,
                                valueTextStyle: dropDownStyle,
                                value: GetIncomeController.to.weeklyIncomesList?[index].paidOn
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
                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                        decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                        height: Get.height * 0.044,
                        alignment: Alignment.center,
                        child: GetBuilder<SelectedDropDownItem>(
                          builder: (controller1) {
                            return commonDropDown(
                                selectedItemTextStyle: dropDownStyle2,
                                valueTextStyle: dropDownStyle,
                                value: '${GetIncomeController.to.weeklyIncomesList?[index].every}W',

                                // value: controller.selectWeekDropDown[index],
                                // value: GetIncomeController.to.weeklyIncomesList?[index].every,
                                itemList: weeks,
                                onChanged: (item) {
                                  GetIncomeController.to.weeklyIncomesList?[index].every = int.parse(item.replaceAll('W', ''));
                                  GetIncomeController.to.weeklyIncomesList?.refresh();
                                  // GetIncomeController.to.weeklyIncomesList?[index].every = item;
                                  // controller.changeWeek(item: item, index: index);
                                  print(item);
                                });
                          },
                        ),
                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                        decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                      ),
                    ),

                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: GestureDetector(
                          onTap: () {
                            _selectDate(context: context, index: index);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${GetIncomeController.to.weeklyIncomesList?[index].date}',
                              // '${DateFormat('yyyy-MM-dd').format(currentDate)}',
                              style: dateStyle,
                              maxLines: 1,
                            ),
                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                            decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                          ),
                        )),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Padding(
                        padding: EdgeInsets.only(right: Get.width * 0.02),
                        child: commonTextFormField(
                          hintText: 'Amount',
                          hintStyle: incomeNameStyle,
                          prefixText: '\$',
                          keyboardType: TextInputType.phone,
                          prefixstyle: incomeNameStyle,
                          inputAction: TextInputAction.done,
                          inputFormatter: [digitInputFormatter()],
                          contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
                          textStyle: incomeNameStyle,
                          textEditingController: _amount,
                          onChangedFunction: (value) {
                            GetIncomeController.to.weeklyIncomesList?[index].amount = int.parse(_amount!.text);
                          },
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Container(
                    //     // width: sequenceSize.width * 0.14,
                    //     height: Get.height * 0.044, padding: EdgeInsets.only(left: 10),
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       '\$${WeeklyIncomeModel.weeklyIncomeList[index].amount}',
                    //       style: incomeNameStyle,
                    //       maxLines: 1,
                    //       overflow: TextOverflow.ellipsis,
                    //     ),
                    //     // child: const TextField(
                    //     //   style: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14),
                    //     //   decoration: InputDecoration(
                    //     //       prefixStyle: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 13),
                    //     //       prefixText: '\$',
                    //     //       contentPadding: EdgeInsets.only(bottom: 7),
                    //     //       border: InputBorder.none),
                    //     // ),
                    //     margin: EdgeInsets.only(right: Get.width * 0.04),
                    //     decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                    //   ),
                    // ),
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
