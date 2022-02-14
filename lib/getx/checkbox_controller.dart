import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/model/weekly_budget_model.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  final monthlyExpenseListController = Get.put(MonthlyExpenseListController());
  final weeklyExpenseListController = Get.put(WeeklyIncomeListController());
  final weeklyBudgetListController = Get.put(WeeklyBudgetListController());

  List<bool> monthlyIncomeCheckBoxValueList = List.generate(CreateIncomeController.to.monthlyIncomeList!.length, (index) => false);
  List<bool> weeklyIncomeCheckBoxValueList = List.generate(WeeklyIncomeListController.to.weeklyIncomesList!.length, (index) => false);
  List<bool> monthlyExpenseCheckBoxValueList = List.generate(MonthlyExpenseListController.to.monthlyExpenseList!.length, (index) => false);
  List<bool> weeklyBudgetCheckBoxValueList = List.generate(WeeklyBudgetListController.to.weeklyBudgetList!.length, (index) => false);
  // List<bool> get SelectedCheckBoxValueList => checkBoxValueList;
  void selectCheckBox({bool? value, int? index}) {
    monthlyIncomeCheckBoxValueList[index!] = value!;
    update();
  }

  void selectedWeeklyIncomeCheckBox({bool? value, int? index}) {
    weeklyIncomeCheckBoxValueList[index!] = value!;
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
