import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/selected_bank_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:get/get.dart';

class ConnectBankAccountScreen extends StatelessWidget {
  const ConnectBankAccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectedBank());
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext layOutContext, BoxConstraints constraints) {
          return Scaffold(
            backgroundColor: constraints.maxWidth > 1000 ? backGroundColor : Colors.white,
            body: Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                width: constraints.maxWidth > 1000 ? 700 : null,
                height: constraints.maxWidth > 1000 ? 650 : null,
                child: Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.04, right: Get.width * 0.04, bottom: constraints.maxWidth < 1000 ? Get.width * 0.0 : 0.1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Align(
                        alignment: FractionalOffset(0.5, 0.0),
                        child: constraints.maxWidth < 1000
                            ? Image.asset(
                                foreCashLogo2,
                                height: Get.height * 0.055,
                                width: Get.height * 0.25,
                              )
                            : null,
                      ),
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      Text(
                        connectBank,
                        style: headTitleTheme,
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          hintText: searchBank,
                          hintStyle: searchBankStyle,
                          fillColor: commonTextFieldColor,
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Get.size.aspectRatio * 20),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      _bankListWidget(constraints: constraints)
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

  _bankListWidget({BoxConstraints? constraints}) {
    final screenIndexController = Get.put(ScreenIndexController());
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          children: List.generate(
              bankListImage.length,
              (index) => GetBuilder<SelectedBank>(
                    builder: (controller) => Padding(
                      padding: EdgeInsets.all(constraints!.maxWidth > 1000 ? 13.0 : 11.0),
                      child: InkWell(
                        onTap: () {
                          controller.changeBank(bankIndex: index);
                          print(controller.selectedIndex);
                          screenIndex = 2;
                          print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
                          screenIndexController.updateIndex(index: 2);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => MonthlyIncomeScreen(),
                          //     ));
                          // Get.to(MonthlyIncomeScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: controller.selectedIndex == index ? Color(0xff12CC8E).withOpacity(0.2) : null,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: controller.selectedIndex == index ? Colors.green : Color(0xff5A7184), width: 1.2),
                          ),
                          height: 65,
                          width: 142,
                          child: Image.asset(bankListImage[index]),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
