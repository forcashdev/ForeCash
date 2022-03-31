import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'get_income_controller.dart';

class TotalIncomeExpenseController extends GetxController {
  static TotalIncomeExpenseController get to => Get.find();

  RxList totalMonthlyIncomeList = [].obs;
  RxList totalWeeklyIncomeList = [].obs;
  RxList totalMonthlyExpenseList = [].obs;
  RxList totalWeeklyBudgetList = [].obs;
  RxList totalOneTimeIncomeList = [].obs;
  RxList totalOneTimeExpenseList = [].obs;
  final RxList datesList = [].obs;
  final DateFormat formatter = DateFormat('MMM, dd');
  int totalCount = 0;

  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday % 7));
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  calculateMoreFutureDates({ScrollController? scrollController}) {
    int totalMonthlyIncomeCount = 0;
    int totalWeeklyIncomeCount = 0;
    int totalMonthlyExpenseCount = 0;
    int totalWeeklyBudgetCount = 0;
    int totalOneTimeIncomeCount = 0;
    int totalOneTimeExpenseCount = 0;
    String? date;
    String? start;

    DateTime temp = scrollController?.position.pixels == scrollController?.position.maxScrollExtent
        ? DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList.last.toString())
        : DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList.first.toString());
    DateTime newTemp = DateTime(
      temp.year,
      temp.month,
      temp.day,
    );
    print('!!!!!${newTemp}');
    for (int i = 0; i < 7; i++) {
      ///date
      if (scrollController?.position.pixels == scrollController?.position.maxScrollExtent) {
        // date = DateFormat("yyyy-MM-dd").format(i == 0 ? newTemp.add(const Duration(days: 7)) : DateTime.parse(date!).add(const Duration(days: 7)));
        date = DateFormat("yyyy-MM-dd").format(i == 0 ? newTemp.add(const Duration(days: 7)) : DateTime.parse(date!).add(const Duration(days: 7)));
        // date = formatter.format(newTemp.add(Duration(days: i + 1)));
        TotalIncomeExpenseController.to.datesList.add(date);
      } else {
        final DateTime startDate = i == 0 ? newTemp.add(const Duration(days: -7)) : DateTime.parse(start!).add(const Duration(days: -7));
        // final DateTime startDate = newTemp.subtract(Duration(days: i + 1));
        // start = DateFormat("yyyy-MM-dd").format(startDate);
        start = startDate.toString();
        TotalIncomeExpenseController.to.datesList.insert(0, DateFormat("yyyy-MM-dd").format(startDate));
        // DateFormat('yyyy-MM-dd').parse(start);
      }

      ///MonthlyIncome
      for (int j = 0; j < GetIncomeController.to.monthlyIncomeList!.length; j++) {
        // if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString())).toString().replaceRange(0, 4, '') ==
        //     (scrollController?.position.pixels == scrollController?.position.maxScrollExtent ? date?.replaceRange(0, 4, '') : start?.replaceRange(0, 4, ''))) {
        //   totalCount += GetIncomeController.to.monthlyIncomeList![j].amount!;
        // }

        if (int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![j].date!)).toString().replaceRange(0, 4, '')) <
                (scrollController?.position.pixels == scrollController?.position.maxScrollExtent
                        ? int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(date!)).toString().replaceRange(0, 4, ''))
                        : int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(start!)).toString().replaceRange(0, 4, ''))) +
                    7 &&
            int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![j].date!)).toString().replaceRange(0, 4, '')) >=
                (scrollController?.position.pixels == scrollController?.position.maxScrollExtent
                    ? int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(date!)).toString().replaceRange(0, 4, ''))
                    : int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(start!)).toString().replaceRange(0, 4, '')))) {
          totalMonthlyIncomeCount += GetIncomeController.to.monthlyIncomeList![j].amount!;
        }
      }

      ///WeeklyIncome
      for (int j = 0; j < GetIncomeController.to.weeklyIncomesList!.length; j++) {
        DateTime tempWeeklyDate = formatter.parse((scrollController?.position.pixels == scrollController?.position.maxScrollExtent
            ? formatter.format(DateFormat("yyyy-MM-dd").parse(date!))
            : formatter.format(DateFormat("yyyy-MM-dd").parse(start!))));
        DateTime dateFormatedWeeklyDate = DateTime.parse(GetIncomeController.to.weeklyIncomesList![j].date!);
        // DateTime tempWeeklyIncome = DateFormat('MM-dd').parse(dateFormatedWeeklyDate.toString());
        DateTime newTempWeekly = DateTime(
          DateTime.now().year,
          tempWeeklyDate.month,
          tempWeeklyDate.day,
        );
        DateTime newTempWeeklyIncome = DateTime(
          DateTime.now().year,
          dateFormatedWeeklyDate.month,
          dateFormatedWeeklyDate.day,
        );
        // if (DateFormat('EEEE').format(newTempWeekly) == DateFormat('EEEE').format(newTempWeeklyIncome)) {
        //   totalWeeklyIncomeCount += GetIncomeController.to.weeklyIncomesList![j].amount!;
        // }
        if (newTempWeekly.isAfter(newTempWeeklyIncome) || newTempWeekly.isBefore(newTempWeeklyIncome)) {
          totalWeeklyIncomeCount += GetIncomeController.to.weeklyIncomesList![j].amount!;
        }
      }

      ///MonthlyExpense
      for (int j = 0; j < GetIncomeController.to.monthlyExpenseList!.length; j++) {
        // if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date.toString())).toString().replaceRange(0, 4, '') ==
        //     (scrollController?.position.pixels == scrollController?.position.maxScrollExtent ? date?.replaceRange(0, 4, '') : start?.replaceRange(0, 4, ''))) {
        //   totalMonthlyExpenseCount += GetIncomeController.to.monthlyExpenseList![j].amount!;
        // }

        if (int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date!)).toString().replaceRange(0, 4, '')) <
                (scrollController?.position.pixels == scrollController?.position.maxScrollExtent
                        ? int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(date!)).toString().replaceRange(0, 4, ''))
                        : int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(start!)).toString().replaceRange(0, 4, ''))) +
                    7 &&
            int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date!)).toString().replaceRange(0, 4, '')) >=
                (scrollController?.position.pixels == scrollController?.position.maxScrollExtent
                    ? int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(date!)).toString().replaceRange(0, 4, ''))
                    : int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(start!)).toString().replaceRange(0, 4, '')))) {
          totalMonthlyExpenseCount += GetIncomeController.to.monthlyExpenseList![j].amount!;
        }
      }

      ///WeeklyBudget
      for (int j = 0; j < GetIncomeController.to.weeklyBudgetList!.length; j++) {
        DateTime tempWeeklyBudgetDate = formatter.parse((scrollController?.position.pixels == scrollController?.position.maxScrollExtent
            ? formatter.format(DateFormat("yyyy-MM-dd").parse(date!))
            : formatter.format(DateFormat("yyyy-MM-dd").parse(start!))));
        DateTime dateFormatedWeeklyBudgetDate = DateTime.parse(GetIncomeController.to.weeklyBudgetList![j].date!);
        DateTime tempWeeklyIncome = DateFormat('MM-dd').parse(dateFormatedWeeklyBudgetDate.toString());
        DateTime newTempWeeklyBudgetDate = DateTime(
          DateTime.now().year,
          tempWeeklyBudgetDate.month,
          tempWeeklyBudgetDate.day,
        );
        DateTime newTempWeeklyBudget = DateTime(
          DateTime.now().year,
          dateFormatedWeeklyBudgetDate.month,
          dateFormatedWeeklyBudgetDate.day,
        );
        // if (DateFormat('EEEE').format(newTempWeeklyBudgetDate) == DateFormat('EEEE').format(newTempWeeklyBudget)) {
        //   totalWeeklyBudgetCount += GetIncomeController.to.weeklyBudgetList![j].amount!;
        // }
        if (newTempWeeklyBudgetDate.isAfter(newTempWeeklyBudget) || newTempWeeklyBudgetDate.isBefore(newTempWeeklyBudget)) {
          totalWeeklyBudgetCount += GetIncomeController.to.weeklyBudgetList![j].amount!;
        }
      }

      ///OneTimeIncome
      for (int j = 0; j < GetIncomeController.to.oneTimeIncomeList!.length; j++) {
        // if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date.toString())).toString().replaceRange(0, 4, '') ==
        //     (scrollController?.position.pixels == scrollController?.position.maxScrollExtent ? date?.replaceRange(0, 4, '') : start?.replaceRange(0, 4, ''))) {
        //   totalMonthlyExpenseCount += GetIncomeController.to.monthlyExpenseList![j].amount!;
        // }

        if (int.parse(formatter.format(DateTime.parse(GetIncomeController.to.oneTimeIncomeList![j].date!)).toString().replaceRange(0, 4, '')) <
                (scrollController?.position.pixels == scrollController?.position.maxScrollExtent
                        ? int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(date!)).toString().replaceRange(0, 4, ''))
                        : int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(start!)).toString().replaceRange(0, 4, ''))) +
                    7 &&
            int.parse(formatter.format(DateTime.parse(GetIncomeController.to.oneTimeIncomeList![j].date!)).toString().replaceRange(0, 4, '')) >=
                (scrollController?.position.pixels == scrollController?.position.maxScrollExtent
                    ? int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(date!)).toString().replaceRange(0, 4, ''))
                    : int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(start!)).toString().replaceRange(0, 4, '')))) {
          totalOneTimeIncomeCount += GetIncomeController.to.oneTimeIncomeList![j].amount!;
        }
      }

      ///OneTimeExpense
      for (int j = 0; j < GetIncomeController.to.oneTimeExpenseList!.length; j++) {
        // if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date.toString())).toString().replaceRange(0, 4, '') ==
        //     (scrollController?.position.pixels == scrollController?.position.maxScrollExtent ? date?.replaceRange(0, 4, '') : start?.replaceRange(0, 4, ''))) {
        //   totalMonthlyExpenseCount += GetIncomeController.to.monthlyExpenseList![j].amount!;
        // }

        if (int.parse(formatter.format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![j].date!)).toString().replaceRange(0, 4, '')) <
                (scrollController?.position.pixels == scrollController?.position.maxScrollExtent
                        ? int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(date!)).toString().replaceRange(0, 4, ''))
                        : int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(start!)).toString().replaceRange(0, 4, ''))) +
                    7 &&
            int.parse(formatter.format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![j].date!)).toString().replaceRange(0, 4, '')) >=
                (scrollController?.position.pixels == scrollController?.position.maxScrollExtent
                    ? int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(date!)).toString().replaceRange(0, 4, ''))
                    : int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(start!)).toString().replaceRange(0, 4, '')))) {
          totalOneTimeExpenseCount += GetIncomeController.to.oneTimeExpenseList![j].amount!;
        }
      }

      if (scrollController?.position.pixels == scrollController?.position.maxScrollExtent) {
        totalMonthlyIncomeList.add(totalMonthlyIncomeCount);
        totalWeeklyIncomeList.add(totalWeeklyIncomeCount);
        totalMonthlyExpenseList.add(totalMonthlyExpenseCount);
        totalWeeklyBudgetList.add(totalWeeklyBudgetCount);
        totalOneTimeIncomeList.add(totalOneTimeIncomeCount);
        totalOneTimeExpenseList.add(totalOneTimeExpenseCount);
      } else {
        totalMonthlyIncomeList.insert(0, totalMonthlyIncomeCount);
        totalWeeklyIncomeList.insert(0, totalWeeklyIncomeCount);
        totalMonthlyExpenseList.insert(0, totalMonthlyExpenseCount);
        totalWeeklyBudgetList.insert(0, totalWeeklyBudgetCount);
        totalOneTimeIncomeList.insert(0, totalOneTimeIncomeCount);
        totalOneTimeExpenseList.insert(0, totalOneTimeExpenseCount);
      }
      totalMonthlyIncomeCount = 0;
      totalWeeklyIncomeCount = 0;
      totalMonthlyExpenseCount = 0;
      totalWeeklyBudgetCount = 0;
      totalOneTimeIncomeCount = 0;
      totalOneTimeExpenseCount = 0;
    }
  }

  totalMonthlyIncomeLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.monthlyIncomeList!.length; j++) {
        // if (int.parse(datesList[i + 1].toString().replaceRange(0, 4, '')) < int.parse(datesList[i].toString().replaceRange(0, 4, ''))) {
        //   print(
        //       '>>>${int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![i].date.toString())).toString().replaceRange(0, 4, ''))}>>>>${int.parse(datesList[j].toString().replaceRange(0, 4, ''))}');
        //   totalCount += GetIncomeController.to.monthlyIncomeList![j].amount!;
        // }
        if (int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString())).toString().replaceRange(0, 4, '')) <
                int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(datesList[i])).toString().replaceRange(0, 4, '')) + 7 &&
            int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString())).toString().replaceRange(0, 4, '')) >=
                int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(datesList[i])).toString().replaceRange(0, 4, ''))) {
          totalCount += GetIncomeController.to.monthlyIncomeList![j].amount!;
        }
        // if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString())).toString().replaceRange(0, 4, '') == datesList[i].toString().replaceRange(0, 4, '')) {
        //   totalCount += GetIncomeController.to.monthlyIncomeList![j].amount!;
        // }
        // if (formatter.parse(datesList[i].toString()).day < formatter.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString()).day ||
        //     formatter.parse(datesList[i].toString()).day > formatter.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString()).day &&
        //         formatter.parse(datesList[i].toString()).day == formatter.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString()).day)
        // {
        //   totalCount += GetIncomeController.to.monthlyIncomeList![j].amount!;
        // }

      }
      totalMonthlyIncomeList.add(totalCount);
      totalCount = 0;
    }
  }

  totalWeeklyIncomeLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.weeklyIncomesList!.length; j++) {
        DateTime temp = DateFormat("yyyy-MM-dd").parse(datesList[i]);
        DateTime dateFormatedWeeklyDate = DateTime.parse(GetIncomeController.to.weeklyIncomesList![j].date!);
        // if (temp.isAfter(dateFormatedWeeklyDate) || temp.isBefore(dateFormatedWeeklyDate)) {
        //   totalCount += GetIncomeController.to.weeklyIncomesList![j].amount!;
        // }
        DateTime newTemp = DateTime(
          temp.year,
          temp.month,
          temp.day,
        );
        DateTime newTempWeeklyIncome = DateTime(
          dateFormatedWeeklyDate.year,
          dateFormatedWeeklyDate.month,
          dateFormatedWeeklyDate.day,
        );
        if (newTemp.isAfter(newTempWeeklyIncome) || newTemp.isBefore(newTempWeeklyIncome)) {
          totalCount += GetIncomeController.to.weeklyIncomesList![j].amount!;
        }
      }
      totalWeeklyIncomeList.add(totalCount);
      totalCount = 0;
    }
  }

  totalMonthlyExpenseLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.monthlyExpenseList!.length; j++) {
        // if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date.toString())) == datesList[i]) {
        //   totalCount += GetIncomeController.to.monthlyExpenseList![j].amount!;
        // }
        if (int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date.toString())).toString().replaceRange(0, 4, '')) <
                int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(datesList[i])).toString().replaceRange(0, 4, '')) + 7 &&
            int.parse(formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date.toString())).toString().replaceRange(0, 4, '')) >=
                int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(datesList[i])).toString().replaceRange(0, 4, ''))) {
          totalCount += GetIncomeController.to.monthlyExpenseList![j].amount!;
        }
      }
      totalMonthlyExpenseList.add(totalCount);
      totalCount = 0;
    }
  }

  totalWeeklyBudgetLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.weeklyBudgetList!.length; j++) {
        DateTime temp = DateFormat("yyyy-MM-dd").parse(datesList[i]);
        DateTime dateFormatedWeeklyBudgetDate = DateTime.parse(GetIncomeController.to.weeklyIncomesList![j].date!);
        // DateTime temp = formatter.parse(datesList[i]);
        // DateTime dateFormatedWeeklyBudgetDate = DateTime.parse(GetIncomeController.to.weeklyBudgetList![j].date!);
        // DateTime tempWeeklyIncome = DateFormat('MM-dd').parse(dateFormatedWeeklyBudgetDate.toString());
        DateTime newTemp = DateTime(
          temp.year,
          temp.month,
          temp.day,
        );

        DateTime newTempWeeklyBudget = DateTime(
          dateFormatedWeeklyBudgetDate.year,
          dateFormatedWeeklyBudgetDate.month,
          dateFormatedWeeklyBudgetDate.day,
        );
        print('>>>>>>>>>>>>$newTemp>>>>>>>$newTempWeeklyBudget');
        // if (DateFormat('EEEE').format(newTemp) == DateFormat('EEEE').format(newTempWeeklyBudget)) {
        if (newTemp.isAfter(newTempWeeklyBudget) || newTemp.isBefore(newTempWeeklyBudget)) {
          totalCount += GetIncomeController.to.weeklyBudgetList![j].amount!;
        }
      }
      totalWeeklyBudgetList.add(totalCount);
      totalCount = 0;
    }
  }

  totalOneTimeIncomeLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.oneTimeIncomeList!.length; j++) {
        if (int.parse(formatter.format(DateTime.parse(GetIncomeController.to.oneTimeIncomeList![j].date.toString())).toString().replaceRange(0, 4, '')) <
                int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(datesList[i])).toString().replaceRange(0, 4, '')) + 7 &&
            int.parse(formatter.format(DateTime.parse(GetIncomeController.to.oneTimeIncomeList![j].date.toString())).toString().replaceRange(0, 4, '')) >=
                int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(datesList[i])).toString().replaceRange(0, 4, ''))) {
          totalCount += GetIncomeController.to.oneTimeIncomeList![j].amount!;
        }
      }
      totalOneTimeIncomeList.add(totalCount);
      totalCount = 0;
    }
  }

  totalOneTimeExpenseLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.oneTimeExpenseList!.length; j++) {
        if (int.parse(formatter.format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![j].date.toString())).toString().replaceRange(0, 4, '')) <
                int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(datesList[i])).toString().replaceRange(0, 4, '')) + 7 &&
            int.parse(formatter.format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![j].date.toString())).toString().replaceRange(0, 4, '')) >=
                int.parse(formatter.format(DateFormat("yyyy-MM-dd").parse(datesList[i])).toString().replaceRange(0, 4, ''))) {
          totalCount += GetIncomeController.to.oneTimeExpenseList![j].amount!;
        }
      }
      totalOneTimeExpenseList.add(totalCount);
      totalCount = 0;
    }
  }
}
