import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  List<bool> get SelectedCheckBoxValueList => checkBoxValueList;
  List<bool> checkBoxValueList = List.generate(MonthlyIncomeModel.monthlyincomeList.length, (index) => false);
  void selectCheckBox({bool? value, int? index}) {
    checkBoxValueList[index!] = value!;
    update();
  }
}
