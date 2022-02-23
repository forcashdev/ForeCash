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

  Future<dynamic> callIncome({dynamic parameter}) async {
    var response;
    response = await Api().call(
        url: mGetIncome,
        params: parameter,
        success: (data) {
          print('>>>>>>>>>>>>>>>>$data');
          getIncomeModel.value = GetIncomeModel.fromJson(data);
          getIncomeModel.value.toJson();
          for (int i = 0; i < getIncomeModel.value.data!.length; i++) {
            if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].weekMonth == 2) {
              monthlyIncomeList?.add(getIncomeModel.value.data![i]);
              CheckBoxController.to.monthlyIncomeCheckBoxValueList.add(true);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 1 && getIncomeModel.value.data?[i].weekMonth == 1) {
              weeklyIncomesList?.add(getIncomeModel.value.data![i]);
              CheckBoxController.to.weeklyIncomeCheckBoxValueList.add(true);
            } else if (getIncomeModel.value.data?[i].incomeOutgoing == 2 && getIncomeModel.value.data?[i].weekMonth == 2) {
              monthlyExpenseList?.add(getIncomeModel.value.data![i]);
              CheckBoxController.to.monthlyExpenseCheckBoxValueList.add(true);
            } else {
              weeklyBudgetList?.add(getIncomeModel.value.data![i]);
              CheckBoxController.to.weeklyBudgetCheckBoxValueList.add(true);
            }
          }
          // if (monthlyIncomeList!.isEmpty) {
          //   getMonthlyIncomeList();
          // }
          // if (weeklyIncomesList!.isEmpty) {
          //   getWeeklyIncomeList();
          // }
          // if (monthlyExpenseList!.isEmpty) {
          //   getMonthlyExpenseList();
          // }
          // if (weeklyBudgetList!.isEmpty) {
          //   getWeeklyBudgetList();
          // }
        });
    // return response;
  }

  getMonthlyIncomeList() {
    final checkBoxController = Get.put(CheckBoxController());
    // if (monthlyIncomeList!.isEmpty) {
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
    // }
  }

  getWeeklyIncomeList() {
    final checkBoxController = Get.put(CheckBoxController());
    // if (weeklyIncomesList!.isEmpty) {
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
    // }
  }

  getMonthlyExpenseList() {
    final checkBoxController = Get.put(CheckBoxController());
    // if (monthlyExpenseList!.isEmpty) {
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
    // }
  }

  getWeeklyBudgetList() {
    final checkBoxController = Get.put(CheckBoxController());
    // if (weeklyBudgetList!.isEmpty) {
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
    // }
  }

  @override
  void onInit() {
    super.onInit();
    // monthlyIncomeList!.clear();
    // weeklyIncomesList!.clear();
    // weeklyBudgetList!.clear();
    // monthlyExpenseList!.clear();
  }

  @override
  void dispose() {
    super.dispose();
    monthlyIncomeList!.clear();
    weeklyIncomesList!.clear();
    weeklyBudgetList!.clear();
    monthlyExpenseList!.clear();
  }
}
