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
  final RxList datesList = [].obs;
  final DateFormat formatter = DateFormat('MMM, dd');
  int totalCount = 0;
  calculateMoreFutureDates({ScrollController? scrollController}) {
    int totalWeeklyIncomeCount = 0;
    int totalMonthlyExpenseCount = 0;
    int totalWeeklyBudgetCount = 0;
    String? date;
    String? start;
    DateTime temp = scrollController?.position.pixels == scrollController?.position.maxScrollExtent
        ? DateFormat('MMM, dd').parse(TotalIncomeExpenseController.to.datesList.last)
        : DateFormat('MMM, dd').parse(TotalIncomeExpenseController.to.datesList.first);
    print(TotalIncomeExpenseController.to.datesList.last);
    DateTime newTemp = DateTime(
      DateTime.now().year,
      temp.month,
      temp.day,
    );
    print(newTemp);
    print(TotalIncomeExpenseController.to.datesList);
    print('kkkkkkk');
    // datesList.removeRange(0, 14);
    for (int i = 0; i < 15; i++) {
      if (scrollController?.position.pixels == scrollController?.position.maxScrollExtent) {
        date = formatter.format(newTemp.add(Duration(days: i + 1)));
        TotalIncomeExpenseController.to.datesList.add(date);
      } else {
        final DateTime startDate = newTemp.subtract(Duration(days: i + 1));
        start = formatter.format(startDate);
        TotalIncomeExpenseController.to.datesList.insert(0, start);
      }
      for (int j = 0; j < GetIncomeController.to.monthlyIncomeList!.length; j++) {
        if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString())).toString().replaceRange(0, 4, '') ==
            (scrollController?.position.pixels == scrollController?.position.maxScrollExtent ? date?.replaceRange(0, 4, '') : start?.replaceRange(0, 4, ''))) {
          totalCount += GetIncomeController.to.monthlyIncomeList![j].amount!;
        }
      }

      for (int j = 0; j < GetIncomeController.to.weeklyIncomesList!.length; j++) {
        DateTime tempWeeklyDate = DateFormat('MMM, dd').parse((scrollController?.position.pixels == scrollController?.position.maxScrollExtent ? date.toString() : start.toString()));
        DateTime dateFormatedWeeklyDate = DateTime.parse(GetIncomeController.to.weeklyIncomesList![j].date!);
        DateTime tempWeeklyIncome = DateFormat('MM-dd').parse(dateFormatedWeeklyDate.toString());
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
        if (DateFormat('EEEE').format(newTempWeekly) == DateFormat('EEEE').format(newTempWeeklyIncome)) {
          totalWeeklyIncomeCount += GetIncomeController.to.weeklyIncomesList![j].amount!;
        }
      }

      for (int j = 0; j < GetIncomeController.to.monthlyExpenseList!.length; j++) {
        if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date.toString())).toString().replaceRange(0, 4, '') ==
            (scrollController?.position.pixels == scrollController?.position.maxScrollExtent ? date?.replaceRange(0, 4, '') : start?.replaceRange(0, 4, ''))) {
          totalMonthlyExpenseCount += GetIncomeController.to.monthlyExpenseList![j].amount!;
        }
      }

      for (int j = 0; j < GetIncomeController.to.weeklyBudgetList!.length; j++) {
        DateTime tempWeeklyBudgetDate = DateFormat('MMM, dd').parse((scrollController?.position.pixels == scrollController?.position.maxScrollExtent ? date.toString() : start.toString()));
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
        if (DateFormat('EEEE').format(newTempWeeklyBudgetDate) == DateFormat('EEEE').format(newTempWeeklyBudget)) {
          totalWeeklyBudgetCount += GetIncomeController.to.weeklyBudgetList![j].amount!;
        }
      }

      if (scrollController?.position.pixels == scrollController?.position.maxScrollExtent) {
        TotalIncomeExpenseController.to.totalMonthlyIncomeList.add(totalCount);
        TotalIncomeExpenseController.to.totalWeeklyIncomeList.add(totalWeeklyIncomeCount);
        TotalIncomeExpenseController.to.totalMonthlyExpenseList.add(totalMonthlyExpenseCount);
        TotalIncomeExpenseController.to.totalWeeklyBudgetList.add(totalWeeklyBudgetCount);
      } else {
        TotalIncomeExpenseController.to.totalMonthlyIncomeList.insert(0, totalCount);
        TotalIncomeExpenseController.to.totalWeeklyIncomeList.insert(0, totalWeeklyIncomeCount);
        TotalIncomeExpenseController.to.totalMonthlyExpenseList.insert(0, totalMonthlyExpenseCount);
        TotalIncomeExpenseController.to.totalWeeklyBudgetList.insert(0, totalWeeklyBudgetCount);
      }

      print('>>>>>>.$totalWeeklyIncomeCount');
      totalCount = 0;
      totalWeeklyIncomeCount = 0;
      totalMonthlyExpenseCount = 0;
      totalWeeklyBudgetCount = 0;
      print(totalCount);
    }
    print(']]]]]]]');
    print(TotalIncomeExpenseController.to.totalWeeklyIncomeList.length);
    print(TotalIncomeExpenseController.to.totalMonthlyIncomeList.length);
    print(TotalIncomeExpenseController.to.totalWeeklyBudgetList.length);
    print(TotalIncomeExpenseController.to.totalMonthlyExpenseList.length);
    print(TotalIncomeExpenseController.to.datesList.length);
    print(TotalIncomeExpenseController.to.totalWeeklyIncomeList);
    print(TotalIncomeExpenseController.to.totalMonthlyIncomeList);
    print(TotalIncomeExpenseController.to.totalWeeklyBudgetList);
    print(TotalIncomeExpenseController.to.totalMonthlyExpenseList);
    print(TotalIncomeExpenseController.to.datesList);
  }

  totalMonthlyIncomeLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.monthlyIncomeList!.length; j++) {
        if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![j].date.toString())).toString().replaceRange(0, 4, '') == datesList[i].toString().replaceRange(0, 4, '')) {
          totalCount += GetIncomeController.to.monthlyIncomeList![j].amount!;
        }
      }
      totalMonthlyIncomeList.add(totalCount);
      print('>>>>>>.$totalCount');
      totalCount = 0;
      print(totalCount);
    }
    print('/////////');
    print(totalMonthlyIncomeList.length);
    print(datesList.length);
  }

  totalWeeklyIncomeLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.weeklyIncomesList!.length; j++) {
        DateTime temp = DateFormat('MMM, dd').parse(datesList[i]);
        DateTime dateFormatedWeeklyDate = DateTime.parse(GetIncomeController.to.weeklyIncomesList![j].date!);
        DateTime tempWeeklyIncome = DateFormat('MM-dd').parse(dateFormatedWeeklyDate.toString());
        DateTime newTemp = DateTime(
          DateTime.now().year,
          temp.month,
          temp.day,
        );
        DateTime newTempWeeklyIncome = DateTime(
          DateTime.now().year,
          dateFormatedWeeklyDate.month,
          dateFormatedWeeklyDate.day,
        );
        print('>>>>>>>>>>>>${newTemp}>>>>>>>${newTempWeeklyIncome}');
        if (DateFormat('EEEE').format(newTemp) == DateFormat('EEEE').format(newTempWeeklyIncome)) {
          totalCount += GetIncomeController.to.weeklyIncomesList![j].amount!;
        }
      }
      totalWeeklyIncomeList.add(totalCount);
      print('>>>>>>.$totalCount');
      totalCount = 0;
      print(totalCount);
    }
    print('WeeklyIncomeList${totalWeeklyIncomeList}');
    print('WeeklyIncomeList${totalWeeklyIncomeList.length}');
    totalWeeklyIncomeList.refresh();
  }

  totalMonthlyExpenseLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.monthlyExpenseList!.length; j++) {
        if (formatter.format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![j].date.toString())) == datesList[i]) {
          totalCount += GetIncomeController.to.monthlyExpenseList![j].amount!;
        }
      }
      totalMonthlyExpenseList.add(totalCount);
      print('>>>>>>.$totalCount');
      totalCount = 0;
      print(totalCount);
    }
    print(totalMonthlyExpenseList);
  }

  totalWeeklyBudgetLogic() {
    for (int i = 0; i < datesList.length; i++) {
      for (int j = 0; j < GetIncomeController.to.weeklyBudgetList!.length; j++) {
        DateTime temp = DateFormat('MMM, dd').parse(datesList[i]);
        DateTime dateFormatedWeeklyBudgetDate = DateTime.parse(GetIncomeController.to.weeklyBudgetList![j].date!);
        DateTime tempWeeklyIncome = DateFormat('MM-dd').parse(dateFormatedWeeklyBudgetDate.toString());
        DateTime newTemp = DateTime(
          DateTime.now().year,
          temp.month,
          temp.day,
        );

        DateTime newTempWeeklyBudget = DateTime(
          DateTime.now().year,
          dateFormatedWeeklyBudgetDate.month,
          dateFormatedWeeklyBudgetDate.day,
        );
        print('>>>>>>>>>>>>${newTemp}>>>>>>>${newTempWeeklyBudget}');
        if (DateFormat('EEEE').format(newTemp) == DateFormat('EEEE').format(newTempWeeklyBudget)) {
          totalCount += GetIncomeController.to.weeklyBudgetList![j].amount!;
        }
      }
      totalWeeklyBudgetList.add(totalCount);
      print('>>>>>>.$totalCount');
      totalCount = 0;
      print(totalCount);
    }
    print('WeeklyIncomeList$totalWeeklyBudgetList');
    print('WeeklyIncomeList${totalWeeklyBudgetList.length}');
  }
}
