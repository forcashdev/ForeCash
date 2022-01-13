class MonthlyExpensesModel {
  final String? expenseName;
  final String? amount;
  // final Widget? dropDown;
  MonthlyExpensesModel({
    this.expenseName,
    this.amount,
  });

  static List<MonthlyExpensesModel> monthlyExpensesList = [
    MonthlyExpensesModel(
      expenseName: 'Apple ',
      amount: '8000',
    ),
  ];
}
