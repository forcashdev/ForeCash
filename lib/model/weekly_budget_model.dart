import 'package:get/get.dart';

import 'income_request_model.dart';

class WeeklyBudgetListController extends GetxController {
  static WeeklyBudgetListController get to => Get.find();

  RxList<Income>? weeklyBudgetList = <Income>[].obs;

  getWeeklyIncome() {
    weeklyBudgetList?.add(
      Income(name: '', amount: 0, paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 1, every: 1),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWeeklyIncome();
  }
}

class WeeklyBudgetModel {
  final String? expenseName;
  final String? amount;
  WeeklyBudgetModel({
    this.expenseName,
    this.amount,
  });

  static List<WeeklyBudgetModel> weeklyBudgetModel = [
    WeeklyBudgetModel(
      expenseName: 'Apple ',
      amount: '8000',
    ),
    WeeklyBudgetModel(
      expenseName: 'Gas ',
      amount: '8000',
    ),
  ];
}
