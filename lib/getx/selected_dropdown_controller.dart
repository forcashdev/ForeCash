import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/model/weekly_budget_model.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:get/get.dart';

class SelectedDropDownItem extends GetxController {
  String? selectedMonth = '1 mon';
  String? selectedMonth2;
  String? selectedDate = '1st';
  String? selectedDate2;
  String? selectedDay = 'Sun';
  String? selectedSingleDay;
  String? selectedSingleWeek;
  String? selectedWeek = '1W';
  String? weeklyBudgetDay;
  String? weeklyBudgetWeek;
  String? setupCalendarDay = 'Sunday';
  List<String> selectedItemValueList = List.generate(MonthlyIncomeModel.monthlyincomeList.length, (index) => '1 mon');
  List<Object> selectedMonthlyExpenseDate = List.generate(MonthlyExpensesModel.monthlyExpensesList.length, (index) => '1st');
  List<Object> selectedMonthlyExpenseMonth = List.generate(MonthlyExpensesModel.monthlyExpensesList.length, (index) => '1 mon');
  List<String> selectedDateItemValueList = List.generate(MonthlyIncomeModel.monthlyincomeList.length, (index) => '1st');
  List<Object> selectDayDropDown = List.generate(WeeklyIncomeModel.weeklyIncomeList.length, (index) => 'Sun');
  List<Object> selectWeekDropDown = List.generate(WeeklyIncomeModel.weeklyIncomeList.length, (index) => '1W');
  List<Object> weeklyBudgetDayDropDownList = List.generate(WeeklyBudgetModel.weeklyBudgetModel.length, (index) => 'Sun');
  List<Object> weeklyBudgetWeekDropDownList = List.generate(WeeklyBudgetModel.weeklyBudgetModel.length, (index) => '1W');

  String? get selectedDropItem => selectedMonth;

  void changeItem({Object? item, int? index}) {
    selectedMonth = item as String?;
    selectedItemValueList[index!] = item!;
    update();
    print(selectedMonth);
  }

  void changeDate({Object? item, int? index}) {
    selectedDate = item as String?;
    selectedDateItemValueList[index!] = item!;
    update();
    print(selectedDate);
  }

  void changeDay({Object? item, int? index}) {
    // selectedDay = item as String?;
    selectDayDropDown[index!] = item!;
    update();
    print(selectedDay);
  }

  void changeWeek({Object? item, int? index}) {
    // selectedWeek = item as String?;
    selectWeekDropDown[index!] = item!;
    update();
    print(selectedWeek);
  }

  void changeSingleDay({
    Object? item,
  }) {
    selectedSingleDay = item as String?;
    update();
    print(selectedSingleDay);
  }

  void changeSingleWeek({
    Object? item,
  }) {
    selectedSingleWeek = item as String?;
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
    selectedDate2 = item! as String?;
    update();
  }

  void changeSingleMonth({Object? item}) {
    selectedMonth2 = item! as String?;
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
