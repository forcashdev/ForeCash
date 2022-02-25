import 'package:flutter/cupertino.dart';
import 'package:fore_cash/utility/const.dart';

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
