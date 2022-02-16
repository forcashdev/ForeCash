import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/delete_income_expense_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/login_controller.dart';
import 'package:fore_cash/controller/register_controller.dart';
import 'package:get/get.dart';
// import 'package:swipecart/controller/auth_controller/forgot_password_controller.dart';
// import 'package:swipecart/controller/auth_controller/login_controller.dart';
// import 'package:swipecart/controller/auth_controller/sign_up_controller.dart';
// import 'package:swipecart/controller/bottom_tab_controller/bottom_tab_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<LoginInController>(LoginInController(), permanent: true);
    Get.put<RegisterController>(RegisterController(), permanent: true);
    Get.put<CreateIncomeController>(CreateIncomeController(), permanent: true);
    Get.put<GetIncomeController>(GetIncomeController(), permanent: true);
    Get.put<DeleteIncomeExpenseController>(DeleteIncomeExpenseController(), permanent: true);
  }
}
