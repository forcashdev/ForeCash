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
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/monthly_income_show_text_visibility.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
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
  final addMonthlyIncomeTextVisibility = Get.put(AddMonthlyIncomeVisibilityController());
  TextEditingController? _incomeName;
  TextEditingController? _amount;
  DateTime currentDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    // CreateIncomeController.to.callIncome();
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
            stream: CreateIncomeController.to.monthlyIncomesList.stream,
            builder: (context, snapshot) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth > 1000;
                  return Scaffold(
                    backgroundColor: constraints.maxWidth > 1000 ? backGroundColor : Colors.white,
                    body: Align(
                      alignment: maxWidth ? Alignment.center : Alignment.topCenter,
                      child: SingleChildScrollView(
                        physics: maxWidth ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
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
                              Align(
                                alignment: const FractionalOffset(0.5, 0.0),
                                child: maxWidth
                                    ? null
                                    : Image.asset(
                                        foreCashLogo2,
                                        height: Get.height * 0.055,
                                        width: Get.height * 0.25,
                                      ),
                              ),
                              SizedBox(
                                height: maxWidth ? Get.height * 0.03 : 0.0,
                              ),
                              maxWidth ? Container() : commonDivider(),
                              SizedBox(
                                height: maxWidth ? Get.height * 0.02 : Get.height * 0.04,
                              ),
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
                                flex: maxWidth ? 2 : 0,
                                // flex: constraints.maxWidth > 1000 ? 2 : 0,
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                                  height: constraints.maxWidth > 1000 ? double.infinity : null,
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
                                      // SizedBox(
                                      //   height: Get.height * 0.025,
                                      // ),
                                      Expanded(
                                          flex: maxWidth ? 2 : 0,
                                          child: SingleChildScrollView(
                                            physics: maxWidth ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
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

  _addNewMonthlyIncomeWidget({BoxConstraints? constraints, BuildContext? context}) {
    return StreamBuilder(
        stream: currentDate.obs.stream,
        builder: (context, snapshot) {
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
                        print("lenght=====>${CreateIncomeController.to.monthlyIncomesList.length}");
                        //CreateIncomeController.to.monthlyIncomesList.add(MonthlyIncomeModelOld(expenseName: _incomeName.text, amount: _amount.text));
                        if (CreateIncomeController.to.monthlyIncomesList.length == 1) {
                          print("IF Zero index=====>");
                          //CreateIncomeController.to.monthlyIncomesList.add(MonthlyIncomeModelOld(expenseName: _incomeName2.text, amount: _amount2.text));
                          CreateIncomeController.to.monthlyIncomesList[0].amount = _amount!.text;
                          CreateIncomeController.to.monthlyIncomesList[0].incomeName = _incomeName!.text;
                          CreateIncomeController.to.monthlyIncomesList[0].dateTime = currentDate;
                          CreateIncomeController.to.monthlyIncomesList[0].paidOn = controller.selectedDate;
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
                                    // setState(() {
                                    CreateIncomeController.to.monthlyIncomesList.add(MonthlyIncomeModel(
                                        every: controller.selectedMonth, incomeName: _incomeName2.text, amount: _amount2.text, paidOn: controller.selectedDate, dateTime: currentDate));
                                    controller.selectedMonthlyIncomeDateList.add(controller.selectedDate as Object);
                                    controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth as Object);
                                    checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
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
        });
  }

  Future<void> _selectDate({BuildContext? context, int? index}) async {
    final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      // setState(() {
      currentDate = pickedDate;
      print('>>>>>>>>>>>>>>>>>$currentDate');
      CreateIncomeController.to.monthlyIncomesList[index!].dateTime = currentDate;
      CreateIncomeController.to.monthlyIncomesList.refresh();

      // });
    }
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
    final controller = Get.put(SelectedDropDownItem());

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
    final screenIndexController = Get.put(ScreenIndexController());
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
          print("Call Method======>");
          // {
          //
          //   "income": [{"name" : "final",
          //
          // "income_outgoing" : 2,
          //
          // "week_month": 1,
          //
          // "paid_on":10,
          //
          // "amount" : 1000,
          //
          // "date" : "2020-12-25 16:57:00"}]
          //
          // }

          List<Map<String, dynamic>> dataSaved = [];
          Map<String, dynamic> data = {};

          // print(CreateIncomeController.to.monthlyIncomesList[index].incomeName);
          // print(CreateIncomeController.to.monthlyIncomesList[index].amount);
          // print(CreateIncomeController.to.monthlyIncomesList[index].dateTime);
          // print(CreateIncomeController.to.monthlyIncomesList[index].every);
          // print(CreateIncomeController.to.monthlyIncomesList[index].paidOn);
          data.addAll({
            "income": List.generate(
                CreateIncomeController.to.monthlyIncomesList.length,
                (index) => {
                      "name": CreateIncomeController.to.monthlyIncomesList[index].incomeName!,
                      "income_outgoing": 1,
                      "week_month": 2,
                      //"paid_on": double.parse(CreateIncomeController.to.monthlyIncomesList[index].paidOn!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                      "paid_on": int.parse(CreateIncomeController.to.monthlyIncomesList[index].paidOn!.substring(0, CreateIncomeController.to.monthlyIncomesList[index].paidOn!.length - 2)),
                      // "amount": CreateIncomeController.to.monthlyIncomesList[index].amount!,
                      "amount": 300,
                      // "every": int.parse(CreateIncomeController.to.monthlyIncomesList[index].every!.replaceAll(' ', '').replaceAll('mon', '')),
                      // "date": "2020-12-15 16:57:00"
                      // "date": CreateIncomeController.to.monthlyIncomesList[index].dateTime!.toString()
                    })
          });

          // dataSaved.addAll(List.generate(
          //     CreateIncomeController.to.monthlyIncomesList.length,
          //     (index) => {
          //           "name": CreateIncomeController.to.monthlyIncomesList[index].incomeName!,
          //           "income_outgoing": 1,
          //           "week_month": 2,
          //           //"paid_on": double.parse(CreateIncomeController.to.monthlyIncomesList[index].paidOn!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
          //           "paid_on": double.parse(CreateIncomeController.to.monthlyIncomesList[index].paidOn!.substring(0, CreateIncomeController.to.monthlyIncomesList[index].paidOn!.length - 2)),
          //           "amount": 300,
          //           // "amount": CreateIncomeController.to.monthlyIncomesList[index].amount!,
          //           "every": int.parse(CreateIncomeController.to.monthlyIncomesList[index].every!.replaceAll(' ', '').replaceAll('mon', '')),
          //           // "date": "2020-12-15 16:57:00"
          //           "date": CreateIncomeController.to.monthlyIncomesList[index].dateTime.toString()
          //         }));

          print('>>>>>>>>>>>>>>>>$data');
          CreateIncomeController.to.createIncome(parameter: data);
          // CreateIncomeController.to.createIncome(parameter: data['income']);
          // screenIndex = 3;
          // print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
          // screenIndexController.updateIndex(index: 3);
          /*Map<String, dynamic> mapParam;
          CreateIncomeController.to.monthlyIncomesList.forEach((element) {
            mapParam.addAll(jsonDecode(element));
          });*/
        },
      ),
    );
  }

  rowList({BoxConstraints? constraints}) {
    return StreamBuilder(
        stream: CreateIncomeController.to.monthlyIncomesList.stream,
        builder: (context, snapshot) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: CreateIncomeController.to.monthlyIncomesList.length,
            itemBuilder: (context, index) {
              _incomeName = TextEditingController(text: CreateIncomeController.to.monthlyIncomesList[index].incomeName);
              _amount = TextEditingController(text: CreateIncomeController.to.monthlyIncomesList[index].amount);
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Slidable(
                  actionExtentRatio: 0.13,
                  enabled: constraints!.maxWidth > 1000 ? false : true,
                  secondaryActions: [
                    deleteImageWidget(onTap: () {
                      CreateIncomeController.to.monthlyIncomesList.removeAt(index);
                    }),
                    // InkWell(
                    //   onTap: () {
                    //     // setState(() {
                    //     CreateIncomeController.to.monthlyIncomesList.removeAt(index);
                    //     // });
                    //   },
                    //   child: Container(
                    //       decoration: BoxDecoration(color: colorsFFEBEB, borderRadius: BorderRadius.circular(5)),
                    //       margin: const EdgeInsets.symmetric(horizontal: 7.0),
                    //       padding: const EdgeInsets.all(5.0),
                    //       child: Image.asset(
                    //         deleteImage,
                    //         height: Get.height * 0.04,
                    //         // width: 30.0,
                    //       )),
                    // ),
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
                                  hintText: 'Income Name',
                                  hintStyle: incomeNameStyle,
                                  inputAction: TextInputAction.done,
                                  inputFormatter: [characterInputFormatter()],
                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.000, 10.0, Get.height * 0.000),
                                  textStyle: incomeNameStyle,
                                  textEditingController: _incomeName),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              // height: Get.height * 0.044,
                              alignment: Alignment.center,
                              child: GetBuilder<SelectedDropDownItem>(
                                builder: (controller1) {
                                  return commonDropDown(
                                      selectedItemTextStyle: dropDownStyle2,
                                      valueTextStyle: dropDownStyle,
                                      // value: incomeData?[index].paidOn as Object,

                                      value: CreateIncomeController.to.monthlyIncomesList[index].paidOn,
                                      itemList: dateList,
                                      onChanged: (item) {
                                        CreateIncomeController.to.monthlyIncomesList[index].paidOn = item;
                                        print(item);
                                        // CreateIncomeController.to.valueDrop.value = item;
                                        //selectedMonthlyIncomeDateListDouble[index] = item;
                                        // selectedMonthlyIncomeDateListDouble[index] = item;
                                        controller.changeDate(item: item, index: index);
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
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                              // height: Get.height * 0.044,
                              alignment: Alignment.center,
                              child: GetBuilder<SelectedDropDownItem>(
                                builder: (controller1) {
                                  // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                  return commonDropDown(
                                      selectedItemTextStyle: dropDownStyle2,
                                      valueTextStyle: dropDownStyle,
                                      value: controller.selectedMonthlyIncomeMonthList[index],
                                      itemList: months,
                                      onChanged: (item) {
                                        CreateIncomeController.to.monthlyIncomesList[index].every = item;
                                        controller.changeItem(item: item, index: index);
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
                                    '${CreateIncomeController.to.monthlyIncomesList[index].dateTime}',
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
                                  prefixstyle: incomeNameStyle,
                                  inputAction: TextInputAction.done,
                                  inputFormatter: [digitInputFormatter()],
                                  contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
                                  textStyle: incomeNameStyle,
                                  textEditingController: _amount),
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
