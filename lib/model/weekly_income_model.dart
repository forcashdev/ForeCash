import 'package:get/get.dart';

import 'income_request_model.dart';

class WeeklyIncomeListController extends GetxController {
  static WeeklyIncomeListController get to => Get.find();

  RxList<Income>? weeklyIncomesList = <Income>[].obs;

  getWeeklyIncome() {
    weeklyIncomesList?.add(
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

class WeeklyIncomeModel {
  String? incomeName;
  String? amount;
  String? paidOn;
  String? every;
  // DateTime? dateTime;
  // final Widget? dropDown;
  WeeklyIncomeModel({this.incomeName, this.amount, this.every, this.paidOn});

  static List<WeeklyIncomeModel> weeklyIncomeList = [
    WeeklyIncomeModel(
      incomeName: 'Apple inc.',
      amount: '500',
    ),
  ];
}
