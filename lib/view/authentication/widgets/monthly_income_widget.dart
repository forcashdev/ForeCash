import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

Widget monthlyIncomeWidget({BoxConstraints? constraints}) {
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());

  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: MonthlyIncomeModel.monthlyIncomeList.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(0.35),
            1: FlexColumnWidth(3),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(2),
            4: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              children: [
                constraints!.maxWidth < 1000
                    ? Container(
                        height: Get.height * 0.044,
                        width: 8,
                        margin: EdgeInsets.only(right: Get.width * 0.02),
                        decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
                      )
                    : GetBuilder<CheckBoxController>(
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
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: constraints.maxWidth < 1000 ? Get.width * 0.29 : Get.width * 0.15,
                  height: Get.height * 0.044,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                  child: Text(
                    '${MonthlyIncomeModel.monthlyIncomeList[index].expenseName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: incomeNameStyle,
                  ),
                  // child: const TextField(
                  //   style: textFieldStyle,
                  //   decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                  // ),
                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 6),
                  width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                  height: Get.height * 0.044,
                  alignment: Alignment.center,
                  child: GetBuilder<SelectedDropDownItem>(
                    builder: (controller1) {
                      // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                      return CommonDropDown.commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: controller.selectedMonthlyIncomeDateList[index],
                          itemList: dateList,
                          onChanged: (item) {
                            controller.changeDate(item: item, index: index);
                            print(item);
                          });
                      //   DropdownButtonHideUnderline(
                      //   child: DropdownButton(
                      //     value: controller.selectedMonthlyIncomeDateList[index],
                      //     // value: controller.selectedItem,
                      //     style: dropDownStyle,
                      //
                      //     items: dateList.map((String items) {
                      //       return DropdownMenuItem(
                      //         value: items,
                      //         child: Text(
                      //           items,
                      //           style: dropDownStyle2,
                      //         ),
                      //       );
                      //     }).toList(),
                      //     onChanged: (item) {
                      //       controller.changeDate(item: item, index: index);
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
                  ),
                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 6,
                  ),
                  width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                  height: Get.height * 0.044,
                  alignment: Alignment.center,
                  child: GetBuilder<SelectedDropDownItem>(
                    builder: (controller1) {
                      // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                      return CommonDropDown.commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: controller.selectedMonthlyIncomeMonthList[index],
                          itemList: months,
                          onChanged: (item) {
                            controller.changeItem(item: item, index: index);
                            print(item);
                          });
                      //   DropdownButtonHideUnderline(
                      //   child: DropdownButton(
                      //     value: controller.selectedMonthlyIncomeMonthList[index],
                      //     // value: controller.selectedItem,
                      //     style: dropDownStyle,
                      //     items: months.map((String items) {
                      //       return DropdownMenuItem(
                      //         value: items,
                      //         child: Text(
                      //           items,
                      //           style: dropDownStyle2,
                      //         ),
                      //       );
                      //     }).toList(),
                      //     onChanged: (item) {
                      //       controller.changeItem(item: item, index: index);
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
                  ),
                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                ),
                Container(
                  // width: sequenceSize.width * 0.14,
                  height: Get.height * 0.044,
                  // width: Get.width * 0.14,
                  alignment: Alignment.center,

                  child: Text(
                    '\$${MonthlyIncomeModel.monthlyIncomeList[index].amount}',
                    style: incomeNameStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // child: const TextField(
                  //   style: textFieldStyle,
                  //   decoration: InputDecoration(prefixStyle: prefixTextStyle, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                  // ),
                  margin: EdgeInsets.only(right: Get.width * 0.04),
                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

monthlyIncomeTableWidget({BoxConstraints? constraints}) {
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  return Table(
    columnWidths: const <int, TableColumnWidth>{
      0: FlexColumnWidth(0.35),
      1: FlexColumnWidth(3),
      2: FlexColumnWidth(2),
      3: FlexColumnWidth(2),
      4: FlexColumnWidth(2),
    },
    children: [
      ...List.generate(
          MonthlyIncomeModel.monthlyIncomeList.length,
          (index) => TableRow(
                children: [
                  constraints!.maxWidth < 1000
                      ? Container(
                          height: Get.height * 0.044,
                          width: 8,
                          margin: EdgeInsets.only(right: Get.width * 0.02),
                          decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 5),
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
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: constraints.maxWidth < 1000 ? Get.width * 0.29 : Get.width * 0.15,
                    height: Get.height * 0.044,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: constraints.maxWidth > 1000 ? 10 : 0.0, right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02, bottom: 10),
                    child: Text(
                      '${MonthlyIncomeModel.monthlyIncomeList[index].expenseName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: incomeNameStyle,
                    ),
                    // child: const TextField(
                    //   style: textFieldStyle,
                    //   decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                    // ),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 6),
                    width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                    height: Get.height * 0.044,
                    alignment: Alignment.center,
                    child: GetBuilder<SelectedDropDownItem>(
                      builder: (controller1) {
                        // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                        return CommonDropDown.commonDropDown(
                            selectedItemTextStyle: dropDownStyle2,
                            valueTextStyle: dropDownStyle,
                            value: controller.selectedMonthlyIncomeDateList[index],
                            itemList: dateList,
                            onChanged: (item) {
                              controller.changeDate(item: item, index: index);
                              print(item);
                            });
                        //   DropdownButtonHideUnderline(
                        //   child: DropdownButton(
                        //     value: controller.selectedMonthlyIncomeDateList[index],
                        //     // value: controller.selectedItem,
                        //     style: dropDownStyle,
                        //
                        //     items: dateList.map((String items) {
                        //       return DropdownMenuItem(
                        //         value: items,
                        //         child: Text(
                        //           items,
                        //           style: dropDownStyle2,
                        //         ),
                        //       );
                        //     }).toList(),
                        //     onChanged: (item) {
                        //       controller.changeDate(item: item, index: index);
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
                    ),
                    margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 6,
                    ),
                    width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                    height: Get.height * 0.044,
                    alignment: Alignment.center,
                    child: GetBuilder<SelectedDropDownItem>(
                      builder: (controller1) {
                        // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                        return CommonDropDown.commonDropDown(
                            selectedItemTextStyle: dropDownStyle2,
                            valueTextStyle: dropDownStyle,
                            value: controller.selectedMonthlyIncomeMonthList[index],
                            itemList: months,
                            onChanged: (item) {
                              controller.changeItem(item: item, index: index);
                              print(item);
                            });
                        //   DropdownButtonHideUnderline(
                        //   child: DropdownButton(
                        //     value: controller.selectedMonthlyIncomeMonthList[index],
                        //     // value: controller.selectedItem,
                        //     style: dropDownStyle,
                        //     items: months.map((String items) {
                        //       return DropdownMenuItem(
                        //         value: items,
                        //         child: Text(
                        //           items,
                        //           style: dropDownStyle2,
                        //         ),
                        //       );
                        //     }).toList(),
                        //     onChanged: (item) {
                        //       controller.changeItem(item: item, index: index);
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
                    ),
                    margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    // width: sequenceSize.width * 0.14,
                    height: Get.height * 0.044,
                    // width: Get.width * 0.14,
                    alignment: Alignment.centerLeft,

                    child: Text(
                      '\$${MonthlyIncomeModel.monthlyIncomeList[index].amount}',
                      style: incomeNameStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // child: const TextField(
                    //   style: textFieldStyle,
                    //   decoration: InputDecoration(prefixStyle: prefixTextStyle, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                    // ),
                    margin: EdgeInsets.only(right: Get.width * 0.04),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                ],
              ))
    ],
  );
}
