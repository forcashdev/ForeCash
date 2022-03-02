import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/temp_monthy_income_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class GetIncomeController extends GetxController {
  static GetIncomeController get to => Get.find();

  Rx<GetIncomeModel> getIncomeModel = GetIncomeModel().obs;
  Rx<TempMonthyIncomeModel> getTempIncomeModel = TempMonthyIncomeModel().obs;
  RxList<DataModel>? monthlyIncomeList = <DataModel>[].obs;
  RxList<DataModel>? weeklyIncomesList = <DataModel>[].obs;
  RxList<DataModel>? monthlyExpenseList = <DataModel>[].obs;
  RxList<DataModel>? weeklyBudgetList = <DataModel>[].obs;
  RxList? tempMonthlyIncomeList = [].obs;
  RxList? tempWeeklyIncomeList = [].obs;
  RxList? tempMonthlyExpenseList = [].obs;
  RxList? tempWeeklyBudgetList = [].obs;

  Future callIncome({dynamic parameter}) async {
    await Api().call(
        url: mGetIncome,
        params: parameter,
        success: (data) {
          print('>>>>>>>>>>>>>>>>$data');
          getIncomeModel.value = GetIncomeModel.fromJson(data);
          getTempIncomeModel.value = TempMonthyIncomeModel.fromJson(data);
          getIncomeModel.value.toJson();
          getTempIncomeModel.value.toJson();
          for (int i = 0; i < getIncomeModel.value.data!.length; i++) {
            if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].weekMonth == 2) {
              monthlyIncomeList?.add(getIncomeModel.value.data![i]);
              tempMonthlyIncomeList?.add(getTempIncomeModel.value.data![i]);
              CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].weekMonth == 1) {
              weeklyIncomesList?.add(getIncomeModel.value.data![i]);
              tempWeeklyIncomeList?.add(getTempIncomeModel.value.data![i]);
              CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 2 && getIncomeModel.value.data?[i].weekMonth == 2) {
              monthlyExpenseList?.add(getIncomeModel.value.data![i]);
              tempMonthlyExpenseList?.add(getTempIncomeModel.value.data![i]);
              CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
            } else {
              weeklyBudgetList?.add(getIncomeModel.value.data![i]);
              tempWeeklyBudgetList?.add(getTempIncomeModel.value.data![i]);
              CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
            }
          }
        });
  }

  getMonthlyIncomeList() {
    final checkBoxController = Get.put(CheckBoxController());
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
  }

  getWeeklyIncomeList() {
    final checkBoxController = Get.put(CheckBoxController());
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
  }

  getMonthlyExpenseList() {
    final checkBoxController = Get.put(CheckBoxController());
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
  }

  getWeeklyBudgetList() {
    final checkBoxController = Get.put(CheckBoxController());
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 1, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
  }

  @override
  void onInit() {
    super.onInit();
    monthlyIncomeList!.clear();
    // weeklyIncomesList!.clear();
    weeklyBudgetList!.clear();
    monthlyExpenseList!.clear();
  }

  @override
  void dispose() {
    super.dispose();
    monthlyIncomeList!.clear();
    monthlyIncomeList!.refresh();
    weeklyIncomesList!.clear();
    weeklyIncomesList!.refresh();
    weeklyBudgetList!.clear();
    weeklyBudgetList!.refresh();
    monthlyExpenseList!.clear();
    monthlyExpenseList!.refresh();
  }
}
