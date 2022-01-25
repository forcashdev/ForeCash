import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class MonthlyExpensesWidget extends StatefulWidget {
  final BoxConstraints? constraints;

  const MonthlyExpensesWidget({Key? key, this.constraints}) : super(key: key);

  @override
  _MonthlyExpensesWidgetState createState() => _MonthlyExpensesWidgetState();
}

class _MonthlyExpensesWidgetState extends State<MonthlyExpensesWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectedDropDownItem());
    final checkBoxController = Get.put(CheckBoxController());
    return ListView.builder(
      shrinkWrap: true,
      itemCount: MonthlyExpensesModel.monthlyExpensesList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.019),
          child: Dismissible(
            // key: ObjectKey(MonthlyExpensesModel.monthlyExpensesList[index]),
            direction: DismissDirection.endToStart,
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                MonthlyExpensesModel.monthlyExpensesList.removeAt(index);
              });
            },
            child: Row(
              children: [
                widget.constraints!.maxWidth < 1000
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
                              value: checkBoxController.monthlyExpenseCheckBoxValueList[index],
                              onChanged: (value) {
                                checkBoxController.selectedMonthlyExpenseCheckBox(value: value, index: index);
                              },
                            );
                          },
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: widget.constraints!.maxWidth < 1000 ? Get.width * 0.29 : Get.width * 0.15,
                  height: Get.height * 0.044,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: widget.constraints!.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                  child: Text(
                    '${MonthlyExpensesModel.monthlyExpensesList[index].expenseName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: expenseNameStyle,
                  ),
                  // child: const TextField(
                  //   style: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14),
                  //   decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                  // ),
                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 6,
                  ),
                  width: widget.constraints!.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                  height: Get.height * 0.044,
                  alignment: Alignment.center,
                  child: GetBuilder<SelectedDropDownItem>(
                    builder: (controller1) {
                      // return commonDropDown(value: controller.selectDayDropDown[index], itemList: days);
                      // return commonDropDown(itemList: itemsList[index], value: controller.selectedItem);
                      return CommonDropDown.commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: controller.selectedMonthlyExpenseDate[index],
                          itemList: dateList,
                          onChanged: (item) {
                            controller.changeMonthlyExpenseDate(item: item, index: index);
                            print(item);
                          });
                      //   DropdownButtonHideUnderline(
                      //   child: DropdownButton(
                      //     value: controller.selectedMonthlyExpenseDate[index],
                      //     // value: controller.selectedItem,
                      //     style: dropDownStyle,
                      //     items: dateList.map((String items) {
                      //       return DropdownMenuItem(
                      //         value: items,
                      //         child: Text(
                      //           items,
                      //           style: dropDownStyle2,
                      //           maxLines: 1,
                      //         ),
                      //       );
                      //     }).toList(),
                      //     onChanged: (item) {
                      //       controller.changeMonthlyExpenseDate(item: item, index: index);
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
                  margin: EdgeInsets.only(right: widget.constraints!.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 6),
                  width: widget.constraints!.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                  height: Get.height * 0.044,
                  alignment: Alignment.center,
                  child: GetBuilder<SelectedDropDownItem>(
                    builder: (controller1) {
                      // return commonDropDown(itemList: weeks, value: controller.selectWeekDropDown[index]);
                      return CommonDropDown.commonDropDown(
                          selectedItemTextStyle: dropDownStyle2,
                          valueTextStyle: dropDownStyle,
                          value: controller.selectedMonthlyExpenseMonth[index],
                          itemList: months,
                          onChanged: (item) {
                            controller.changeMonthlyExpenseMonth(item: item, index: index);
                            print(item);
                          });
                      //   DropdownButtonHideUnderline(
                      //   child: DropdownButton(
                      //     value: controller.selectedMonthlyExpenseMonth[index],
                      //     // value: controller.selectedItem,
                      //     style: dropDownStyle,
                      //
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
                      //       controller.changeMonthlyExpenseMonth(item: item, index: index);
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
                  margin: EdgeInsets.only(right: widget.constraints!.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                  decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                ),
                Expanded(
                  child: Container(
                    // width: sequenceSize.width * 0.14,
                    height: Get.height * 0.044,
                    alignment: Alignment.center,
                    child: Text(
                      '\$${MonthlyExpensesModel.monthlyExpensesList[index].amount}',
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
                    margin: EdgeInsets.only(right: Get.width * 0.04),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
