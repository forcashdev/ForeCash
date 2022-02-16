import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
import 'package:fore_cash/getx/monthly_income_show_text_visibility.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/income_request_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MonthlyIncomeScreen extends StatefulWidget {
  const MonthlyIncomeScreen({Key? key}) : super(key: key);

  @override
  _MonthlyIncomeScreenState createState() => _MonthlyIncomeScreenState();
}

class _MonthlyIncomeScreenState extends State<MonthlyIncomeScreen> {
  final TextEditingController _incomeName2 = TextEditingController();
  final TextEditingController _amount2 = TextEditingController();
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final screenIndexController = Get.put(ScreenIndexController());
  final getIncomeController = Get.put(GetIncomeController());
  final addMonthlyIncomeTextVisibility = Get.put(AddMonthlyIncomeVisibilityController());
  TextEditingController? _incomeName;
  TextEditingController? _amount;
  DateTime currentDate = DateTime.now();
  List deleteIdList = [];
  @override
  void initState() {
    // callAPI();
    super.initState();
    GetIncomeController.to.callIncome(income_outgoing: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            screenIndexController.updateIndex(index: 1);
            return false;
          },
          child: StreamBuilder(
              stream: GetIncomeController.to.monthlyIncomeList?.stream,
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
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                          width: maxWidth ? Get.width / 1.4 : null,
                          height: maxWidth ? Get.height * 0.78 : null,
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
                                            // Navigator.pop(context);
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
                                  Container()
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
                                            screenIndexController.updateIndex(index: 2);
                                            // Navigator.pop(context);
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
                                flex: maxWidth ? 2 : 2,
                                // flex: constraints.maxWidth > 1000 ? 2 : 0,
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                                  height: maxWidth ? double.infinity : null,
                                  decoration: BoxDecoration(color: Colors.white, border: maxWidth ? Border.all(color: commonGreyColor.withOpacity(0.5)) : null, borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      _nameTableRowWidget(constraints: constraints),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      maxWidth
                                          ? Divider(
                                              color: commonGreyColor.withOpacity(0.5),
                                            )
                                          : Container(),
                                      Expanded(
                                          flex: maxWidth ? 2 : 2,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [rowList(constraints: constraints), _addNewMonthlyIncomeWidget(constraints: constraints, context: context)],
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
          return Visibility(
            visible: controller1.monthlyIncomeVisibility,
            replacement: Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.03, left: constraints!.maxWidth < 1000 ? Get.width * 0.03 : Get.width * 0.02),
              child: GestureDetector(
                onTap: () {
                  print(deleteIdList);
                  if (GetIncomeController.to.monthlyIncomeList?.length == 1) {
                    GetIncomeController.to.monthlyIncomeList?[0].amount = int.parse(_amount!.text.toString());
                    GetIncomeController.to.monthlyIncomeList?[0].name = _incomeName!.text;
                    GetIncomeController.to.monthlyIncomeList?[0].incomeOutgoing = 1;
                    GetIncomeController.to.monthlyIncomeList?[0].weekMonth = 2;
                    GetIncomeController.to.monthlyIncomeList?[0].date = DateTime.now().toString();

                    controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
                    controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
                    checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
                  }
                  controller1.changeVisibility();
                  // _amount2.clear();
                  // _incomeName2.clear();
                },
                child: Align(
                  alignment: const FractionalOffset(0.015, 0.0),
                  child: Text(
                    addMonthlyIncome,
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
                                  inputAction: TextInputAction.done,
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
                              child: dropDownDayGetBuilder(dropDownList: dateList),
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
                              child: dropDownWeekGetBuilder(dropDownList: months),
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
                              // setState(() {
                              // CreateIncomeController.to.IncomesList.add(MonthlyIncomeModel(
                              //     every: controller.selectedMonth, incomeName: _incomeName2.text, amount: _amount2.text, paidOn: controller.selectedDate, dateTime: currentDate));

                              GetIncomeController.to.monthlyIncomeList?.add(DataModel(
                                  name: _incomeName2.text,
                                  amount: int.parse(_amount2.text),
                                  incomeOutgoing: 1,
                                  weekMonth: 2,
                                  every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                  paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                  date: DateFormat('yyyy-MM-dd').format(currentDate)));
                              controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
                              controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
                              checkBoxController.monthlyIncomeCheckBoxValueList.add(false);
                              // });
                              controller1.changeVisibility();
                            }
                            _amount2.clear();
                            _incomeName2.clear();
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

  Future<void> _selectDate({BuildContext? context, int? index}) async {
    final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
      print('>>>>>>>>>>>>>>>>>$currentDate');
      // CreateIncomeController.to.IncomesList[index!].dateTime = currentDate;
      GetIncomeController.to.monthlyIncomeList?[index!].date = currentDate.toString();
      GetIncomeController.to.monthlyIncomeList?.refresh();
    }
  }

  Widget dropDownDayGetBuilder({List<String>? dropDownList}) {
    // final controller = Get.put(SelectedDropDownItem());
    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        return commonDropDown(
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            hintText: day,
            hintTextStyle: chooseDateStyle,
            value: controller.selectedDate,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeMonthlyIncomeDate(item: item);
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
    // final controller = Get.put(SelectedDropDownItem());

    return GetBuilder<SelectedDropDownItem>(
      builder: (controller1) {
        // return commonDropDown(itemList: dropDownList, value: controller.selectedSingleWeek);
        return commonDropDown(
            selectedItemTextStyle: dropDownStyle2,
            valueTextStyle: dropDownStyle,
            hintText: every,
            hintTextStyle: chooseDateStyle,
            value: controller.selectedMonth,
            itemList: dropDownList,
            onChanged: (item) {
              controller.changeMonthlyIncomeMonth(item: item);
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
          top: Get.width * 0.015),
      child: commonButton(
        height: 50,
        text: next,
        onPress: () {
          List<int> matchValue = [];
          checkBoxController.monthlyIncomeCheckBoxValueList.asMap().forEach((index, value) => value ? matchValue.add(index) : print('No index'));
          print(matchValue);
          // List.generate(CreateIncomeController.to.monthlyIncomeList!.length, (index) {
          //   CreateIncomeController.to.monthlyIncomeList?[index].name = _incomeName?.text;
          //   CreateIncomeController.to.monthlyIncomeList?[index].amount = int.parse(_amount!.text);
          // });
          List<Income> matchValueModelList = [];
          // CreateIncomeController.to.monthlyIncomeList?.asMap().forEach((key, value) {
          //   key == matchValue ? matchValueModelList.add(value) : print('not match');
          // });
          print(GetIncomeController.to.monthlyIncomeList);
          CreateIncomeController.to.createIncome(screenIndex: 3, parameter: {'income': GetIncomeController.to.monthlyIncomeList});
        },
      ),
    );
  }

  rowList({BoxConstraints? constraints}) {
    return StreamBuilder(
        stream: GetIncomeController.to.monthlyIncomeList?.stream,
        builder: (context, snapshot) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: GetIncomeController.to.monthlyIncomeList?.length,
            itemBuilder: (context, index) {
              _incomeName = TextEditingController(text: GetIncomeController.to.monthlyIncomeList?[index].name);
              _amount = TextEditingController(text: GetIncomeController.to.monthlyIncomeList?[index].amount.toString());
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Slidable(
                  actionExtentRatio: 0.13,
                  enabled: constraints!.maxWidth > 1000 ? false : true,
                  secondaryActions: [
                    deleteImageWidget(onTap: () {
                      // if (CreateIncomeController.to.monthlyIncomeList?[index].id != null) {
                      //   print(CreateIncomeController.to.monthlyIncomeList?[index].id);
                      //   DeleteIncomeExpenseController.to.callDelete(id: CreateIncomeController.to.monthlyIncomeList?[index].id);
                      //   CreateIncomeController.to.monthlyIncomeList?.refresh();
                      // } else {
                      GetIncomeController.to.monthlyIncomeList?.removeAt(index);
                      // deleteIdList.add(CreateIncomeController.to.monthlyIncomeList?[index].id);

                      // }
                    }),
                  ],
                  actionPane: const SlidableDrawerActionPane(),
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
                                  decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
                                )
                              : SizedBox(
                                  height: Get.height * 0.044,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: GetBuilder<CheckBoxController>(
                                      builder: (controller) {
                                        return Checkbox(
                                          activeColor: cameraBackGroundColor,
                                          checkColor: Colors.white,
                                          value: checkBoxController.monthlyIncomeCheckBoxValueList[index],
                                          onChanged: (value) {
                                            checkBoxController.selectCheckBox(value: value, index: index);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Padding(
                              padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth > 1000 ? 5 : 0.0),
                              child: commonTextFormField(
                                textEditingController: _incomeName,
                                onChangedFunction: (value) {
                                  GetIncomeController.to.monthlyIncomeList?[index].name = _incomeName?.text;
                                  // CreateIncomeController.to.monthlyIncomeList?.refresh();
                                },
                                hintText: 'Income Name',
                                hintStyle: incomeNameStyle,
                                inputAction: TextInputAction.next,
                                inputFormatter: [characterInputFormatter()],
                                contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                textStyle: incomeNameStyle,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              alignment: Alignment.center,
                              child: commonDropDown(
                                  selectedItemTextStyle: dropDownStyle2,
                                  valueTextStyle: dropDownStyle,
                                  value: '${GetIncomeController.to.monthlyIncomeList?[index].paidOn}th'
                                      .replaceAllMapped('1th', (match) => '1st')
                                      .replaceAllMapped('2th', (match) => '2nd')
                                      .replaceAllMapped('3th', (match) => '3rd')
                                      .replaceAllMapped('11st', (match) => '11th')
                                      .replaceAllMapped('12nd', (match) => '12th')
                                      .replaceAllMapped('13rd', (match) => '13th'),
                                  itemList: dateList,
                                  onChanged: (item) {
                                    GetIncomeController.to.monthlyIncomeList?[index].paidOn = int.parse(item.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', ''));
                                    // CreateIncomeController.to.IncomesList[index].paidOn = item;
                                    GetIncomeController.to.monthlyIncomeList?.refresh();
                                    print(item);
                                    // controller.changeDate(item: item, index: index);
                                  }),
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
                              alignment: Alignment.center,
                              child: commonDropDown(
                                  selectedItemTextStyle: dropDownStyle2,
                                  valueTextStyle: dropDownStyle,
                                  value: '${GetIncomeController.to.monthlyIncomeList?[index].every ?? 5} mon',
                                  // value: controller.selectedMonthlyIncomeMonthList[index],
                                  itemList: months,
                                  onChanged: (item) {
                                    GetIncomeController.to.monthlyIncomeList?[index].every = int.parse(item.replaceAll('mon', '').replaceAll(' ', ''));
                                    GetIncomeController.to.monthlyIncomeList?.refresh();
                                    // controller.changeItem(item: item, index: index);
                                    print(item);
                                  }),
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
                                    '${GetIncomeController.to.monthlyIncomeList?[index].date}',
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
                                textEditingController: _amount,
                                hintText: 'Amount',
                                hintStyle: incomeNameStyle,
                                prefixText: '\$',
                                keyboardType: TextInputType.phone,
                                prefixstyle: incomeNameStyle,
                                inputAction: TextInputAction.done,
                                onChangedFunction: (value) {
                                  GetIncomeController.to.monthlyIncomeList?[index].amount = int.parse(_amount!.text);
                                  // CreateIncomeController.to.monthlyIncomeList?.refresh();
                                },
                                inputFormatter: [digitInputFormatter()],
                                contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
                                textStyle: incomeNameStyle,
                              ),
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
        });
  }
}
