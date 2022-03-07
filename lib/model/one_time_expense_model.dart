class OneTimeExpenseModel {
  String? incomeName;
  DateTime? dateTime;
  String? amount;

  OneTimeExpenseModel({this.incomeName, this.dateTime, this.amount});

  static List<OneTimeExpenseModel> oneTimeExpenseList = [
    OneTimeExpenseModel(incomeName: 'CommercialRenewal', dateTime: DateTime.now(), amount: '5000'),
    OneTimeExpenseModel(incomeName: 'CommercialRenewal', dateTime: DateTime.now(), amount: '7000'),
    OneTimeExpenseModel(incomeName: 'CommercialRenewal', dateTime: DateTime.now(), amount: '6000'),
  ];
}
