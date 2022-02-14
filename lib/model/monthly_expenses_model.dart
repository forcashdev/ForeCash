import 'package:get/get.dart';

import 'income_request_model.dart';

class MonthlyExpenseListController extends GetxController {
  static MonthlyExpenseListController get to => Get.find();

  RxList<Income>? monthlyExpenseList = <Income>[].obs;

  getMonthlyExpense() {
    monthlyExpenseList?.add(
      Income(amount: 0, paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 2, weekMonth: 2, every: 1),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMonthlyExpense();
  }
}

class MonthlyExpensesModel {
  final String? expenseName;
  final String? amount;
  // final Widget? dropDown;
  MonthlyExpensesModel({
    this.expenseName,
    this.amount,
  });

  static List<MonthlyExpensesModel> monthlyExpensesListOld = [
    MonthlyExpensesModel(
      expenseName: 'Apple ',
      amount: '8000',
    ),
  ];
}
