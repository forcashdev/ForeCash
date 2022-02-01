import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/model/weekly_budget_model.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  List<bool> monthlyIncomeCheckBoxValueList = List.generate(MonthlyIncomeModel.monthlyIncomeList.length, (index) => false);
  List<bool> weeklyIncomeCheckBoxValueList = List.generate(WeeklyIncomeModel.weeklyIncomeList.length, (index) => false);
  List<bool> monthlyExpenseCheckBoxValueList = List.generate(MonthlyExpensesModel.monthlyExpensesList.length, (index) => false);
  List<bool> weeklyBudgetCheckBoxValueList = List.generate(WeeklyBudgetModel.weeklyBudgetModel.length, (index) => false);
  // List<bool> get SelectedCheckBoxValueList => checkBoxValueList;
  void selectCheckBox({bool? value, int? index}) {
    monthlyIncomeCheckBoxValueList[index!] = value!;
    update();
  }

  void selectedWeeklyIncomeCheckBox({bool? value, int? index}) {
    monthlyExpenseCheckBoxValueList[index!] = value!;
    update();
  }

  void selectedMonthlyExpenseCheckBox({bool? value, int? index}) {
    monthlyExpenseCheckBoxValueList[index!] = value!;
    update();
  }

  void selectedWeeklyBudgetCheckBox({bool? value, int? index}) {
    weeklyBudgetCheckBoxValueList[index!] = value!;
    update();
  }
}
