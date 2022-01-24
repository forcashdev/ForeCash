import 'package:flutter/cupertino.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:get/get.dart';

class CommonIncomeScrollableWidget {
  static scrollableWidget({int? listViewItemCount, BoxConstraints? constraints, Function? onPageChanged, dynamic controller, int? pageViewItemCount, dynamic text}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listViewItemCount,
      itemBuilder: (context, index) {
        return SizedBox(
          height: Get.height * 0.04,
          child: Padding(
            padding: EdgeInsets.only(top: index == 0 && constraints!.maxWidth < 1000 ? Get.height * 0.01 : 0.05),
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
          ),
        );
      },
    );
  }
}
