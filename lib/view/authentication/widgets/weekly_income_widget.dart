import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/visibility_controller.dart';
import 'package:fore_cash/getx/weekly_income_edit_mode_controller.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

Widget weeklyIncomeWidget({BoxConstraints? constraints}) {
  TextEditingController _incomeName = TextEditingController();
  TextEditingController _amount = TextEditingController();
  final visibilityController = Get.put(VisibilityController());
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  final weeklyEditModeController = Get.put(WeeklyIncomeEditModeController());
  return StreamBuilder(
      stream: WeeklyIncomeListController.to.weeklyIncomesList?.stream,
      builder: (context, snapshot) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: WeeklyIncomeListController.to.weeklyIncomesList?.length,
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
                          padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02, left: constraints.maxWidth < 1000 ? 0.0 : 5),
                          child: commonTextFormField(
                              inputAction: TextInputAction.done,
                              inputFormatter: [characterInputFormatter()],
                              contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                              textStyle: incomeNameStyle,
                              textEditingController: TextEditingController(text: WeeklyIncomeListController.to.weeklyIncomesList?[index].name)),
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
                                  value: controller.selectDayDropDown[index],
                                  itemList: days,
                                  onChanged: (item) {
                                    controller.changeDay(item: item, index: index);
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
                                  value: controller.selectWeekDropDown[index],
                                  itemList: weeks,
                                  onChanged: (item) {
                                    controller.changeWeek(item: item, index: index);
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
                              textEditingController: TextEditingController(text: WeeklyIncomeListController.to.weeklyIncomesList?[index].amount.toString())),
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
            );
          },
        );
      });
}
