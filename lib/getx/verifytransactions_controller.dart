
import 'package:fore_cash/model/verify_transaction_model.dart';
import 'package:get/get.dart';


class VerifyTransactionsController extends GetxController {
  bool visibility = true;


  RxList<VerifyTransactionsModel> transactionsList = <VerifyTransactionsModel>[].obs;

  getTransactionsData() {
    transactionsList.clear();
    transactionsList.add(VerifyTransactionsModel(
      expenseName: "Rent",
      dueOn: "1st",
      amount: "\$2000",
      every: "1 Mon",
      action: "2"
    ));
    transactionsList.add(VerifyTransactionsModel(
        expenseName: "Car Payment",
        dueOn: "1st",
        amount: "\$2000",
        every: "1 Mon",
        action: "2"
    ));
    transactionsList.add(VerifyTransactionsModel(
        expenseName: "Insurance",
        dueOn: "1st",
        amount: "\$2000",
        every: "1 Mon",
        action: "2"
    ));
    transactionsList.add(VerifyTransactionsModel(
        expenseName: "AMEX CC",
        dueOn: "1st",
        amount: "\$2000",
        every: "1 Mon",
        action: "2"
    ));

    transactionsList.add(VerifyTransactionsModel(
        expenseName: "Rent",
        dueOn: "1st",
        amount: "\$2000",
        every: "1 Mon",
        action: "2"
    ));
    transactionsList.add(VerifyTransactionsModel(
        expenseName: "Car Payment",
        dueOn: "1st",
        amount: "\$2000",
        every: "1 Mon",
        action: "2"
    ));
    transactionsList.add(VerifyTransactionsModel(
        expenseName: "Insurance",
        dueOn: "1st",
        amount: "\$2000",
        every: "1 Mon",
        action: "2"
    ));
    transactionsList.add(VerifyTransactionsModel(
        expenseName: "AMEX CC",
        dueOn: "1st",
        amount: "\$2000",
        every: "1 Mon",
        action: "2"
    ));
  }



  @override
  void onInit() {
    transactionsList.clear();
    getTransactionsData();
    super.onInit();
  }


}