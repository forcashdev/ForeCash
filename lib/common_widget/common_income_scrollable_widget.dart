import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:get/get.dart';

// ListView.builder(
// shrinkWrap: true,
// itemCount: monthlyIncomepageControllerList.length,
// itemBuilder: (context, index) {
// return SizedBox(
// height: Get.height * 0.04,
// child: Padding(
// padding: EdgeInsets.only(top: index == 0 && constraints.maxWidth < 1000 ? Get.height * 0.01 : 0.05),
// child: PageView.builder(
// // scrollDirection: Axis.horizontal,
// onPageChanged: (value) {
// List.generate(
// weeklyIncomePageControllerList.length,
// (index) => weeklyIncomePageControllerList[index].animateToPage(value,
// duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
// List.generate(
// monthlyExpensePageControllerList.length,
// (index) => monthlyExpensePageControllerList[index]
//     .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
// List.generate(
// weeklyBudgetPageControllerList.length,
// (index) => weeklyBudgetPageControllerList[index]
//     .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
// // _pageController2.jumpToPage(value);
// _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
// },
// controller: monthlyIncomepageControllerList[index],
// itemCount: incomes.length,
// itemBuilder: (BuildContext context, int index1) {
// return Text(
// incomes[index1],
// style: greyIncomeTexStyle10W500,
// textAlign: TextAlign.center,
// );
// },
// ),
// ),
// );
// },
// )

class CommonIncomeScrollableWidget {
  static scrollableWidget({double? height, bool? editMode, int? listViewItemCount, BoxConstraints? constraints, Function? onPageChanged, dynamic controller, int? pageViewItemCount, dynamic text}) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listViewItemCount,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: Get.height * 0.014),
          // color: Colors.red,
          height: height != null
              ? height
              : editMode == true
                  ? Get.height * 0.06
                  : Get.height * 0.018,
          child: PageView.builder(
            // scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              onPageChanged!(value);
            },
            controller: controller[index],
            itemCount: pageViewItemCount,
            itemBuilder: (BuildContext context, int index1) {
              return Text(
                text[index1],
                style: greyIncomeTexStyle10W500,
                textAlign: TextAlign.center,
              );
            },
          ),
        );
      },
    );
  }
}
