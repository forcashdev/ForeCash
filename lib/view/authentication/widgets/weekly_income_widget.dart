import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class WeeklyIncomeWidget {
  static Widget weeklyIncomeWidget({BoxConstraints? constraints}) {
    final controller = Get.put(SelectedDropDownItem());
    final checkBoxController = Get.put(CheckBoxController());
    return ListView.builder(
      shrinkWrap: true,
      itemCount: WeeklyIncomeModel.weeklyIncomeList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.019),
          child: Row(
            children: [
              constraints!.maxWidth < 1000
                  ? Container(
                      height: Get.height * 0.044,
                      width: 8,
                      margin: EdgeInsets.only(right: Get.width * 0.02),
                      decoration: BoxDecoration(color: const Color(0xff12CC8E), borderRadius: BorderRadius.circular(2)),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: GetBuilder<CheckBoxController>(
                        builder: (controller) {
                          return Checkbox(
                            activeColor: Color(0xff12CC8E),
                            checkColor: Colors.white,
                            value: checkBoxController.SelectedCheckBoxValueList[index],
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
                margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                child: Text(
                  '${WeeklyIncomeModel.weeklyIncomeList[index].expenseName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: expenseNameStyle,
                ),
                // child: const TextField(
                //   style: TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14),
                //   decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                // ),
                decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
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
                    return DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: controller.selectDayDropDown[index],
                        // value: controller.selectedItem,
                        style: dropDownStyle,
                        items: days.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: dropDownStyle2,
                            ),
                          );
                        }).toList(),
                        onChanged: (item) {
                          controller.changeDay(item: item, index: index);
                        },
                        isExpanded: true,

                        icon: const Icon(
                          Icons.keyboard_arrow_down, color: Color(0xff777C90),
                          // color: AppTheme.colorGrey,
                        ),
                      ),
                    );
                  },
                ),
                margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 6),
                width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                height: Get.height * 0.044,
                alignment: Alignment.center,
                child: GetBuilder<SelectedDropDownItem>(
                  builder: (controller1) {
                    // return commonDropDown(itemList: weeks, value: controller.selectWeekDropDown[index]);
                    return DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: controller.selectWeekDropDown[index],
                        // value: controller.selectedItem,
                        style: dropDownStyle,

                        items: weeks.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: dropDownStyle2,
                            ),
                          );
                        }).toList(),
                        onChanged: (item) {
                          controller.changeWeek(item: item, index: index);
                        },
                        isExpanded: true,

                        icon: const Icon(
                          Icons.keyboard_arrow_down, color: Color(0xff777C90),
                          // color: AppTheme.colorGrey,
                        ),
                      ),
                    );
                  },
                ),
                margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
              ),
              Expanded(
                child: Container(
                  // width: sequenceSize.width * 0.14,
                  height: Get.height * 0.044,
                  alignment: Alignment.center,
                  child: Text(
                    '\$${WeeklyIncomeModel.weeklyIncomeList[index].amount}',
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
                  decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
