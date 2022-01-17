import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
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
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            backgroundColor: maxWidth ? backGroundColor : null,
            appBar: maxWidth
                ? AppBarWithUserName.appBarWithUserNAme()
                // CommonWebAppbar.commonWebAppbar(scale: Get.mediaQuery.size.aspectRatio * 150, actions: [
                //         Padding(
                //           padding: EdgeInsets.only(top: Get.height * 0.01),
                //           child: Stack(
                //             children: [
                //               Container(
                //                 height: 35,
                //                 width: 35,
                //                 padding: const EdgeInsets.all(7),
                //                 decoration: const BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   color: appBarActionColor,
                //                 ),
                //                 child: Image.asset('assets/image/png/notificationIcon.png'),
                //               ),
                //               const Positioned(
                //                 right: 3,
                //                 top: 4,
                //                 child: CircleAvatar(
                //                   backgroundColor: cameraBackGroundColor,
                //                   radius: 6,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         SizedBox(
                //           width: Get.width * 0.007,
                //         ),
                //         Container(
                //           width: 160,
                //           margin: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01, right: Get.width * 0.015),
                //           padding: const EdgeInsets.only(left: 4),
                //           decoration: BoxDecoration(color: appBarActionColor, borderRadius: BorderRadius.circular(25)),
                //           child: Row(
                //             children: [
                //               const CircleAvatar(
                //                 radius: 17,
                //                 backgroundImage: AssetImage('assets/image/png/profilePhoto.png'),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 5),
                //                 child: Text(
                //                   userName,
                //                   style: userNameProfileStyle,
                //                 ),
                //               ),
                //               IconButton(
                //                   onPressed: () {},
                //                   icon: const Icon(
                //                     Icons.arrow_drop_down,
                //                     color: Colors.black,
                //                   ))
                //             ],
                //           ),
                //         ),
                //       ])
                : CommonMobileAppbar.commonMobileAppbar(
                    color: Colors.white.withOpacity(0.9),
                    titleTextStyle: mobileAppBarStyle,
                    centerTitle: true,
                    title: Text(configureText),
                    leading: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
            // resizeToAvoidBottomInset: false,

            body: Center(
              child: Container(
                decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
                width: maxWidth ? 600 : null,
                height: maxWidth ? 540 : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    maxWidth ? Container() : commonDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.055,
                          ),
                          maxWidth
                              ? Text(
                                  backButton,
                                  style: backButtonStyle,
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
                          Container(),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          // Align(
                          //   alignment: FractionalOffset(0.5, 0.0),
                          //   child: Text(
                          //     maxWidth ? '' : createNewAccount,
                          //     style: textSpanStyle1,
                          //     textAlign: TextAlign.center,
                          //     maxLines: 2,
                          //   ),
                          // ),
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
                                return DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: controller.setupCalendarDay,
                                    // value: controller.selectedItem,
                                    style: dropDownStyle,
                                    items: daysList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: dropDownStyle2,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (item) {
                                      controller.changeSetupCalendarDay(
                                        item: item,
                                      );
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
                            padding: EdgeInsets.only(bottom: maxWidth ? Get.height * 0.05 : Get.height * 0.35),
                            child: Text(
                              '$recomended' '${_amountController.text}',
                              style: recomendedTextStyle,
                            ),
                          ),
                          // SizedBox(
                          //   height: maxWidth ? Get.height * 0.2 : Get.height * 0.3,
                          // ),
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
