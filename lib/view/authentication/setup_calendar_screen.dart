import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class SetupCalendarScreen extends StatelessWidget {
  const SetupCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectedDropDownItem());
    TextEditingController _amountController = TextEditingController();
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                width: maxWidth ? 600 : null,
                height: maxWidth ? 680 : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        maxWidth
                            ? const SizedBox()
                            : const Icon(
                                Icons.chevron_left,
                              ),
                        maxWidth
                            ? Container()
                            : Image.asset(
                                foreCashLogo2,
                                scale: 3,
                              ),
                        Container()
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
                            height: Get.height * 0.055,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              maxWidth
                                  ? const Text(
                                      '< Back',
                                      style: backButtonStyle,
                                    )
                                  : const SizedBox(),
                              Text(
                                setupCalendar,
                                style: headTitleTheme,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                              Container()
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Align(
                            alignment: FractionalOffset(0.5, 0.0),
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
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                            // height: Get.height * 0.044,
                            height: 45,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: GetBuilder<SelectedDropDownItem>(
                              builder: (controller1) {
                                // return commonDropDown(value: controller.selectDayDropDown[index], itemList: days);
                                // return commonDropDown(itemList: itemsList[index], value: controller.selectedItem);
                                return CommonDropDown.commonDropDown(
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
                                //   DropdownButtonHideUnderline(
                                //   child: DropdownButton(
                                //     value: controller.setupCalendarDay,
                                //     // value: controller.selectedItem,
                                //     style: dropDownStyle,
                                //     items: daysList.map((String items) {
                                //       return DropdownMenuItem(
                                //         value: items,
                                //         child: Text(
                                //           items,
                                //           style: dropDownStyle2,
                                //         ),
                                //       );
                                //     }).toList(),
                                //     onChanged: (item) {
                                //       controller.changeSetupCalendarDay(
                                //         item: item,
                                //       );
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
                            // margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
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
                          TextField(
                            style: textFieldStyle,
                            controller: _amountController,
                            decoration: InputDecoration(
                              hintStyle: textFieldStyle2,
                              filled: true,
                              fillColor: commonTextFieldColor,
                              hintText: dollarHint,
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: maxWidth ? Get.height * 0.05 : Get.height * 0.25),
                            child: Text(
                              maxWidth ? '$recomended' '${_amountController.text}' : '',
                              style: recomendedTextStyle,
                            ),
                          ),
                          CommonMaterialButton.commonButton(
                            height: 50,
                            text: next,
                            onPress: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
