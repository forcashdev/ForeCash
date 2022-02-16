import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class DeleteIncomeExpenseController extends GetxController {
  static DeleteIncomeExpenseController get to => Get.find();

  callDelete({String? id}) {
    Api().call(
        url: mDeleteIncomeExpense,
        params: {"id": id},
        success: (data) {
          print("loginModel.value.success");
          GetIncomeController.to.callIncome(income_outgoing: 1);
          // CreateIncomeController.to.monthlyIncomeList?.refresh();
        });
    // }
  }
}
