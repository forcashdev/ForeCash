import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:get/get.dart';

class SelectedDropDownItem extends GetxController {
  String? selectedMonth = '1 mon';
  String? selectedDate = '1st';
  String? selectedDay = 'Sun';
  String? selectedSingleDay = 'Sun';
  String? selectedSingleWeek = '1W';
  String? selectedWeek = '1W';
  List<String> selectedItemValueList = List.generate(MonthlyIncomeModel.monthlyincomeList.length, (index) => '1 mon');
  List<String> selectedDateItemValueList = List.generate(MonthlyIncomeModel.monthlyincomeList.length, (index) => '1st');
  List<Object> selectDayDropDown = List.generate(WeeklyIncomeModel.weeklyIncomeList.length, (index) => 'Sun');
  List<Object> selectWeekDropDown = List.generate(WeeklyIncomeModel.weeklyIncomeList.length, (index) => '1W');

  String? get selectedDropItem => selectedMonth;
  // List? get selectedDropItemList => selectedItemValueList;
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
    selectedDay = item as String?;
    selectDayDropDown[index!] = item!;
    update();
    print(selectedDay);
  }

  void changeWeek({Object? item, int? index}) {
    selectedWeek = item as String?;
    selectWeekDropDown[index!] = item!;
    update();
    print(selectedWeek);
  }

  void changeSingleDay({
    Object? item,
  }) {
    selectedSingleDay = item as String?;
    update();
    print(selectedMonth);
  }

  void changeSingleWeek({
    Object? item,
  }) {
    selectedSingleWeek = item as String?;
    update();
    print(selectedMonth);
  }
}
