import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  static CheckBoxController get to => Get.find();
  final getIncomeController = Get.put(GetIncomeController());
  List<bool> monthlyIncomeCheckBoxValueList = List.generate(GetIncomeController.to.monthlyIncomeList!.length, (index) => true);
  List<bool> weeklyIncomeCheckBoxValueList = List.generate(GetIncomeController.to.weeklyIncomesList!.length, (index) => true);
  List<bool> monthlyExpenseCheckBoxValueList = List.generate(GetIncomeController.to.monthlyExpenseList!.length, (index) => true);
  List<bool> weeklyBudgetCheckBoxValueList = List.generate(GetIncomeController.to.weeklyBudgetList!.length, (index) => true);

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
