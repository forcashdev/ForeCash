import 'package:get/get.dart';

class WeeklyIncomeController extends GetxController {
  static WeeklyIncomeController get to => Get.find();

  RxList<WeeklyIncomeModel> weeklyIncomesList = <WeeklyIncomeModel>[].obs;

  getWeeklyIncome() {
    weeklyIncomesList.add(
      WeeklyIncomeModel(incomeName: '', amount: '', paidOn: 'Sun', every: '1W'),
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
