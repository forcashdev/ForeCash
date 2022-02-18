import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/model/weekly_budget_model.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:get/get.dart';

class SelectedDropDownItem extends GetxController {
  String? selectedMonth;
  String? selectedSingleMonthlyExpenseMonth;
  String? selectedDate;
  String? selectedSingleMonthlyExpenseDate;
  String? selectedDay = 'Sun';
  // String? weeklyBudgetSingleDay;
  String? selectedSingleWeeklyIncomeDay;
  String? selectedSingleWeeklyIncomeWeek;
  String? selectedWeek = '1W';
  String? weeklyBudgetDay;
  String? weeklyBudgetWeek;
  String? setupCalendarDay = 'Sunday';
  List<Object> selectedMonthlyIncomeMonthList = List.generate(MonthlyIncomeModelOld.monthlyIncomeList.length, (index) => '1 mon');
  List<Object> selectedMonthlyExpenseDate = List.generate(MonthlyExpensesModel.monthlyExpensesListOld.length, (index) => '1st');
  List<Object> selectedMonthlyExpenseMonth = List.generate(MonthlyExpensesModel.monthlyExpensesListOld.length, (index) => '1 mon');
  List<Object> selectedMonthlyIncomeDateList = List.generate(MonthlyIncomeModelOld.monthlyIncomeList.length, (index) => '1st');
  // List<Object> selectedMonthlyIncomeDateListDouble = List.generate(5, (index) => CreateIncomeController.to.incomeModel.value.data?[index].amount as Object);
  List<Object> selectDayDropDown = List.generate(WeeklyIncomeModel.weeklyIncomeList.length, (index) => 'Sun');
  List<Object> selectWeekDropDown = List.generate(WeeklyIncomeModel.weeklyIncomeList.length, (index) => '1W');
  List<Object> weeklyBudgetDayDropDownList = List.generate(WeeklyBudgetModel.weeklyBudgetModel.length, (index) => 'Sun');
  List<Object> weeklyBudgetWeekDropDownList = List.generate(WeeklyBudgetModel.weeklyBudgetModel.length, (index) => '1W');

  void changeItem({Object? item, int? index}) {
    // selectedMonth = item as String?;
    selectedMonthlyIncomeMonthList[index!] = item!;
    update();
    print(selectedMonth);
  }

  void changeDate({Object? item, int? index}) {
    // selectedDate = item as String?;
    selectedMonthlyIncomeDateList[index!] = item!;
    update();
    print(selectedMonthlyIncomeDateList);
  }

  void changeDay({Object? item, int? index}) {
    // selectedDay = item as String?;
    selectDayDropDown[index!] = item!;
    update();
    print(selectDayDropDown);
  }

  void changeWeek({Object? item, int? index}) {
    // selectedWeek = item as String?;
    selectWeekDropDown[index!] = item!;
    update();
    print(selectedWeek);
  }

  void changeSingleDay({Object? item}) {
    selectedSingleWeeklyIncomeDay = item as String?;
    update();
    print(selectedSingleWeeklyIncomeDay);
  }

  void changeSingleWeek({
    Object? item,
  }) {
    selectedSingleWeeklyIncomeWeek = item as String?;
    update();
    print(selectedMonth);
  }

  void changeMonthlyExpenseMonth({Object? item, int? index}) {
    // selectedMonth = item as String?;
    selectedMonthlyExpenseMonth[index!] = item!;
    update();
  }

  void changeMonthlyExpenseDate({Object? item, int? index}) {
    // selectedDate = item as String?;
    selectedMonthlyExpenseDate[index!] = item!;
    update();
    print(selectedDate);
  }

  void changeSingleDate({Object? item}) {
    selectedSingleMonthlyExpenseDate = item! as String?;
    update();
  }

  void changeSingleMonth({Object? item}) {
    selectedSingleMonthlyExpenseMonth = item! as String?;
    update();
  }

  void changeMonthlyIncomeMonth({Object? item}) {
    selectedMonth = item! as String?;
    update();
  }

  void changeMonthlyIncomeDate({Object? item}) {
    selectedDate = item! as String?;
    update();
  }

  void changeWeeklyBudgetDayList({Object? item, int? index}) {
    weeklyBudgetDayDropDownList[index!] = item!;
    update();
  }

  void changeWeeklyBudgetWeekList({Object? item, int? index}) {
    weeklyBudgetWeekDropDownList[index!] = item!;
    update();
  }

  void changeWeeklyBudgetSingleDay({Object? item}) {
    weeklyBudgetDay = item! as String?;
    update();
  }

  void changeWeeklyBudgetSingleWeek({Object? item}) {
    weeklyBudgetWeek = item! as String?;
    update();
  }

  void changeSetupCalendarDay({Object? item}) {
    setupCalendarDay = item! as String?;
    update();
  }
}
