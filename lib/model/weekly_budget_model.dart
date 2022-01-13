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
  ];
}
