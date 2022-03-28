import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/controller/checkbox_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/screen_index_controller.dart';
import 'package:fore_cash/controller/selected_dropdown_controller.dart';
import 'package:fore_cash/controller/set_up_calendar_controller.dart';
import 'package:fore_cash/controller/total_income_expense_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'allset_screen.dart';

DateTime? selectedResetWeekDay;

class SetupCalendarScreen extends StatelessWidget {
  const SetupCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectedDropDownItem());
    TextEditingController _amountController = TextEditingController();
    final screenIndexController = Get.put(ScreenIndexController());
    final checkBoxController = Get.put(CheckBoxController());
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          screenIndexController.updateIndex(index: 5);
          GetIncomeController.to.weeklyBudgetList?.clear();
          CheckBoxController.to.weeklyBudgetCheckBoxValueList.clear();
          return false;
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth > 1000;
            return Scaffold(
              backgroundColor: constraints.maxWidth > 1000 ? colorEDF2F6 : Colors.white,
              // resizeToAvoidBottomInset: false,
              body: Align(
                alignment: maxWidth ? Alignment.center : Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                    width: maxWidth ? 600 : null,
                    height: maxWidth ? 620 : null,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              maxWidth
                                  ? const SizedBox()
                                  : IconButton(
                                      icon: const Icon(
                                        Icons.chevron_left,
                                      ),
                                      onPressed: () {
                                        screenIndexController.updateIndex(index: 5);
                                        GetIncomeController.to.weeklyBudgetList?.clear();
                                        CheckBoxController.to.weeklyBudgetCheckBoxValueList.clear();
                                      },
                                    ),
                              maxWidth
                                  ? Container()
                                  : Align(
                                      child: Image.asset(
                                        foreCashLogo2,
                                        height: Get.height * 0.055,
                                        width: Get.height * 0.25,
                                        // fit: BoxFit.cover,
                                      ),
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: maxWidth ? Get.height * 0.055 : Get.height * 0.075,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    maxWidth
                                        ? TextButton(
                                            onPressed: () {
                                              screenIndexController.updateIndex(index: 5);
                                              GetIncomeController.to.weeklyBudgetList?.clear();
                                              CheckBoxController.to.weeklyBudgetCheckBoxValueList.clear();
                                            },
                                            child: Text(
                                              backButton,
                                              style: backButtonStyle,
                                            ))
                                        : const SizedBox(),
                                    Text(
                                      setupCalendar,
                                      style: headTitleTheme,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      width: maxWidth ? Get.width * 0.035 : 0.0,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Align(
                                  alignment: const FractionalOffset(0.5, 0.0),
                                  child: Text(
                                    maxWidth ? '' : createNewAccount,
                                    style: textSpanStyle1,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.06,
                                ),
                                Text(
                                  resetWeek,
                                  style: resetTextStyle,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                  // height: Get.height * 0.044,
                                  height: 45,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: GetBuilder<SelectedDropDownItem>(
                                    builder: (controller1) {
                                      return commonDropDown(
                                          selectedItemTextStyle: dropDownStyle2,
                                          valueTextStyle: dropDownStyle,
                                          value: controller.setupCalendarDay,
                                          itemList: daysList,
                                          onChanged: (item) {
                                            controller.changeSetupCalendarDay(
                                              item: item,
                                            );
                                            print(item);
                                          });
                                    },
                                  ),
                                  decoration: BoxDecoration(color: colorEDF2F6, borderRadius: BorderRadius.circular(4)),
                                ),
                                SizedBox(
                                  height: Get.height * 0.004,
                                ),
                                Text(
                                  dropDownText,
                                  style: dropDownSubTitleStyle,
                                ),
                                SizedBox(
                                  height: Get.height * 0.05,
                                ),
                                Text(
                                  lowBalanceWarning,
                                  style: resetTextStyle,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                commonTextFormField(
                                    validationFunction: (value) {
                                      if (value!.isEmpty) {
                                        return 'Add low balance warning';
                                      }
                                    },
                                    textStyle: textFieldStyle,
                                    inputFormatter: [digitInputFormatter()],
                                    textEditingController: _amountController,
                                    prefixText: dollarHint,
                                    prefixstyle: incomeNameStyle,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
                                Padding(
                                  padding: EdgeInsets.only(bottom: maxWidth ? Get.height * 0.06 : Get.height * 0.25),
                                  child: Text(
                                    maxWidth ? '$recomended' '${_amountController.text}' : '',
                                    style: recomendedTextStyle,
                                  ),
                                ),
                                commonButton(
                                  height: 50,
                                  text: done,
                                  onPress: () {
                                    if (_formKey.currentState!.validate()) {
                                      int selectedDay = int.parse(controller.setupCalendarDay
                                          .toString()
                                          .replaceAll('Sunday', '0')
                                          .replaceAll('Monday', '1')
                                          .replaceAll('Tuesday', '2')
                                          .replaceAll('WedDay', '3')
                                          .replaceAll('Thursday', '4')
                                          .replaceAll('Friday', '5')
                                          .replaceAll('Saturday', '6'));
                                      SetUpCalendarController.to.callCalendar(
                                        resetWeekOn: selectedDay,
                                        lowBalance: _amountController.text,
                                        onSuccess: () {
                                          Get.off(const AllSetScreen());
                                          screenIndexController.updateIndex(index: 0);
                                          String stringDate = '2022-03-08';
                                          // now.subtract(Duration(days: currentDay))

                                          DateTime parsedStringDate = DateFormat('yyyy-MM-dd').parse(stringDate);
                                          int currentDay = parsedStringDate.weekday;
                                          DateTime firstDayOfWeek = parsedStringDate.subtract(Duration(days: parsedStringDate.weekday));
                                          DateTime dateTime = TotalIncomeExpenseController.to.findFirstDateOfTheWeek(DateTime.now());

                                          print('::::::${dateTime}');
                                          print('firstDate${firstDayOfWeek}');
                                          for (int i = 0; i < 7; i++) {
                                            DateTime durationAddedDate = dateTime.add(Duration(days: i));
                                            if (durationAddedDate.weekday == selectedDay) {
                                              selectedResetWeekDay = durationAddedDate;
                                              print('[[[[]]]]${durationAddedDate}');
                                            }
                                          }
                                          print('???$selectedResetWeekDay');
                                        },
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
