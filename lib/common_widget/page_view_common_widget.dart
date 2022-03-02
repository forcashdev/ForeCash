import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:get/get.dart';

pageViewCommonWidget({int? itemCount, PageController? pageController, dynamic text, Function? onPageChanged}) {
  return PageView.builder(
    itemCount: itemCount,
    scrollDirection: Axis.horizontal,
    controller: pageController,
    itemBuilder: (context, index) {
      return Align(
        alignment: const FractionalOffset(0.45, 0.5),
        child: Text(
          text[index],
          style: greyIncomeTexStyle10W500,
          textAlign: TextAlign.end,
        ),
      );
    },
    onPageChanged: (value) {
      onPageChanged!(value);
    },
  );
}

totalListScrollAbleWidget({
  RxList? totalIncomeExpenseList,
  ScrollController? scrollController,
  int? itemCount,
}) {
  return ListView.builder(
    shrinkWrap: true,
    controller: scrollController,
    scrollDirection: Axis.horizontal,
    itemCount: itemCount,
    itemBuilder: (context, index) {
      return SizedBox(
          width: Get.width * 0.067,
          child: Align(
            alignment: const FractionalOffset(0.5, 0.5),
            child: Text(
              '${totalIncomeExpenseList?[index] == 0 ? '-' : totalIncomeExpenseList?[index]}',
              style: greyDateTexStyle10W400,
              textAlign: TextAlign.center,
            ),
          ));
    },
  );
}
