import 'package:flutter/cupertino.dart';
import 'package:fore_cash/utility/const.dart';

class PageViewCommonWidget {
  static pageViewCommonWidget({int? itemCount, PageController? pageController, dynamic text, Function? onPageChanged}) {
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
        // List.generate(monthlyIncomepageControllerList.length, (index) => monthlyIncomepageControllerList[index].jumpToPage(value));
        // List.generate(weeklyIncomePageControllerList.length, (index) => weeklyIncomePageControllerList[index].jumpToPage(value));
        // List.generate(weeklyBudgetPageControllerList.length, (index) => weeklyBudgetPageControllerList[index].jumpToPage(value));
        // List.generate(oneTimeIncomePageControllerList.length, (index) => oneTimeIncomePageControllerList[index].jumpToPage(value));
        // List.generate(oneTimeExpensePageControllerList.length, (index) => oneTimeExpensePageControllerList[index].jumpToPage(value));
        // List.generate(monthlyExpensePageControllerList.length, (index) => monthlyExpensePageControllerList[index].jumpToPage(value)); // _pageController2.jumpToPage(value);
        // _previousWeekBalancePageController.jumpToPage(value);
        // _totalWeeklyExpensePageController.jumpToPage(value);
        // _totalWeeklyIncomePageController.jumpToPage(value);

        // print(value);
      },
    );
  }
}
