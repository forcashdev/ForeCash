class OneTimeIncomeModel {
  final String? incomeName;
  final DateTime? dateTime;
  final String? amount;

  OneTimeIncomeModel({this.incomeName, this.dateTime, this.amount});

  static List<OneTimeIncomeModel> oneTimeIncomeList = [
    OneTimeIncomeModel(incomeName: 'DownPayment', dateTime: DateTime.now(), amount: '5000'),
    OneTimeIncomeModel(incomeName: 'DownPayment', dateTime: DateTime.now(), amount: '7000'),
    OneTimeIncomeModel(incomeName: 'DownPayment', dateTime: DateTime.now(), amount: '6000'),
  ];
}
