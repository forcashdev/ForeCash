import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/model/weekly_budget_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

Widget setUpWeeklyBudgetWidget({BoxConstraints? constraints}) {
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: WeeklyBudgetModel.weeklyBudgetModel.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.019),
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
                    : Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: GetBuilder<CheckBoxController>(
                          builder: (controller) {
                            return Checkbox(
                              activeColor: cameraBackGroundColor,
                              checkColor: Colors.white,
                              value: checkBoxController.weeklyBudgetCheckBoxValueList[index],
                              onChanged: (value) {
                                checkBoxController.selectedWeeklyBudgetCheckBox(value: value, index: index);
                              },
                            );
                          },
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.only(left: 3),
                  width: constraints.maxWidth < 1000 ? Get.width * 0.29 : Get.width * 0.15,
                  height: Get.height * 0.044,
                  alignment: Alignment.centerLeft,
                  color: Colors.transparent,
                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                  child: Text(
                    '${WeeklyBudgetModel.weeklyBudgetModel[index].expenseName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: expenseNameStyle,
                  ),
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
                      // return commonDropDown(value: controller.selectDayDropDown[index], itemList: days);
                      // return commonDropDown(itemList: itemsList[index], value: controller.selectedItem);
                      return CommonDropDown.commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: controller.weeklyBudgetDayDropDownList[index],
                          itemList: days,
                          onChanged: (item) {
                            controller.changeWeeklyBudgetDayList(item: item, index: index);
                            print(item);
                          });
                      //   DropdownButtonHideUnderline(
                      //   child: DropdownButton(
                      //     value: controller.weeklyBudgetDayDropDownList[index],
                      //     // value: controller.selectedItem,
                      //     style: dropDownStyle,
                      //     items: days.map((String items) {
                      //       return DropdownMenuItem(
                      //         value: items,
                      //         child: Text(
                      //           items,
                      //           style: dropDownStyle2,
                      //         ),
                      //       );
                      //     }).toList(),
                      //     onChanged: (item) {
                      //       controller.changeWeeklyBudgetDayList(item: item, index: index);
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
                  color: Colors.transparent,
                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 6),
                  width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                  height: Get.height * 0.044,
                  alignment: Alignment.center,
                  child: GetBuilder<SelectedDropDownItem>(
                    builder: (controller1) {
                      // return commonDropDown(itemList: weeks, value: controller.selectWeekDropDown[index]);
                      return CommonDropDown.commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: controller.weeklyBudgetWeekDropDownList[index],
                          itemList: weeks,
                          onChanged: (item) {
                            controller.changeWeeklyBudgetWeekList(item: item, index: index);
                            print(item);
                          });
                      //   DropdownButtonHideUnderline(
                      //   child: DropdownButton(
                      //     value: controller.weeklyBudgetWeekDropDownList[index],
                      //     // value: controller.selectedItem,
                      //     style: dropDownStyle,
                      //
                      //     items: weeks.map((String items) {
                      //       return DropdownMenuItem(
                      //         value: items,
                      //         child: Text(
                      //           items,
                      //           style: dropDownStyle2,
                      //         ),
                      //       );
                      //     }).toList(),
                      //     onChanged: (item) {
                      //       controller.changeWeeklyBudgetWeekList(item: item, index: index);
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
                  color: Colors.transparent,
                ),
                Container(
                  // width: sequenceSize.width * 0.14,
                  height: Get.height * 0.044,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '\$${WeeklyBudgetModel.weeklyBudgetModel[index].amount}',
                    style: amountStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // child: const TextField(
                  //   style: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14),
                  //   decoration: InputDecoration(
                  //       prefixStyle: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 13),
                  //       prefixText: '\$',
                  //       contentPadding: EdgeInsets.only(bottom: 7),
                  //       border: InputBorder.none),
                  // ),
                  margin: EdgeInsets.only(right: Get.width * 0.04), color: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
