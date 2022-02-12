import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
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
                        // width: 8,
                        margin: EdgeInsets.only(right: Get.width * 0.02),
                        decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
                      )
                    : SizedBox(
                        height: Get.height * 0.044,
                        child: Padding(
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
                      ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Padding(
                    padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                    child: commonTextFormField(
                        inputAction: TextInputAction.done,
                        inputFormatter: [characterInputFormatter()],
                        contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                        textStyle: incomeNameStyle,
                        textEditingController: TextEditingController(text: WeeklyBudgetModel.weeklyBudgetModel[index].expenseName)),
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
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                    child: GetBuilder<SelectedDropDownItem>(
                      builder: (controller1) {
                        // return commonDropDown(value: controller.selectDayDropDown[index], itemList: days);
                        // return commonDropDown(itemList: itemsList[index], value: controller.selectedItem);
                        return commonDropDown(
                            selectedItemTextStyle: dropDownStyle2,
                            valueTextStyle: dropDownStyle,
                            value: controller.weeklyBudgetDayDropDownList[index],
                            itemList: days,
                            onChanged: (item) {
                              controller.changeWeeklyBudgetDayList(item: item, index: index);
                              print(item);
                            });
                      },
                    ),
                    margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                    height: Get.height * 0.044,
                    alignment: Alignment.center,
                    child: GetBuilder<SelectedDropDownItem>(
                      builder: (controller1) {
                        // return commonDropDown(itemList: weeks, value: controller.selectWeekDropDown[index]);
                        return commonDropDown(
                            selectedItemTextStyle: dropDownStyle2,
                            valueTextStyle: dropDownStyle,
                            value: controller.weeklyBudgetWeekDropDownList[index],
                            itemList: weeks,
                            onChanged: (item) {
                              controller.changeWeeklyBudgetWeekList(item: item, index: index);
                              print(item);
                            });
                      },
                    ),
                    margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.04),
                    child: commonTextFormField(
                        prefixText: '\$',
                        prefixstyle: incomeNameStyle,
                        inputAction: TextInputAction.done,
                        inputFormatter: [digitInputFormatter()],
                        contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                        textStyle: incomeNameStyle,
                        textEditingController: TextEditingController(text: WeeklyBudgetModel.weeklyBudgetModel[index].amount)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
