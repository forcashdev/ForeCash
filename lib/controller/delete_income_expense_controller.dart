import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class DeleteIncomeExpenseController extends GetxController {
  static DeleteIncomeExpenseController get to => Get.find();
  List<String> deleteMonthlyIncomeList = [];
  List<String> deleteWeeklyIncomeList = [];
  List<String> deleteMonthlyExpenseList = [];
  List<String> deleteWeeklyExpenseList = [];
  Future callDelete({List<String>? idList}) async {
    await Api().call(
        url: mDeleteIncomeExpense,
        params: {"delete_income": idList},
        success: (data) {
          print("loginModel.value.success");
          print(data);
          // GetIncomeController.to.callIncome(income_outgoing: 1);
          // CreateIncomeController.to.monthlyIncomeList?.refresh();
        });
    // }
  }
}
