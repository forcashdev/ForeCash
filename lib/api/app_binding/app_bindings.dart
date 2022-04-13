import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/delete_income_expense_controller.dart';
import 'package:fore_cash/controller/forgot_password_email_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/login_controller.dart';
import 'package:fore_cash/controller/register_controller.dart';
import 'package:fore_cash/controller/reset_password_controller.dart';
import 'package:fore_cash/controller/set_up_calendar_controller.dart';
import 'package:fore_cash/controller/total_income_expense_controller.dart';
import 'package:fore_cash/controller/verify_otp_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<LoginInController>(LoginInController(), permanent: true);
    Get.put<RegisterController>(RegisterController(), permanent: true);
    Get.put<CreateIncomeController>(CreateIncomeController(), permanent: true);
    Get.put<GetIncomeController>(GetIncomeController(), permanent: true);
    Get.put<DeleteIncomeExpenseController>(DeleteIncomeExpenseController(), permanent: true);
    Get.put<SetUpCalendarController>(SetUpCalendarController(), permanent: true);
    Get.put<TotalIncomeExpenseController>(TotalIncomeExpenseController(), permanent: true);
    Get.put<ForgotPasswordController>(ForgotPasswordController(), permanent: true);
    Get.put<VerifyOtpController>(VerifyOtpController(), permanent: true);
    Get.put<ResetPasswordController>(ResetPasswordController(), permanent: true);
  }
}
