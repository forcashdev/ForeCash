import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/controller/selected_dropdown_controller.dart';
import 'package:fore_cash/controller/set_up_calendar_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class UpdateCalendarScreen extends StatelessWidget {
  const UpdateCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectedDropDownItem());
    TextEditingController _amountController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            backgroundColor: maxWidth ? backGroundColor : null,
            appBar: maxWidth ? appBarWithUserNAme(context: context) : null,
            // resizeToAvoidBottomInset: false,

            body: Center(
              child: Container(
                decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
                width: maxWidth ? 600 : null,
                height: maxWidth ? 540 : null,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constraints.maxWidth > 1000 ? 0.0 : Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          constraints.maxWidth > 1000
                              ? SizedBox()
                              : IconButton(
                                  splashRadius: 0.1,
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.chevron_left,
                                  )),
                          constraints.maxWidth > 1000
                              ? Container()
                              : Text(
                                  configureText,
                                  style: mobileAppBarStyle,
                                ),
                          SizedBox(
                            width: context.isTablet ? Get.width * 0.0 : Get.width * 0.1,
                          )
                        ],
                      ),
                      maxWidth ? Container() : commonDivider(),
                      SizedBox(
                        height: Get.height * 0.055,
                      ),
                      maxWidth
                          ? Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.04),
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  backButton,
                                  style: backButtonStyle,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      maxWidth
                          ? Align(
                              alignment: FractionalOffset(0.5, 0.0),
                              child: Text(
                                configureText,
                                style: mobileAppBarStyle,
                              ),
                            )
                          : Container(),

                      SizedBox(
                        height: Get.height * 0.07,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.04),
                        child: Text(
                          resetWeek,
                          style: resetTextStyle,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 6,
                        ),
                        // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                        // height: Get.height * 0.044,
                        height: 45, margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
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
                        decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                      ),
                      SizedBox(
                        height: Get.height * 0.004,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.04),
                        child: Text(
                          dropDownText,
                          style: dropDownSubTitleStyle,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.04),
                        child: Text(
                          lowBalanceWarning,
                          style: resetTextStyle,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        // child: TextField(
                        //   style: textFieldStyle,
                        //   controller: _amountController,
                        //   decoration: InputDecoration(
                        //     hintStyle: textFieldStyle2,
                        //     filled: true,
                        //     fillColor: commonTextFieldColor,
                        //     hintText: dollarHint,
                        //     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        //     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        //     disabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     border: InputBorder.none,
                        //   ),
                        // ),
                        child: commonTextFormField(
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: maxWidth ? Get.height * 0.05 : Get.height * 0.35, left: Get.width * 0.04),
                        child: Text(
                          '$recomended' '${_amountController.text}',
                          style: recomendedTextStyle,
                        ),
                      ),
                      // SizedBox(
                      //   height: maxWidth ? Get.height * 0.2 : Get.height * 0.3,
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        child: commonButton(
                          height: 50,
                          text: next,
                          onPress: () async {
                            if (_formKey.currentState!.validate()) {
                              var response = await SetUpCalendarController.to.callCalendar(
                                  resetWeekOn: controller.setupCalendarDay
                                      .toString()
                                      .replaceAll('Sunday', '1')
                                      .replaceAll('Monday', '2')
                                      .replaceAll('Tuesday', '3')
                                      .replaceAll('WedDay', '4')
                                      .replaceAll('Thursday', '5')
                                      .replaceAll('Friday', '6')
                                      .replaceAll('Saturday', '7'),
                                  lowBalance: _amountController.text,
                                  onSuccess: () {
                                    Get.back();
                                  });
                              // if (response["success"] == true) {

                              // }

                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
