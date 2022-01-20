import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/model/weekly_budget_model.dart';
import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  List<bool> checkBoxValueList = List.generate(MonthlyIncomeModel.monthlyIncomeList.length, (index) => false);
  List<bool> monthlyExpenseCheckBoxValueList = List.generate(MonthlyExpensesModel.monthlyExpensesList.length, (index) => false);
  List<bool> weeklyBudgetCheckBoxValueList = List.generate(WeeklyBudgetModel.weeklyBudgetModel.length, (index) => false);
  List<bool> get SelectedCheckBoxValueList => checkBoxValueList;
  void selectCheckBox({bool? value, int? index}) {
    checkBoxValueList[index!] = value!;
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
