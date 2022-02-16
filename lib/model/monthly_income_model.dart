import 'package:get/get.dart';

class MonthlyIncomeModelListController extends GetxController {
  static MonthlyIncomeModelListController get to => Get.find();
}

class MonthlyIncomeModelOld {
  String? expenseName;
  String? amount;
  String? paidOn;
  MonthlyIncomeModelOld({this.expenseName, this.amount, this.paidOn});
  static List<MonthlyIncomeModelOld> monthlyIncomeList = [
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '100',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '200',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '300',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '400',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '500',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '600',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '700',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '800',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '900',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '1000',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '1100',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '1200',
    ),
    MonthlyIncomeModelOld(
      expenseName: 'Apple inc.',
      amount: '8000',
    ),
  ];
}
