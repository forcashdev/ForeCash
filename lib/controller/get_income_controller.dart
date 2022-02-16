import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class GetIncomeController extends GetxController {
  static GetIncomeController get to => Get.find();

  Rx<GetIncomeModel> getIncomeModel = GetIncomeModel().obs;
  RxList<DataModel>? monthlyIncomeList = <DataModel>[].obs;
  RxList<DataModel>? weeklyIncomesList = <DataModel>[].obs;
  RxList<DataModel>? monthlyExpenseList = <DataModel>[].obs;
  RxList<DataModel>? weeklyBudgetList = <DataModel>[].obs;

  callIncome({int? income_outgoing}) {
    Api().call(
        url: mGetIncome,
        params: {"income_outgoing": income_outgoing ?? 1},
        success: (data) {
          final checkBoxController = Get.put(CheckBoxController());
          getIncomeModel.value = GetIncomeModel.fromJson(data);
          getIncomeModel.value.toJson();
          for (int i = 0; i < getIncomeModel.value.data!.length; i++) {
            if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].weekMonth == 2) {
              monthlyIncomeList?.add(getIncomeModel.value.data![i]);
              checkBoxController.monthlyIncomeCheckBoxValueList.add(false);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].weekMonth == 1) {
              weeklyIncomesList?.add(getIncomeModel.value.data![i]);
              checkBoxController.weeklyIncomeCheckBoxValueList.add(false);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 2 && getIncomeModel.value.data?[i].weekMonth == 2) {
              monthlyExpenseList?.add(getIncomeModel.value.data![i]);
              checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
            } else {
              weeklyBudgetList?.add(getIncomeModel.value.data![i]);
              checkBoxController.weeklyBudgetCheckBoxValueList.add(false);
            }
          }
        });
    // }
  }

  getMonthlyIncomeList() {
    // monthlyIncomeList?.add(
    //   DataModel(paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 2, every: 1, amount: 0),
    // );
  }

  getWeeklyIncomeList() {
    // weeklyIncomesList?.add(
    //   DataModel(name: '', amount: 0, paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1),
    // );
  }

  getMonthlyExpenseList() {
    // monthlyExpenseList?.add(
    //   DataModel(amount: 0, paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 2, every: 1),
    // );
  }

  getWeeklyBudgetList() {
    // weeklyBudgetList?.add(
    //   DataModel(name: '', amount: 0, paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1),
    // );
  }

  @override
  void onInit() {
    super.onInit();
    getMonthlyIncomeList();

    getWeeklyIncomeList();
    getMonthlyExpenseList();
    getWeeklyBudgetList();
  }
}
