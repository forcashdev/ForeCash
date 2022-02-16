import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/income_request_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class GetIncomeController extends GetxController {
  static GetIncomeController get to => Get.find();

  Rx<GetIncomeModel> getIncomeModel = GetIncomeModel().obs;
  RxList<DataModel>? monthlyIncomeList = <DataModel>[].obs;
  RxList<DataModel>? weeklyIncomesList = <DataModel>[].obs;
  RxList<Income>? monthlyExpenseList = <Income>[].obs;
  RxList<Income>? weeklyBudgetList = <Income>[].obs;

  callIncome({int? income_outgoing}) {
    Api().call(
        url: mGetIncome,
        params: {"income_outgoing": income_outgoing ?? 1},
        success: (data) {
          getIncomeModel.value = GetIncomeModel.fromJson(data);
          getIncomeModel.value.toJson();
          for (int i = 0; i < getIncomeModel.value.data!.length; i++) {
            if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].weekMonth == 2) {
              print('ppppppppp${getIncomeModel.value.data?[i].name}');
              monthlyIncomeList?.add(getIncomeModel.value.data![i]);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].weekMonth == 1) {
              weeklyIncomesList?.add(getIncomeModel.value.data![i]);
            }
          }
        });
    // }
  }

  getMonthlyIncomeList() {
    monthlyIncomeList?.add(
      DataModel(paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 2, every: 1, amount: 0),
    );
  }

  getWeeklyIncomeList() {
    weeklyIncomesList?.add(
      DataModel(name: '', amount: 0, paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1),
    );
  }

  getMonthlyExpenseList() {
    monthlyExpenseList?.add(
      Income(amount: 0, paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 2, every: 1),
    );
  }

  getWeeklyBudgetList() {
    weeklyBudgetList?.add(
      Income(name: '', amount: 0, paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1),
    );
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
