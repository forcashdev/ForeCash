import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/temp_income_expense_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

import 'checkbox_controller.dart';

class GetIncomeController extends GetxController {
  static GetIncomeController get to => Get.find();

  Rx<GetIncomeModel> getIncomeModel = GetIncomeModel().obs;
  Rx<TempIncomeExpenseModel> getTempIncomeModel = TempIncomeExpenseModel().obs;
  RxList<DataModel>? monthlyIncomeList = <DataModel>[].obs;
  RxList<DataModel>? weeklyIncomesList = <DataModel>[].obs;
  RxList<DataModel>? monthlyExpenseList = <DataModel>[].obs;
  RxList<DataModel>? weeklyBudgetList = <DataModel>[].obs;
  RxList<DataModel>? oneTimeIncomeList = <DataModel>[].obs;
  RxList<DataModel>? oneTimeExpenseList = <DataModel>[].obs;
  RxList<Data>? tempMonthlyIncomeList = <Data>[].obs;
  RxList<Data>? tempWeeklyIncomeList = <Data>[].obs;
  RxList<Data>? tempMonthlyExpenseList = <Data>[].obs;
  RxList<Data>? tempWeeklyBudgetList = <Data>[].obs;
  RxList<Data>? tempOneTimeIncomeList = <Data>[].obs;
  RxList<Data>? tempOneTimeExpenseList = <Data>[].obs;

  Future callIncome({dynamic parameter}) async {
    await Api().call(
        url: mGetIncome,
        params: parameter,
        success: (data) {
          print('>>>>>>>>>>>>>>>>$data');
          getIncomeModel.value = GetIncomeModel.fromJson(data);
          getTempIncomeModel.value = TempIncomeExpenseModel.fromJson(data);
          getIncomeModel.value.toJson();
          getTempIncomeModel.value.toJson();
          for (int i = 0; i < getIncomeModel.value.data!.length; i++) {
            if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].onetimeWeekMonth == 3) {
              monthlyIncomeList?.add(getIncomeModel.value.data![i]);
              tempMonthlyIncomeList?.add(getTempIncomeModel.value.data![i]);
              CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].onetimeWeekMonth == 2) {
              weeklyIncomesList?.add(getIncomeModel.value.data![i]);
              tempWeeklyIncomeList?.add(getTempIncomeModel.value.data![i]);
              CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 2 && getIncomeModel.value.data?[i].onetimeWeekMonth == 3) {
              monthlyExpenseList?.add(getIncomeModel.value.data![i]);
              tempMonthlyExpenseList?.add(getTempIncomeModel.value.data![i]);
              CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].onetimeWeekMonth == 1) {
              oneTimeIncomeList?.add(getIncomeModel.value.data![i]);
              tempOneTimeIncomeList?.add(getTempIncomeModel.value.data![i]);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 2 && getIncomeModel.value.data?[i].onetimeWeekMonth == 1) {
              oneTimeExpenseList?.add(getIncomeModel.value.data![i]);
              tempOneTimeExpenseList?.add(getTempIncomeModel.value.data![i]);
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
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
    monthlyIncomeList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
  }

  getWeeklyIncomeList() {
    final checkBoxController = Get.put(CheckBoxController());
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
    weeklyIncomesList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 1, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
  }

  getMonthlyExpenseList() {
    final checkBoxController = Get.put(CheckBoxController());
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
    monthlyExpenseList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 3, every: 1, amount: 0),
    );
    CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
  }

  getWeeklyBudgetList() {
    final checkBoxController = Get.put(CheckBoxController());
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
    weeklyBudgetList?.add(
      DataModel(paidOn: 1, date: DateTime.now().toString(), incomeOutgoing: 2, onetimeWeekMonth: 2, every: 1, amount: 0),
    );
    CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
  }

  @override
  void onInit() {
    super.onInit();
    monthlyIncomeList!.clear();
    monthlyIncomeList!.refresh();
    weeklyIncomesList!.clear();
    weeklyIncomesList!.refresh();
    weeklyBudgetList!.clear();
    weeklyBudgetList!.refresh();
    monthlyExpenseList!.clear();
    monthlyExpenseList!.refresh();
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
