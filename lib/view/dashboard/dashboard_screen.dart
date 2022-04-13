import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/common_widget/page_view_common_widget.dart';
import 'package:fore_cash/controller/add_monthly_expense_showtext_controller.dart';
import 'package:fore_cash/controller/add_monthly_income_controller.dart';
import 'package:fore_cash/controller/add_onetime_expense_showtext_controller.dart';
import 'package:fore_cash/controller/add_onetime_income_showtext_controller.dart';
import 'package:fore_cash/controller/add_weekly_budget_showtext_controller.dart';
import 'package:fore_cash/controller/add_weekly_income_showtext_controller.dart';
import 'package:fore_cash/controller/checkbox_controller.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/dashboard_container_visibility.dart';
import 'package:fore_cash/controller/delete_income_expense_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/controller/monthly_expansion_visibility_controller.dart';
import 'package:fore_cash/controller/monthly_expense_edit_mode_controller.dart';
import 'package:fore_cash/controller/monthly_expense_expansiondata_visibility_controller.dart';
import 'package:fore_cash/controller/monthlyincome_edit_mode_controller.dart';
import 'package:fore_cash/controller/on_monthly_expense_expansion_change_controller.dart';
import 'package:fore_cash/controller/on_monthly_income_expansion_change_controller.dart';
import 'package:fore_cash/controller/on_one_time_expense_expansion_change_controller.dart';
import 'package:fore_cash/controller/on_one_time_income_expansion_change_controller.dart';
import 'package:fore_cash/controller/on_weekly_budget_expansion_change_controller.dart';
import 'package:fore_cash/controller/on_weekly_income_expansion_change_controller.dart';
import 'package:fore_cash/controller/one_time_expense_visibility_controller.dart';
import 'package:fore_cash/controller/one_time_income_visibility_controller.dart';
import 'package:fore_cash/controller/onetime_expense_edit_mode_controller.dart';
import 'package:fore_cash/controller/onetime_expense_expansion_visibility_controller.dart';
import 'package:fore_cash/controller/onetime_income_edit_mode_controller.dart';
import 'package:fore_cash/controller/onetime_income_expansion_visibility_controller.dart';
import 'package:fore_cash/controller/pageview_pageindex_controller.dart';
import 'package:fore_cash/controller/selected_dropdown_controller.dart';
import 'package:fore_cash/controller/switch_controller.dart';
import 'package:fore_cash/controller/total_income_expense_controller.dart';
import 'package:fore_cash/controller/weekly_budget_edit_mode_controller.dart';
import 'package:fore_cash/controller/weekly_budget_expansion_visibility_controller.dart';
import 'package:fore_cash/controller/weekly_income_edit_mode_controller.dart';
import 'package:fore_cash/controller/weekly_income_expansion_visibility_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/setup_calendar_screen.dart';
import 'package:fore_cash/view/dashboard/widgets/monthly_expense_method.dart';
import 'package:fore_cash/view/dashboard/widgets/monthly_income_method.dart';
import 'package:fore_cash/view/dashboard/widgets/one_time_expense_method.dart';
import 'package:fore_cash/view/dashboard/widgets/one_time_income_method.dart';
import 'package:fore_cash/view/dashboard/widgets/weekly_budget_method.dart';
import 'package:fore_cash/view/dashboard/widgets/weekly_income_method.dart';
import 'package:fore_cash/view/notifications/notifications_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _currentDate = DateTime.now();
  final DateFormat formatter = DateFormat('MMM, dd');
  int totalAmount = 0;
  Rx<DateTime> currentDate = DateTime.now().obs;
  final checkBoxController = Get.put(CheckBoxController());
  final dropDownController = Get.put(SelectedDropDownItem());
  final monthlyIncomeEditMode = Get.put(MonthlyIncomeEditModeController());
  final oneTimeIncomeEditMode = Get.put(OneTimeIncomeEditModeController());
  final oneTimeExpenseEditMode = Get.put(OneTimeExpenseEditModeController());
  final weeklyIncomeEditMode = Get.put(WeeklyIncomeEditModeController());
  final editModeController = Get.put(MonthlyIncomeEditModeController());
  final monthlyExpenseEditModeController = Get.put(MonthlyExpenseEditModeController());
  final weeklyBudgetEditModeController = Get.put(WeeklyBudgetEditModeController());
  final weeklyIncomeDataVisibilityController = Get.put(WeeklyIncomeDataVisibilityController());
  final monthlyExpenseDataVisibilityController = Get.put(MonthlyExpenseDataVisibilityController());
  final showWeeklyIncomeSaveTextController = Get.put(ShowWeeklyIncomeSaveDataTextController());
  final showMonthlyExpenseSaveTextController = Get.put(ShowMonthlyExpenseSaveDataTextController());
  final showWeeklyBudgetSaveTextController = Get.put(ShowWeeklyBudgetSaveDataTextController());
  final showOneTimeIncomeSaveTextController = Get.put(ShowOneTimeIncomeSaveDataTextController());
  final showOneTimeExpenseSaveTextController = Get.put(ShowOneTimeExpenseSaveDataTextController());
  final switchController = Get.put(SwitchController());
  final showSaveTextController = Get.put(SaveDataTextController());
  final pageIndexController = Get.put(PageViewPageIndex());
  final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
  final oneTimeIncomeExpansionVisibilityController = Get.put(OneTimeIncomeExpansionVisibilityController());
  final oneTimeExpenseExpansionVisibilityController = Get.put(OneTimeExpenseExpansionVisibilityController());
  final weeklyBudgetVisibilityController = Get.put(WeeklyBudgetVisibilityController());
  final oneTimeIncomeVisibilityController = Get.put(OneTimeIncomeVisibilityController());
  final oneTimeExpenseVisibilityController = Get.put(OneTimeExpenseVisibilityController());
  final monthlyIncomeExpansionValue = Get.put(MonthlyIncomeExpansionChange());
  final weeklyIncomeExpansionValue = Get.put(WeeklyIncomeExpansionChange());
  final monthlyExpenseExpansionValue = Get.put(MonthlyExpenseExpansionChange());
  final weeklyBudgetExpansionValue = Get.put(WeeklyBudgetExpansionChange());
  final oneTimeIncomeExpansionValue = Get.put(OneTimeIncomeExpansionChange());
  final oneTimeExpenseExpansionValue = Get.put(OneTimeExpenseExpansionChange());
  ScrollController scrollController = ScrollController();
  ScrollController scrollControllerMonthlyIncome = ScrollController();
  ScrollController scrollControllerWeeklyIncome = ScrollController();
  ScrollController scrollControllerMonthlyExpense = ScrollController();
  ScrollController scrollControllerWeeklyBudget = ScrollController();
  ScrollController scrollControllerTotalListMonthlyIncome = ScrollController();
  ScrollController scrollControllerTotalListWeeklyIncome = ScrollController();
  ScrollController scrollControllerTotalListMonthlyExpense = ScrollController();
  ScrollController scrollControllerTotalListWeeklyBudget = ScrollController();
  ScrollController scrollControllerTotalListOneTimeIncome = ScrollController();
  ScrollController scrollControllerTotalListOneTimeExpense = ScrollController();
  ScrollController scrollControllerPreviousWeekBalance = ScrollController();
  ScrollController scrollControllerTotalWeeklyIncome = ScrollController();
  ScrollController scrollControllerTotalWeeklyExpense = ScrollController();
  ScrollController scrollControllerOneTimeIncome = ScrollController();
  ScrollController scrollControllerOneTimeExpense = ScrollController();
  ScrollController scrollControllerEndOfTheWeekBalance = ScrollController();
  RxBool monthlyIncomeExpansion = false.obs;
  RxBool weeklyIncomeExpansion = false.obs;
  RxBool monthlyExpenseExpansion = false.obs;
  RxBool weeklyBudgetExpansion = false.obs;
  RxBool oneTimeIncomeExpansion = false.obs;
  RxBool oneTimeExpenseExpansion = false.obs;
  int totalCount = 0;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      calculateFutureDates();
      calculatePastDates();
      GetIncomeController.to.monthlyIncomeList?.clear();
      GetIncomeController.to.weeklyIncomesList?.clear();
      GetIncomeController.to.monthlyExpenseList?.clear();
      GetIncomeController.to.weeklyBudgetList?.clear();
      GetIncomeController.to.tempMonthlyIncomeList?.clear();
      GetIncomeController.to.tempWeeklyIncomeList?.clear();
      GetIncomeController.to.tempMonthlyExpenseList?.clear();
      GetIncomeController.to.tempWeeklyBudgetList?.clear();
      GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "3"}).whenComplete(() => TotalIncomeExpenseController.to.totalMonthlyIncomeLogic());
      GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "2"}).whenComplete(() => TotalIncomeExpenseController.to.totalWeeklyIncomeLogic());
      GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "3"}).whenComplete(() => TotalIncomeExpenseController.to.totalMonthlyExpenseLogic());
      GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "2"}).whenComplete(() => TotalIncomeExpenseController.to.totalWeeklyBudgetLogic());
      GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "1"}).whenComplete(() => TotalIncomeExpenseController.to.totalOneTimeIncomeLogic());
      GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "1"}).whenComplete(() => TotalIncomeExpenseController.to.totalOneTimeExpenseLogic());

      scrollController.addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          TotalIncomeExpenseController.to.calculateMoreFutureDates(scrollController: scrollController);
        }
        if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
          TotalIncomeExpenseController.to.calculateMoreFutureDates(scrollController: scrollController);
        }
        scrollControllerMonthlyIncome.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyIncome.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyExpense.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyBudget.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyIncome.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyIncome.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyExpense.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyBudget.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeIncome.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeIncome.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeIncome.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeExpense.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerPreviousWeekBalance.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyIncome.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyExpense.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerEndOfTheWeekBalance.animateTo(scrollController.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      });

      scrollControllerMonthlyIncome.addListener(() {
        if (scrollController.offset < scrollControllerMonthlyIncome.offset || scrollController.offset > scrollControllerMonthlyIncome.offset) {
          scrollController.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        }
        if (weeklyIncomeExpansion.value == true) {
          if (scrollControllerWeeklyIncome.offset < scrollControllerMonthlyIncome.offset || scrollControllerWeeklyIncome.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerWeeklyIncome.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        } else {
          if (scrollControllerTotalListWeeklyIncome.offset < scrollControllerMonthlyIncome.offset || scrollControllerTotalListWeeklyIncome.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        }
        if (monthlyExpenseExpansion.value == true) {
          if (scrollControllerMonthlyExpense.offset < scrollControllerMonthlyIncome.offset || scrollControllerMonthlyExpense.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerMonthlyExpense.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        } else {
          if (scrollControllerTotalListMonthlyExpense.offset < scrollControllerMonthlyIncome.offset || scrollControllerTotalListMonthlyExpense.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        }
        if (weeklyBudgetExpansion.value == true) {
          if (scrollControllerWeeklyBudget.offset < scrollControllerMonthlyIncome.offset || scrollControllerWeeklyBudget.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerWeeklyBudget.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        } else {
          if (scrollControllerTotalListWeeklyBudget.offset < scrollControllerMonthlyIncome.offset || scrollControllerTotalListWeeklyBudget.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        }

        if (oneTimeIncomeExpansion.value == true) {
          if (scrollControllerOneTimeIncome.offset < scrollControllerMonthlyIncome.offset || scrollControllerOneTimeIncome.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerOneTimeIncome.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        } else {
          if (scrollControllerTotalListOneTimeIncome.offset < scrollControllerMonthlyIncome.offset || scrollControllerTotalListOneTimeIncome.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        }

        if (oneTimeExpenseExpansion.value == true) {
          if (scrollControllerOneTimeExpense.offset < scrollControllerMonthlyIncome.offset || scrollControllerOneTimeExpense.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerOneTimeExpense.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        } else {
          if (scrollControllerTotalListOneTimeExpense.offset < scrollControllerMonthlyIncome.offset || scrollControllerTotalListOneTimeExpense.offset > scrollControllerMonthlyIncome.offset) {
            scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
          }
        }

        if (scrollControllerTotalListMonthlyIncome.offset < scrollControllerMonthlyIncome.offset || scrollControllerTotalListMonthlyIncome.offset > scrollControllerMonthlyIncome.offset) {
          scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        }

        if (scrollControllerPreviousWeekBalance.offset < scrollControllerMonthlyIncome.offset || scrollControllerPreviousWeekBalance.offset > scrollControllerMonthlyIncome.offset) {
          scrollControllerPreviousWeekBalance.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        }

        if (scrollControllerTotalWeeklyIncome.offset < scrollControllerMonthlyIncome.offset || scrollControllerTotalWeeklyIncome.offset > scrollControllerMonthlyIncome.offset) {
          scrollControllerTotalWeeklyIncome.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        }
        if (scrollControllerTotalWeeklyExpense.offset < scrollControllerMonthlyIncome.offset || scrollControllerTotalWeeklyExpense.offset > scrollControllerMonthlyIncome.offset) {
          scrollControllerTotalWeeklyExpense.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        }
        if (scrollControllerEndOfTheWeekBalance.offset < scrollControllerMonthlyIncome.offset || scrollControllerEndOfTheWeekBalance.offset > scrollControllerMonthlyIncome.offset) {
          scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerMonthlyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        }
      });
      scrollControllerWeeklyIncome.addListener(() {
        // if (scrollController.offset < scrollControllerWeeklyIncome.offset || scrollController.offset > scrollControllerWeeklyIncome.offset) {
        scrollController.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerMonthlyIncome.offset < scrollControllerWeeklyIncome.offset || scrollControllerMonthlyIncome.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerMonthlyIncome.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerMonthlyExpense.offset < scrollControllerWeeklyIncome.offset || scrollControllerMonthlyExpense.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerMonthlyExpense.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerWeeklyBudget.offset < scrollControllerWeeklyIncome.offset || scrollControllerWeeklyBudget.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerWeeklyBudget.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListMonthlyIncome.offset < scrollControllerWeeklyIncome.offset || scrollControllerTotalListMonthlyIncome.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        //
        // if (scrollControllerTotalListWeeklyIncome.offset < scrollControllerWeeklyIncome.offset || scrollControllerTotalListWeeklyIncome.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListMonthlyExpense.offset < scrollControllerWeeklyIncome.offset || scrollControllerTotalListMonthlyExpense.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListWeeklyBudget.offset < scrollControllerWeeklyIncome.offset || scrollControllerTotalListWeeklyBudget.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        //
        // if (scrollControllerOneTimeIncome.offset < scrollControllerWeeklyIncome.offset || scrollControllerOneTimeIncome.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerOneTimeIncome.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListOneTimeIncome.offset < scrollControllerWeeklyIncome.offset || scrollControllerTotalListOneTimeIncome.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListOneTimeExpense.offset < scrollControllerWeeklyIncome.offset || scrollControllerTotalListOneTimeExpense.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerOneTimeExpense.offset < scrollControllerWeeklyIncome.offset || scrollControllerOneTimeExpense.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerOneTimeExpense.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerPreviousWeekBalance.offset < scrollControllerWeeklyIncome.offset || scrollControllerPreviousWeekBalance.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerPreviousWeekBalance.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalWeeklyIncome.offset < scrollControllerWeeklyIncome.offset || scrollControllerTotalWeeklyIncome.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerTotalWeeklyIncome.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalWeeklyExpense.offset < scrollControllerWeeklyIncome.offset || scrollControllerTotalWeeklyExpense.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerTotalWeeklyExpense.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerEndOfTheWeekBalance.offset < scrollControllerWeeklyIncome.offset || scrollControllerEndOfTheWeekBalance.offset > scrollControllerWeeklyIncome.offset) {
        scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
      });

      scrollControllerMonthlyExpense.addListener(() {
        // if (scrollController.offset < scrollControllerMonthlyExpense.offset || scrollController.offset > scrollControllerMonthlyExpense.offset) {
        scrollController.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerMonthlyIncome.offset < scrollControllerMonthlyExpense.offset || scrollControllerMonthlyIncome.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerMonthlyIncome.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerWeeklyIncome.offset < scrollControllerMonthlyExpense.offset || scrollControllerWeeklyIncome.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerWeeklyIncome.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerWeeklyBudget.offset < scrollControllerMonthlyExpense.offset || scrollControllerWeeklyBudget.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerWeeklyBudget.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListMonthlyIncome.offset < scrollControllerMonthlyExpense.offset || scrollControllerTotalListMonthlyIncome.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListWeeklyIncome.offset < scrollControllerMonthlyExpense.offset || scrollControllerTotalListWeeklyIncome.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListMonthlyExpense.offset < scrollControllerMonthlyExpense.offset || scrollControllerTotalListMonthlyExpense.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListWeeklyBudget.offset < scrollControllerMonthlyExpense.offset || scrollControllerTotalListWeeklyBudget.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerOneTimeIncome.offset < scrollControllerMonthlyExpense.offset || scrollControllerOneTimeIncome.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerOneTimeIncome.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListOneTimeIncome.offset < scrollControllerMonthlyExpense.offset || scrollControllerTotalListOneTimeIncome.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerOneTimeExpense.offset < scrollControllerMonthlyExpense.offset || scrollControllerOneTimeExpense.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerOneTimeExpense.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListOneTimeExpense.offset < scrollControllerMonthlyExpense.offset || scrollControllerTotalListOneTimeExpense.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerPreviousWeekBalance.offset < scrollControllerMonthlyExpense.offset || scrollControllerPreviousWeekBalance.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerPreviousWeekBalance.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalWeeklyIncome.offset < scrollControllerMonthlyExpense.offset || scrollControllerTotalWeeklyIncome.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerTotalWeeklyIncome.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalWeeklyExpense.offset < scrollControllerMonthlyExpense.offset || scrollControllerTotalWeeklyExpense.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerTotalWeeklyExpense.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerEndOfTheWeekBalance.offset < scrollControllerMonthlyExpense.offset || scrollControllerEndOfTheWeekBalance.offset > scrollControllerMonthlyExpense.offset) {
        scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerMonthlyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
      });

      scrollControllerWeeklyBudget.addListener(() {
        // if (scrollController.offset < scrollControllerWeeklyBudget.offset || scrollController.offset > scrollControllerWeeklyBudget.offset) {
        scrollController.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerMonthlyIncome.offset < scrollControllerWeeklyBudget.offset || scrollControllerMonthlyIncome.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerMonthlyIncome.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerWeeklyIncome.offset < scrollControllerWeeklyBudget.offset || scrollControllerWeeklyIncome.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerWeeklyIncome.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerMonthlyExpense.offset < scrollControllerWeeklyBudget.offset || scrollControllerMonthlyExpense.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerMonthlyExpense.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListMonthlyIncome.offset < scrollControllerWeeklyBudget.offset || scrollControllerTotalListMonthlyIncome.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListWeeklyIncome.offset < scrollControllerWeeklyBudget.offset || scrollControllerTotalListWeeklyIncome.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListMonthlyExpense.offset < scrollControllerWeeklyBudget.offset || scrollControllerTotalListMonthlyExpense.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListWeeklyBudget.offset < scrollControllerWeeklyBudget.offset || scrollControllerTotalListWeeklyBudget.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerOneTimeIncome.offset < scrollControllerWeeklyBudget.offset || scrollControllerOneTimeIncome.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerOneTimeIncome.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListOneTimeIncome.offset < scrollControllerWeeklyBudget.offset || scrollControllerTotalListOneTimeIncome.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerOneTimeExpense.offset < scrollControllerWeeklyBudget.offset || scrollControllerOneTimeExpense.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerOneTimeExpense.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListOneTimeExpense.offset < scrollControllerWeeklyBudget.offset || scrollControllerTotalListOneTimeExpense.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerPreviousWeekBalance.offset < scrollControllerWeeklyBudget.offset || scrollControllerPreviousWeekBalance.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerPreviousWeekBalance.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalWeeklyIncome.offset < scrollControllerWeeklyBudget.offset || scrollControllerTotalWeeklyIncome.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerTotalWeeklyIncome.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalWeeklyExpense.offset < scrollControllerWeeklyBudget.offset || scrollControllerTotalWeeklyExpense.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerTotalWeeklyExpense.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerEndOfTheWeekBalance.offset < scrollControllerWeeklyBudget.offset || scrollControllerEndOfTheWeekBalance.offset > scrollControllerWeeklyBudget.offset) {
        scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerWeeklyBudget.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
      });

      scrollControllerOneTimeIncome.addListener(() {
        // if (scrollController.offset < scrollControllerOneTimeIncome.offset || scrollController.offset > scrollControllerOneTimeIncome.offset) {
        scrollController.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerMonthlyIncome.offset < scrollControllerOneTimeIncome.offset || scrollControllerMonthlyIncome.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerMonthlyIncome.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerWeeklyIncome.offset < scrollControllerOneTimeIncome.offset || scrollControllerWeeklyIncome.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerWeeklyIncome.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerWeeklyBudget.offset < scrollControllerOneTimeIncome.offset || scrollControllerWeeklyBudget.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerWeeklyBudget.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerMonthlyExpense.offset < scrollControllerOneTimeIncome.offset || scrollControllerMonthlyExpense.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerMonthlyExpense.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerOneTimeExpense.offset < scrollControllerOneTimeIncome.offset || scrollControllerOneTimeExpense.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerOneTimeExpense.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListMonthlyIncome.offset < scrollControllerOneTimeIncome.offset || scrollControllerTotalListMonthlyIncome.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListWeeklyIncome.offset < scrollControllerOneTimeIncome.offset || scrollControllerTotalListWeeklyIncome.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListWeeklyBudget.offset < scrollControllerOneTimeIncome.offset || scrollControllerTotalListWeeklyBudget.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListMonthlyExpense.offset < scrollControllerOneTimeIncome.offset || scrollControllerTotalListMonthlyExpense.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListOneTimeExpense.offset < scrollControllerOneTimeIncome.offset || scrollControllerTotalListOneTimeExpense.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalListOneTimeIncome.offset < scrollControllerOneTimeIncome.offset || scrollControllerTotalListOneTimeIncome.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerPreviousWeekBalance.offset < scrollControllerOneTimeIncome.offset || scrollControllerPreviousWeekBalance.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerPreviousWeekBalance.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalWeeklyIncome.offset < scrollControllerOneTimeIncome.offset || scrollControllerTotalWeeklyIncome.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerTotalWeeklyIncome.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerTotalWeeklyExpense.offset < scrollControllerOneTimeIncome.offset || scrollControllerTotalWeeklyExpense.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerTotalWeeklyExpense.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
        // if (scrollControllerEndOfTheWeekBalance.offset < scrollControllerOneTimeIncome.offset || scrollControllerEndOfTheWeekBalance.offset > scrollControllerOneTimeIncome.offset) {
        scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerOneTimeIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        // }
      });

      scrollControllerOneTimeExpense.addListener(() {
        scrollController.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyIncome.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyIncome.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyBudget.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyExpense.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeIncome.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerPreviousWeekBalance.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyIncome.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyExpense.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerOneTimeExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      });

      scrollControllerPreviousWeekBalance.addListener(() {
        scrollController.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyIncome.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyIncome.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyBudget.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyExpense.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeIncome.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeExpense.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyIncome.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyExpense.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerPreviousWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      });

      scrollControllerTotalWeeklyIncome.addListener(() {
        scrollController.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyIncome.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyIncome.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyBudget.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyExpense.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeIncome.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeExpense.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerPreviousWeekBalance.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyExpense.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerTotalWeeklyIncome.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      });

      scrollControllerTotalWeeklyExpense.addListener(() {
        scrollController.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyIncome.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyIncome.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyBudget.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyExpense.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeIncome.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeExpense.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerPreviousWeekBalance.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyIncome.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerEndOfTheWeekBalance.animateTo(scrollControllerTotalWeeklyExpense.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      });

      scrollControllerEndOfTheWeekBalance.addListener(() {
        scrollController.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyIncome.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyIncome.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerWeeklyBudget.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerMonthlyExpense.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeIncome.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerOneTimeExpense.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyIncome.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyIncome.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListWeeklyBudget.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListMonthlyExpense.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeExpense.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalListOneTimeIncome.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerPreviousWeekBalance.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyIncome.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
        scrollControllerTotalWeeklyExpense.animateTo(scrollControllerEndOfTheWeekBalance.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      });
    });
    // print('totalWeeklyBudgetListLength${TotalIncomeExpenseController.to.totalWeeklyBudgetList.length}');
    // TotalIncomeExpenseController.to.totalWeeklyBudgetList.refresh();
    // TotalIncomeExpenseController.to.totalWeeklyIncomeList.refresh();
    // TotalIncomeExpenseController.to.totalPreviousWeekBalanceLogic();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollControllerMonthlyIncome.dispose();
    scrollControllerWeeklyIncome.dispose();
    scrollControllerMonthlyExpense.dispose();
    scrollControllerWeeklyBudget.dispose();
    scrollControllerTotalListMonthlyIncome.dispose();
    scrollControllerTotalListWeeklyIncome.dispose();
    scrollControllerTotalListMonthlyExpense.dispose();
    scrollControllerTotalListWeeklyBudget.dispose();
    scrollControllerTotalListOneTimeIncome.dispose();
    scrollControllerTotalListOneTimeExpense.dispose();
    scrollControllerPreviousWeekBalance.dispose();
    scrollControllerTotalWeeklyIncome.dispose();
    scrollControllerTotalWeeklyExpense.dispose();
    scrollControllerOneTimeIncome.dispose();
    scrollControllerOneTimeExpense.dispose();
    scrollControllerEndOfTheWeekBalance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visibilityController = Get.put(DashBoardVisibilityController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        double scrollWidth = maxWidth ? Get.width * 0.067 : Get.width * 0.14;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: maxWidth ? const Color(0xffebf0f4) : const Color(0xffE5E5E5),
          appBar: maxWidth
              ? appBarWithUserNAme(context: context)
              : AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    dashBoard,
                    style: mobileAppBarStyle,
                  ),
                  actions: [
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.01),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // showCommonDialog(context);
                                Get.to(() => const NotificationsScreen());
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorF5F6F7,
                                ),
                                child: Image.asset(notificationImage),
                              ),
                            ),
                            const Positioned(
                              right: 3,
                              top: 4,
                              child: CircleAvatar(
                                backgroundColor: color12CC8E,
                                radius: 6,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.007,
                      ),
                      GestureDetector(
                        onTap: () {
                          showPopupMenu(context);
                        },
                        child: Container(
                          width: 86,
                          margin: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01, right: Get.width * 0.015),
                          padding: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(color: colorF5F6F7, borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 17,
                                backgroundImage: AssetImage(
                                  profileImage,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.015,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  maxWidth ? webHeaderRow(constraints: constraints) : mobileHeaderColumn(),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: maxWidth ? 12 : 0, right: maxWidth ? 12 : 0),
                        margin: EdgeInsets.only(top: maxWidth ? 9 : 14),
                        // height: 300,
                        width: double.infinity,
                        color: maxWidth ? colorsebf0f4 : Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            maxWidth ? Container() : _mobileSimulateModeRow(constraints: constraints),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: maxWidth ? 10 : 5),
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: maxWidth ? 8 : 0),
                              decoration: BoxDecoration(color: maxWidth ? Colors.white : colorEDF2F6, borderRadius: BorderRadius.circular(maxWidth ? 5 : 0)),
                              height: 45,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Stack(
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset(
                                                calendarImage,
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              calendar,
                                              style: blackCalendarStyle11W500,
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: InkWell(
                                            onTap: () {
                                              if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
                                                TotalIncomeExpenseController.to.calculateMoreFutureDates(scrollController: scrollController);
                                              }
                                              scrollController.jumpTo(
                                                scrollController.position.pixels - scrollWidth--,
                                              );
                                              if (monthlyIncomeExpansion.value == true) {
                                                scrollControllerMonthlyIncome.jumpTo(
                                                  scrollController.offset,
                                                );
                                              } else {
                                                scrollControllerTotalListMonthlyIncome.jumpTo(
                                                  scrollController.offset,
                                                );
                                              }
                                              if (weeklyIncomeExpansion.value == true) {
                                                scrollControllerWeeklyIncome.jumpTo(
                                                  scrollController.offset,
                                                );
                                              } else {
                                                scrollControllerTotalListWeeklyIncome.jumpTo(
                                                  scrollController.offset,
                                                );
                                              }
                                              if (monthlyExpenseExpansion.value == true) {
                                                scrollControllerMonthlyExpense.jumpTo(
                                                  scrollController.offset,
                                                );
                                              } else {
                                                scrollControllerTotalListMonthlyExpense.jumpTo(
                                                  scrollController.offset,
                                                );
                                              }
                                              if (weeklyBudgetExpansion.value == true) {
                                                scrollControllerWeeklyBudget.jumpTo(
                                                  scrollController.offset,
                                                );
                                              } else {
                                                scrollControllerTotalListWeeklyBudget.jumpTo(
                                                  scrollController.offset,
                                                );
                                              }
                                              if (oneTimeIncomeExpansion.value == true) {
                                                scrollControllerOneTimeIncome.jumpTo(
                                                  scrollController.offset,
                                                );
                                              } else {
                                                scrollControllerTotalListOneTimeIncome.jumpTo(
                                                  scrollController.offset,
                                                );
                                              }
                                              if (oneTimeExpenseExpansion.value == true) {
                                                scrollControllerOneTimeExpense.jumpTo(
                                                  scrollController.offset,
                                                );
                                              } else {
                                                scrollControllerTotalListOneTimeExpense.jumpTo(
                                                  scrollController.offset,
                                                );
                                              }
                                              scrollControllerPreviousWeekBalance.jumpTo(
                                                scrollController.offset,
                                              );
                                              scrollControllerTotalWeeklyIncome.jumpTo(
                                                scrollController.offset,
                                              );
                                              scrollControllerTotalWeeklyExpense.jumpTo(
                                                scrollController.offset,
                                              );
                                              scrollControllerEndOfTheWeekBalance.jumpTo(
                                                scrollController.offset,
                                              );
                                            },
                                            child: Icon(
                                              Icons.arrow_back_ios, color: Colors.black, size: 12.sp,
                                              // size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Flexible(child: GetBuilder<PageViewPageIndex>(
                                          builder: (controller) {
                                            return SizedBox(
                                              height: Get.height * 0.022,
                                              // margin: EdgeInsets.only(left: maxWidth ? 5 : 0.0),
                                              child: SingleChildScrollView(
                                                controller: scrollController,
                                                scrollDirection: Axis.horizontal,
                                                child: StreamBuilder(
                                                    stream: TotalIncomeExpenseController.to.datesList.stream,
                                                    builder: (context, snapshot) {
                                                      return ListView.builder(
                                                        itemCount: TotalIncomeExpenseController.to.datesList.length,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        // controller: scrollController,
                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.horizontal,
                                                        itemBuilder: (context, index) {
                                                          // DateTime dateFormated=;
                                                          // String finalDate=DateFormat('MMM, dd').format(dateFormated);
                                                          // if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
                                                          //   return calculateMoreFutureDates();
                                                          // } else {
                                                          return SizedBox(
                                                            width: maxWidth ? Get.width * 0.067 : Get.width * 0.15,
                                                            child: Text(
                                                              DateFormat('MMM, dd').format(DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[index])),
                                                              style: greyDateTexStyle10W400,
                                                              textAlign: TextAlign.center,
                                                            ),
                                                          );
                                                          // }
                                                        },
                                                      );
                                                    }),
                                              ),
                                            );
                                          },
                                        )),
                                        InkWell(
                                          onTap: () {
                                            if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
                                              TotalIncomeExpenseController.to.calculateMoreFutureDates(scrollController: scrollController);
                                            }
                                            scrollController.jumpTo(
                                              scrollController.position.pixels + scrollWidth++,
                                            );

                                            if (monthlyIncomeExpansion.value == true) {
                                              scrollControllerMonthlyIncome.jumpTo(
                                                scrollController.offset,
                                              );
                                            } else {
                                              scrollControllerTotalListMonthlyIncome.jumpTo(
                                                scrollController.offset,
                                              );
                                            }
                                            if (weeklyIncomeExpansion.value == true) {
                                              scrollControllerWeeklyIncome.jumpTo(
                                                scrollController.offset,
                                              );
                                            } else {
                                              scrollControllerTotalListWeeklyIncome.jumpTo(
                                                scrollController.offset,
                                              );
                                            }
                                            if (monthlyExpenseExpansion.value == true) {
                                              scrollControllerMonthlyExpense.jumpTo(
                                                scrollController.offset,
                                              );
                                            } else {
                                              scrollControllerTotalListMonthlyExpense.jumpTo(
                                                scrollController.offset,
                                              );
                                            }
                                            if (weeklyBudgetExpansion.value == true) {
                                              scrollControllerWeeklyBudget.jumpTo(
                                                scrollController.offset,
                                              );
                                            } else {
                                              scrollControllerTotalListWeeklyBudget.jumpTo(
                                                scrollController.offset,
                                              );
                                            }
                                            if (oneTimeIncomeExpansion.value == true) {
                                              scrollControllerOneTimeIncome.jumpTo(
                                                scrollController.offset,
                                              );
                                            } else {
                                              scrollControllerTotalListOneTimeIncome.jumpTo(
                                                scrollController.offset,
                                              );
                                            }
                                            if (oneTimeExpenseExpansion.value == true) {
                                              scrollControllerOneTimeExpense.jumpTo(
                                                scrollController.offset,
                                              );
                                            } else {
                                              scrollControllerTotalListOneTimeExpense.jumpTo(
                                                scrollController.offset,
                                              );
                                            }
                                            scrollControllerPreviousWeekBalance.jumpTo(
                                              scrollController.offset,
                                            );
                                            scrollControllerTotalWeeklyIncome.jumpTo(
                                              scrollController.offset,
                                            );
                                            scrollControllerTotalWeeklyExpense.jumpTo(
                                              scrollController.offset,
                                            );
                                            scrollControllerEndOfTheWeekBalance.jumpTo(
                                              scrollController.offset,
                                            );
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 12.sp, color: Colors.black,
                                            // size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: maxWidth ? 10 : 0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: maxWidth ? 8 : 0, right: maxWidth ? 8 : 0, bottom: maxWidth ? 13 : 0.0),
                              child: Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  onExpansionChanged: (value) {
                                    if (value) {
                                      Future.delayed(const Duration(milliseconds: 50), () {
                                        scrollControllerMonthlyIncome.jumpTo(
                                          scrollController.position.pixels,
                                        );
                                      });
                                    } else {
                                      Future.delayed(const Duration(milliseconds: 50), () {
                                        scrollControllerTotalListMonthlyIncome.jumpTo(
                                          scrollController.position.pixels,
                                        );
                                      });
                                    }
                                    monthlyIncomeExpansion = value.obs;
                                    monthlyIncomeExpansion.refresh();
                                    monthlyIncomeExpansionValue.changeExpansionValue();
                                  },
                                  collapsedBackgroundColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  iconColor: color097EA2,
                                  collapsedIconColor: color097EA2,
                                  trailing: GetBuilder<MonthlyIncomeExpansionChange>(
                                    builder: (controller) {
                                      return maxWidth && controller.expansionValue == false
                                          ? StreamBuilder(
                                              stream: TotalIncomeExpenseController.to.datesList.stream,
                                              builder: (context, snapshot) {
                                                return Padding(
                                                  padding: const EdgeInsets.only(right: 25),
                                                  child: SizedBox(
                                                    width: Get.width / 2.1,
                                                    child: StreamBuilder(
                                                      stream: TotalIncomeExpenseController.to.totalMonthlyIncomeList.stream,
                                                      builder: (context, snapshot) {
                                                        return totalListScrollAbleWidget(
                                                            itemCount: TotalIncomeExpenseController.to.totalMonthlyIncomeList.length,
                                                            scrollController: scrollControllerTotalListMonthlyIncome,
                                                            totalIncomeExpenseList: TotalIncomeExpenseController.to.totalMonthlyIncomeList);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              })
                                          : Column();
                                    },
                                  ),
                                  tilePadding: const EdgeInsets.only(left: 15),
                                  title: monthlyIncomeEditModeRow(constraints: constraints),
                                  children: [
                                    GetBuilder<MonthlyIncomeVisibilityController>(
                                      builder: (monthlyIncomeController) {
                                        return Container(
                                          padding: EdgeInsets.only(
                                              left: maxWidth ? 14 : 0,
                                              right: maxWidth
                                                  ? 27
                                                  : monthlyIncomeController.visibilityIncome == true
                                                      ? 20
                                                      : 0.0),
                                          decoration: BoxDecoration(
                                              // color: Colors.red,
                                              border: Border(
                                            bottom: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                            top: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                          )),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              monthlyIncomeData(boolValue: monthlyIncomeController.visibilityIncome, constraints: constraints, visibilityValue: monthlyIncomeController.visibility),
                                              Expanded(
                                                flex: monthlyIncomeController.visibilityIncome == true
                                                    ? 2
                                                    : constraints.maxWidth < 1000
                                                        ? 0
                                                        : 2,
                                                child: GetBuilder<SaveDataTextController>(
                                                  builder: (controller) {
                                                    return Visibility(
                                                      visible: constraints.maxWidth < 1000 ? monthlyIncomeController.visibilityIncome : true,
                                                      child: GetBuilder<MonthlyIncomeEditModeController>(
                                                        builder: (MonthlyEditModeController) {
                                                          return Padding(
                                                            padding: EdgeInsets.only(
                                                              top: MonthlyEditModeController.editMode == true && constraints.maxWidth < 1200
                                                                  ? 40
                                                                  : maxWidth
                                                                      ? 25
                                                                      : Get.height * 0.005,
                                                              left: constraints.maxWidth > 1000 ? 8.0 : 13.0,

                                                              // bottom: maxWidth
                                                              //     ? controller.showTextWeb == false
                                                              //         ? 62
                                                              //         : controller.showTextWeb == true && MonthlyEditModeController.editMode == false
                                                              //             ? Get.height * 0.045
                                                              //             : MonthlyEditModeController.editMode == true && maxWidth
                                                              //                 ? Get.height * 0.01
                                                              //                 : 0.0
                                                              //     : 0.0,
                                                            ),
                                                            child: StreamBuilder(
                                                                stream: MonthlyEditModeController.editMode
                                                                    ? GetIncomeController.to.tempMonthlyIncomeList?.stream
                                                                    : GetIncomeController.to.monthlyIncomeList?.stream,
                                                                builder: (context, snapshot) {
                                                                  return SingleChildScrollView(
                                                                    controller: scrollControllerMonthlyIncome,
                                                                    scrollDirection: Axis.horizontal,
                                                                    physics: const ClampingScrollPhysics(),
                                                                    child: StreamBuilder(
                                                                        stream: TotalIncomeExpenseController.to.datesList.stream,
                                                                        builder: (context, snapshot) {
                                                                          return Column(
                                                                              children: List.generate(
                                                                            MonthlyEditModeController.editMode
                                                                                ? GetIncomeController.to.tempMonthlyIncomeList!.length
                                                                                : GetIncomeController.to.monthlyIncomeList!.length,
                                                                            (index) => SizedBox(
                                                                              height: MonthlyEditModeController.editMode
                                                                                  ? Get.height * 0.059
                                                                                  : maxWidth
                                                                                      ? Get.height * 0.035
                                                                                      : Get.height * 0.032,
                                                                              child: ListView.builder(
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.horizontal,
                                                                                itemCount: TotalIncomeExpenseController.to.datesList.length,
                                                                                itemBuilder: (context, dateIndex) {
                                                                                  int dateFormattedInt = int.parse(formatter
                                                                                      .format(DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[dateIndex]))
                                                                                      .toString()
                                                                                      .replaceRange(0, 4, ''));
                                                                                  return SizedBox(
                                                                                    width: constraints.maxWidth > 1000 ? Get.width * 0.067 : Get.width * 0.15,
                                                                                    child: Text(
                                                                                      dateIndex != TotalIncomeExpenseController.to.datesList.length - 1 &&
                                                                                                  int.parse(formatter
                                                                                                          .format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![index].date.toString()))
                                                                                                          .toString()
                                                                                                          .replaceRange(0, 4, '')) <
                                                                                                      dateFormattedInt + 7 &&
                                                                                                  int.parse(formatter
                                                                                                          .format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![index].date.toString()))
                                                                                                          .toString()
                                                                                                          .replaceRange(0, 4, '')) >
                                                                                                      dateFormattedInt ||
                                                                                              int.parse(formatter
                                                                                                      .format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![index].date.toString()))
                                                                                                      .toString()
                                                                                                      .replaceRange(0, 4, '')) ==
                                                                                                  dateFormattedInt
                                                                                          ? '${GetIncomeController.to.monthlyIncomeList![index].amount}'
                                                                                          : '-',
                                                                                      style: greyDateTexStyle10W400,
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ));
                                                                        }),
                                                                  );
                                                                }),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: maxWidth ? 8 : 0, right: maxWidth ? 8 : 0, bottom: maxWidth ? 13 : 0.0),
                              child: Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  collapsedBackgroundColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  iconColor: color097EA2,
                                  tilePadding: const EdgeInsets.only(left: 15),
                                  onExpansionChanged: (value) {
                                    weeklyIncomeExpansionValue.changeExpansionValue();
                                    if (value) {
                                      Future.delayed(const Duration(milliseconds: 50), () {
                                        scrollControllerWeeklyIncome.jumpTo(
                                          scrollController.position.pixels,
                                        );
                                      });
                                    } else {
                                      Future.delayed(const Duration(milliseconds: 50), () {
                                        scrollControllerTotalListWeeklyIncome.jumpTo(
                                          scrollController.position.pixels,
                                        );
                                      });
                                    }
                                    weeklyIncomeExpansion = value.obs;
                                    weeklyIncomeExpansion.refresh();
                                  },
                                  trailing: GetBuilder<WeeklyIncomeExpansionChange>(
                                    builder: (controller) {
                                      return maxWidth && controller.weeklyIncomeExpansionValue == false
                                          ? Padding(
                                              padding: const EdgeInsets.only(right: 25),
                                              child: SizedBox(
                                                width: Get.width / 2.1,
                                                child: StreamBuilder(
                                                  stream: TotalIncomeExpenseController.to.totalWeeklyIncomeList.stream,
                                                  builder: (context, snapshot) {
                                                    print('Lengthweweweew${TotalIncomeExpenseController.to.totalWeeklyIncomeList.length}');
                                                    return totalListScrollAbleWidget(
                                                        itemCount: TotalIncomeExpenseController.to.totalWeeklyIncomeList.length,
                                                        scrollController: scrollControllerTotalListWeeklyIncome,
                                                        totalIncomeExpenseList: TotalIncomeExpenseController.to.totalWeeklyIncomeList);
                                                  },
                                                ),
                                              ),
                                            )
                                          : Column();
                                    },
                                  ),
                                  title: weeklyIncomeEditModeRow(constraints: constraints),
                                  children: [
                                    GetBuilder<WeeklyIncomeDataVisibilityController>(
                                      builder: (weeklyIncomeDataController) {
                                        return Container(
                                          // padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 5),
                                          padding: EdgeInsets.only(
                                              // left: maxWidth ? 14 : 0, right: maxWidth ? 27 : 20
                                              left: maxWidth ? 14 : 0.0,
                                              right: maxWidth
                                                  ? 27
                                                  : weeklyIncomeDataController.incomeListVisibility == true
                                                      ? 20
                                                      : 0.0),
                                          // padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 2),
                                          decoration: BoxDecoration(
                                              // color: Colors.red,
                                              border: Border(
                                            bottom: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                            top: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                          )),
                                          child: GetBuilder<WeeklyIncomeEditModeController>(
                                            builder: (weeklyIncomeEditModeController) {
                                              return Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  weeklyIncomeData(
                                                      boolValue: weeklyIncomeDataController.incomeListVisibility,
                                                      constraints: constraints,
                                                      visibilityValue: weeklyIncomeDataController.weeklyDataVisibility),
                                                  Expanded(
                                                    flex: weeklyIncomeDataController.incomeListVisibility == true
                                                        ? 2
                                                        : constraints.maxWidth < 1000
                                                            ? 0
                                                            : 2,
                                                    child: GetBuilder<ShowWeeklyIncomeSaveDataTextController>(
                                                      builder: (controller) {
                                                        return Visibility(
                                                          visible: constraints.maxWidth < 1000 ? weeklyIncomeDataController.incomeListVisibility : true,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                              left: constraints.maxWidth > 1000 ? 0.0 : 13.0,
                                                              top: weeklyIncomeEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth < 1200
                                                                  ? 40
                                                                  : maxWidth
                                                                      ? 25
                                                                      : Get.height * 0.01,
                                                              // bottom: controller.weeklyIncomeShowTextWeb == true && weeklyIncomeEditModeController.weeklyIncomeEditMode == false && maxWidth
                                                              //     ? Get.height * 0.045
                                                              //     : controller.weeklyIncomeShowTextWeb == false
                                                              //         ? 62
                                                              //         : 0.0
                                                            ),
                                                            child: StreamBuilder(
                                                                stream: weeklyIncomeEditModeController.weeklyIncomeEditMode
                                                                    ? GetIncomeController.to.tempWeeklyIncomeList?.stream
                                                                    : GetIncomeController.to.weeklyIncomesList?.stream,
                                                                builder: (context, snapshot) {
                                                                  return SingleChildScrollView(
                                                                    controller: scrollControllerWeeklyIncome,
                                                                    scrollDirection: Axis.horizontal,
                                                                    physics: const ClampingScrollPhysics(),
                                                                    child: StreamBuilder(
                                                                        stream: TotalIncomeExpenseController.to.datesList.stream,
                                                                        builder: (context, snapshot) {
                                                                          return Column(
                                                                              children: List.generate(
                                                                            weeklyIncomeEditModeController.weeklyIncomeEditMode
                                                                                ? GetIncomeController.to.tempWeeklyIncomeList!.length
                                                                                : GetIncomeController.to.weeklyIncomesList!.length,
                                                                            (index) => SizedBox(
                                                                              height: weeklyIncomeEditModeController.weeklyIncomeEditMode
                                                                                  ? Get.height * 0.059
                                                                                  : maxWidth
                                                                                      ? Get.height * 0.035
                                                                                      : Get.height * 0.032,
                                                                              child: StreamBuilder(
                                                                                  stream: TotalIncomeExpenseController.to.datesList.stream,
                                                                                  builder: (context, snapshot) {
                                                                                    return ListView.builder(
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      itemCount: TotalIncomeExpenseController.to.datesList.length,
                                                                                      itemBuilder: (context, dateIndex) {
                                                                                        // dateIndex != TotalIncomeExpenseController.to.datesList.length - 1 &&
                                                                                        //     int.parse(formatter
                                                                                        //         .format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![index].date.toString()))
                                                                                        //         .toString()
                                                                                        //         .replaceRange(0, 4, '')) <
                                                                                        //         int.parse(
                                                                                        //             TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, '')) +
                                                                                        //             7 &&
                                                                                        //     int.parse(formatter
                                                                                        //         .format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![index].date.toString()))
                                                                                        //         .toString()
                                                                                        //         .replaceRange(0, 4, '')) >
                                                                                        //         int.parse(
                                                                                        //             TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, '')) ||
                                                                                        //     int.parse(formatter
                                                                                        //         .format(DateTime.parse(GetIncomeController.to.monthlyIncomeList![index].date.toString()))
                                                                                        //         .toString()
                                                                                        //         .replaceRange(0, 4, '')) ==
                                                                                        //         int.parse(TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, ''))
                                                                                        // int dateFormattedInt=   int.parse(
                                                                                        //     formatter
                                                                                        //         .format(DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[dateIndex])).toString().replaceRange(0, 4, ''));
                                                                                        DateTime dateFormattedInt =
                                                                                            DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[dateIndex]);
                                                                                        String stringDate = dateFormattedInt.toString();
                                                                                        DateTime temp = DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[dateIndex]);
                                                                                        DateTime dateFormatedWeeklyDate = DateTime.parse(GetIncomeController.to.weeklyIncomesList![index].date!);
                                                                                        DateTime tempWeeklyIncome = DateFormat('MM-dd').parse(dateFormatedWeeklyDate.toString());
                                                                                        DateTime newTemp = DateTime(
                                                                                          temp.year,
                                                                                          temp.month,
                                                                                          temp.day,
                                                                                        );
                                                                                        DateTime newTempWeeklyIncome = DateTime(
                                                                                          temp.year,
                                                                                          dateFormatedWeeklyDate.month,
                                                                                          dateFormatedWeeklyDate.day,
                                                                                        );
                                                                                        print('>>>>>>>>>>>>${newTempWeeklyIncome.weekday}>>>>>>>${newTemp.weekday}');
                                                                                        return SizedBox(
                                                                                            width: constraints.maxWidth > 1000 ? Get.width * 0.067 : Get.width * 0.15,
                                                                                            child: Text(
                                                                                              // newTempWeeklyIncome.weekday > newTemp.weekday
                                                                                              newTempWeeklyIncome.weekday >= newTemp.weekday || newTempWeeklyIncome.weekday <= newTemp.weekday
                                                                                                  ? '${GetIncomeController.to.weeklyIncomesList?[index].amount}'
                                                                                                  : '-',
                                                                                              style: greyDateTexStyle10W400,
                                                                                              textAlign: TextAlign.center,
                                                                                            ));
                                                                                      },
                                                                                    );
                                                                                  }),
                                                                            ),
                                                                          ));
                                                                        }),
                                                                  );
                                                                }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: maxWidth ? 8 : 0, right: maxWidth ? 8 : 0, bottom: maxWidth ? 13 : 0.0),
                              child: Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  collapsedBackgroundColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  iconColor: color097EA2,
                                  onExpansionChanged: (value) {
                                    if (value) {
                                      Future.delayed(Duration(milliseconds: 50), () {
                                        scrollControllerMonthlyExpense.jumpTo(
                                          scrollController.position.pixels,
                                        );
                                      });
                                    } else {
                                      Future.delayed(Duration(milliseconds: 50), () {
                                        scrollControllerTotalListMonthlyExpense.jumpTo(
                                          scrollController.position.pixels,
                                        );
                                      });
                                    }
                                    monthlyExpenseExpansion = value.obs;
                                    monthlyExpenseExpansion.refresh();
                                    monthlyExpenseExpansionValue.changeExpansionValue();
                                  },
                                  trailing: GetBuilder<MonthlyExpenseExpansionChange>(
                                    builder: (controller) {
                                      return maxWidth && controller.monthlyExpenseExpansionValue == false
                                          ? Padding(
                                              padding: const EdgeInsets.only(right: 25),
                                              child: SizedBox(
                                                width: Get.width / 2.1,
                                                child: StreamBuilder(
                                                  stream: TotalIncomeExpenseController.to.totalMonthlyExpenseList.stream,
                                                  builder: (context, snapshot) {
                                                    return totalListScrollAbleWidget(
                                                        itemCount: TotalIncomeExpenseController.to.totalMonthlyExpenseList.length,
                                                        scrollController: scrollControllerTotalListMonthlyExpense,
                                                        totalIncomeExpenseList: TotalIncomeExpenseController.to.totalMonthlyExpenseList);
                                                  },
                                                ),
                                              ),
                                            )
                                          : Column();
                                    },
                                  ),
                                  tilePadding: const EdgeInsets.only(right: 0.0, left: 15),
                                  title: monthlyExpenseEditModeRow(constraints: constraints),
                                  children: [
                                    GetBuilder<MonthlyExpenseDataVisibilityController>(
                                      builder: (monthlyExpenseDataController) {
                                        return Container(
                                          // padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 5),
                                          padding: EdgeInsets.only(

                                              //     // left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 2
                                              left: maxWidth ? 14 : 0.0,
                                              right: maxWidth
                                                  ? 27
                                                  : monthlyExpenseDataController.monthlyExpenseListVisibility == true
                                                      ? 20
                                                      : 0.0),
                                          decoration: BoxDecoration(
                                              // color: Colors.red,
                                              border: Border(
                                            bottom: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                            top: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                          )),
                                          child: GetBuilder<MonthlyExpenseEditModeController>(
                                            builder: (monthlyExpenseEditModeController) {
                                              return Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  monthlyExpenseData(
                                                      boolValue: monthlyExpenseDataController.monthlyExpenseListVisibility,
                                                      constraints: constraints,
                                                      visibilityValue: monthlyExpenseDataController.monthlyExpenseDataVisibility),
                                                  Expanded(
                                                    flex: monthlyExpenseDataController.monthlyExpenseListVisibility == true
                                                        ? 2
                                                        : constraints.maxWidth < 1000
                                                            ? 0
                                                            : 2,
                                                    child: GetBuilder<ShowMonthlyExpenseSaveDataTextController>(
                                                      builder: (controller) {
                                                        return Visibility(
                                                          visible: constraints.maxWidth < 1000 ? monthlyExpenseDataController.monthlyExpenseListVisibility : true,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                              left: constraints.maxWidth > 1000 ? 8.0 : 10.0,
                                                              top: monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth < 1200
                                                                  ? 40
                                                                  : maxWidth
                                                                      ? 25
                                                                      : Get.height * 0.01,
                                                              // bottom: controller.monthlyExpenseShowTextWeb == true && monthlyExpenseEditModeController.monthlyExpenseEditMode == false && maxWidth
                                                              //     ? Get.height * 0.045
                                                              //     : controller.monthlyExpenseShowTextWeb == false
                                                              //         ? 62
                                                              //         : 0.0
                                                            ),
                                                            child: StreamBuilder(
                                                                stream: monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                                    ? GetIncomeController.to.tempMonthlyExpenseList?.stream
                                                                    : GetIncomeController.to.monthlyExpenseList?.stream,
                                                                builder: (context, snapshot) {
                                                                  return SingleChildScrollView(
                                                                    controller: scrollControllerMonthlyExpense,
                                                                    scrollDirection: Axis.horizontal,
                                                                    physics: const ClampingScrollPhysics(),
                                                                    child: StreamBuilder(
                                                                        stream: TotalIncomeExpenseController.to.datesList.stream,
                                                                        builder: (context, snapshot) {
                                                                          return Column(
                                                                              // direction: Axis.vertical,
                                                                              // mainAxisSize: MainAxisSize.min,
                                                                              children: List.generate(
                                                                            monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                                                ? GetIncomeController.to.tempMonthlyExpenseList!.length
                                                                                : GetIncomeController.to.monthlyExpenseList!.length,
                                                                            (index) => SizedBox(
                                                                              height: monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                                                  ? Get.height * 0.059
                                                                                  : maxWidth
                                                                                      ? Get.height * 0.035
                                                                                      : Get.height * 0.032,
                                                                              child: ListView.builder(
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.horizontal,
                                                                                itemCount: TotalIncomeExpenseController.to.datesList.length,
                                                                                itemBuilder: (context, dateIndex) {
                                                                                  int dateFormattedInt = int.parse(formatter
                                                                                      .format(DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[dateIndex]))
                                                                                      .toString()
                                                                                      .replaceRange(0, 4, ''));
                                                                                  return SizedBox(
                                                                                      width: constraints.maxWidth > 1000 ? Get.width * 0.067 : Get.width * 0.15,
                                                                                      child: Text(
                                                                                        // formatter
                                                                                        //             .format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![index].date.toString()))
                                                                                        //             .toString()
                                                                                        //             .replaceRange(0, 4, '') ==
                                                                                        //         TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, '')
                                                                                        // dateIndex != TotalIncomeExpenseController.to.datesList.length - 1 &&
                                                                                        //         int.parse(formatter
                                                                                        //                 .format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![index].date.toString()))
                                                                                        //                 .toString()
                                                                                        //                 .replaceRange(0, 4, '')) <
                                                                                        //             int.parse(TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, '')) +
                                                                                        //                 7 &&
                                                                                        //         int.parse(formatter
                                                                                        //                 .format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![index].date.toString()))
                                                                                        //                 .toString()
                                                                                        //                 .replaceRange(0, 4, '')) >
                                                                                        //             int.parse(TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, '')) &&
                                                                                        //         int.parse(formatter
                                                                                        //                 .format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![index].date.toString()))
                                                                                        //                 .toString()
                                                                                        //                 .replaceRange(0, 4, '')) ==
                                                                                        //             int.parse(TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, ''))

                                                                                        dateIndex != TotalIncomeExpenseController.to.datesList.length - 1 &&
                                                                                                    int.parse(formatter
                                                                                                            .format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![index].date.toString()))
                                                                                                            .toString()
                                                                                                            .replaceRange(0, 4, '')) <
                                                                                                        dateFormattedInt + 7 &&
                                                                                                    int.parse(formatter
                                                                                                            .format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![index].date.toString()))
                                                                                                            .toString()
                                                                                                            .replaceRange(0, 4, '')) >
                                                                                                        dateFormattedInt ||
                                                                                                int.parse(formatter
                                                                                                        .format(DateTime.parse(GetIncomeController.to.monthlyExpenseList![index].date.toString()))
                                                                                                        .toString()
                                                                                                        .replaceRange(0, 4, '')) ==
                                                                                                    dateFormattedInt
                                                                                            ? '${GetIncomeController.to.monthlyExpenseList?[index].amount}'
                                                                                            : '-',
                                                                                        // index == dateListIndex ? '${GetIncomeController.to.monthlyExpenseList![dateListIndex].amount}' : '-',
                                                                                        style: greyDateTexStyle10W400,
                                                                                        textAlign: TextAlign.center,
                                                                                      ));
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ));
                                                                        }),
                                                                  );
                                                                }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: maxWidth ? 8 : 0, right: maxWidth ? 8 : 0, bottom: maxWidth ? 13 : 0.0),
                              child: Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  collapsedBackgroundColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  iconColor: color097EA2,
                                  tilePadding: const EdgeInsets.only(left: 15),
                                  onExpansionChanged: (value) {
                                    if (value) {
                                      Future.delayed(const Duration(milliseconds: 50), () {
                                        scrollControllerWeeklyBudget.jumpTo(
                                          scrollController.position.pixels,
                                        );
                                      });
                                    } else {
                                      Future.delayed(const Duration(milliseconds: 50), () {
                                        scrollControllerTotalListWeeklyBudget.jumpTo(
                                          scrollController.position.pixels,
                                        );
                                      });
                                    }
                                    weeklyBudgetExpansion = value.obs;
                                    weeklyBudgetExpansion.refresh();
                                    // print(value);
                                    weeklyBudgetExpansionValue.changeExpansionValue();
                                  },
                                  trailing: GetBuilder<WeeklyBudgetExpansionChange>(
                                    builder: (controller) {
                                      return maxWidth && controller.weeklyBudgetExpansionValue == false
                                          ? Padding(
                                              padding: const EdgeInsets.only(right: 25),
                                              child: SizedBox(
                                                width: Get.width / 2.1,
                                                child: StreamBuilder(
                                                  stream: TotalIncomeExpenseController.to.totalWeeklyBudgetList.stream,
                                                  builder: (context, snapshot) {
                                                    return totalListScrollAbleWidget(
                                                        itemCount: TotalIncomeExpenseController.to.totalWeeklyBudgetList.length,
                                                        scrollController: scrollControllerTotalListWeeklyBudget,
                                                        totalIncomeExpenseList: TotalIncomeExpenseController.to.totalWeeklyBudgetList);
                                                  },
                                                ),
                                              ),
                                            )
                                          : Column();
                                    },
                                  ),
                                  // tilePadding: EdgeInsets.all(0.0),
                                  title: weeklyBudgetEditModeRow(constraints: constraints),
                                  children: [
                                    GetBuilder<WeeklyBudgetVisibilityController>(
                                      builder: (weeklyBudgetController) {
                                        return Container(
                                          padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 5),
                                          decoration: BoxDecoration(
                                              // color: Colors.red,
                                              border: Border(
                                            bottom: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                            top: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                          )),
                                          child: GetBuilder<WeeklyBudgetEditModeController>(
                                            builder: (weeklyBudgetEditModeController) {
                                              return Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  weeklyBudgetData(
                                                    boolValue: weeklyBudgetController.weeklyBudgetVisibilityIncome,
                                                    constraints: constraints,
                                                    visibilityValue: weeklyBudgetController.weeklyBudgetVisibility,
                                                  ),
                                                  Expanded(
                                                    flex: weeklyBudgetController.weeklyBudgetVisibilityIncome == true
                                                        ? 2
                                                        : constraints.maxWidth < 1000
                                                            ? 0
                                                            : 2,
                                                    child: GetBuilder<ShowWeeklyBudgetSaveDataTextController>(
                                                      builder: (controller) {
                                                        return Visibility(
                                                          visible: constraints.maxWidth < 1000 ? weeklyBudgetController.weeklyBudgetVisibilityIncome : true,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                left: constraints.maxWidth > 1000 ? 8.0 : 13.0,
                                                                // bottom: maxWidth
                                                                //     ? controller.weeklyBudgetShowTextWeb == false
                                                                //         ? 62
                                                                //         : controller.weeklyBudgetShowTextWeb == true && weeklyBudgetEditModeController.weeklyBudgetEditMode == false
                                                                //             ? Get.height * 0.045
                                                                //             : Get.height * 0.01
                                                                //     : 0.0,
                                                                bottom: controller.weeklyBudgetShowTextWeb == true && weeklyBudgetEditModeController.weeklyBudgetEditMode == false && maxWidth
                                                                    ? Get.height * 0.045
                                                                    : controller.weeklyBudgetShowTextWeb == false
                                                                        ? 62
                                                                        : 0.0),
                                                            child: StreamBuilder(
                                                                stream: weeklyBudgetEditModeController.weeklyBudgetEditMode
                                                                    ? GetIncomeController.to.tempWeeklyBudgetList?.stream
                                                                    : GetIncomeController.to.weeklyBudgetList?.stream,
                                                                builder: (context, snapshot) {
                                                                  return SingleChildScrollView(
                                                                    controller: scrollControllerWeeklyBudget,
                                                                    scrollDirection: Axis.horizontal,
                                                                    physics: const ClampingScrollPhysics(),
                                                                    child: StreamBuilder(
                                                                        stream: TotalIncomeExpenseController.to.datesList.stream,
                                                                        builder: (context, snapshot) {
                                                                          return Column(
                                                                              // direction: Axis.vertical,
                                                                              // mainAxisSize: MainAxisSize.min,
                                                                              children: List.generate(
                                                                            weeklyBudgetEditModeController.weeklyBudgetEditMode
                                                                                ? GetIncomeController.to.tempWeeklyBudgetList!.length
                                                                                : GetIncomeController.to.weeklyBudgetList!.length,
                                                                            (index) => SizedBox(
                                                                              height: weeklyBudgetEditModeController.weeklyBudgetEditMode
                                                                                  ? Get.height * 0.059
                                                                                  : maxWidth
                                                                                      ? Get.height * 0.035
                                                                                      : Get.height * 0.032,
                                                                              child: ListView.builder(
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.horizontal,
                                                                                itemCount: TotalIncomeExpenseController.to.datesList.length,
                                                                                itemBuilder: (context, dateIndex) {
                                                                                  // DateTime temp = DateFormat('MMM, dd').parse(TotalIncomeExpenseController.to.datesList[dateIndex]);
                                                                                  DateTime temp = DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[dateIndex]);
                                                                                  DateTime dateFormatedWeeklyBudgetDate = DateTime.parse(GetIncomeController.to.weeklyBudgetList![index].date!);
                                                                                  DateTime tempWeeklyIncome = DateFormat('MM-dd').parse(dateFormatedWeeklyBudgetDate.toString());
                                                                                  DateTime newTemp = DateTime(
                                                                                    temp.year,
                                                                                    temp.month,
                                                                                    temp.day,
                                                                                  );
                                                                                  DateTime newTempWeeklyBudget = DateTime(
                                                                                    dateFormatedWeeklyBudgetDate.year,
                                                                                    dateFormatedWeeklyBudgetDate.month,
                                                                                    dateFormatedWeeklyBudgetDate.day,
                                                                                  );
                                                                                  // print('>>>>>>>>>>>>${newTemp}>>>>>>>${newTempWeeklyBudget}');
                                                                                  return SizedBox(
                                                                                      width: constraints.maxWidth > 1000 ? Get.width * 0.067 : Get.width * 0.15,
                                                                                      child: Text(
                                                                                        // newTempWeeklyBudget.weekday > newTemp.weekday

                                                                                        newTempWeeklyBudget.weekday >= newTemp.weekday || newTempWeeklyBudget.weekday <= newTemp.weekday
                                                                                            ? '${GetIncomeController.to.weeklyBudgetList![index].amount}'
                                                                                            : '-',
                                                                                        style: greyDateTexStyle10W400,
                                                                                        textAlign: TextAlign.center,
                                                                                      ));
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ));
                                                                        }),
                                                                  );
                                                                }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: maxWidth ? 0 : 10,
                            ),
                            Align(
                              alignment: maxWidth ? Alignment.centerLeft : Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: maxWidth ? 8 : 0,
                                ),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  // direction: maxWidth ? Axis.horizontal : Axis.vertical,
                                  children: [
                                    GetBuilder<OneTimeIncomeVisibilityController>(
                                      builder: (oneTimeIncomeVisibilityController) {
                                        return Visibility(
                                          visible: oneTimeIncomeVisibilityController.oneTimeVisibility,
                                          replacement: Padding(
                                            padding: EdgeInsets.only(right: maxWidth ? 8 : 0, bottom: maxWidth ? 13 : 0.0),
                                            child: Theme(
                                              data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                              child: ExpansionTile(
                                                collapsedBackgroundColor: Colors.white,
                                                backgroundColor: Colors.white,
                                                textColor: Colors.black,
                                                iconColor: color097EA2,
                                                tilePadding: const EdgeInsets.only(left: 15),
                                                onExpansionChanged: (value) {
                                                  if (value) {
                                                    Future.delayed(const Duration(milliseconds: 50), () {
                                                      scrollControllerOneTimeIncome.jumpTo(
                                                        scrollController.position.pixels,
                                                      );
                                                    });
                                                  } else {
                                                    Future.delayed(const Duration(milliseconds: 50), () {
                                                      scrollControllerTotalListOneTimeIncome.jumpTo(
                                                        scrollController.position.pixels,
                                                      );
                                                    });
                                                  }
                                                  oneTimeIncomeExpansion = value.obs;
                                                  oneTimeIncomeExpansion.refresh();
                                                  oneTimeIncomeExpansionValue.changeExpansionValue();
                                                },
                                                trailing: GetBuilder<OneTimeIncomeExpansionChange>(
                                                  builder: (controller) {
                                                    return maxWidth && controller.oneTimeIncomeExpansionValue == false
                                                        ? Padding(
                                                            padding: const EdgeInsets.only(right: 25),
                                                            child: SizedBox(
                                                              width: Get.width / 2.1,
                                                              child: StreamBuilder(
                                                                stream: TotalIncomeExpenseController.to.totalOneTimeIncomeList.stream,
                                                                builder: (context, snapshot) {
                                                                  return totalListScrollAbleWidget(
                                                                      itemCount: TotalIncomeExpenseController.to.totalOneTimeIncomeList.length,
                                                                      scrollController: scrollControllerTotalListOneTimeIncome,
                                                                      totalIncomeExpenseList: TotalIncomeExpenseController.to.totalOneTimeIncomeList);
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        // SizedBox(
                                                        //         width: Get.width / 2.07,
                                                        //         child:
                                                        //             pageViewCommonWidget(pageController: _singleMonthlyPageController, text: incomes, itemCount: incomes.length, onPageChanged: (value) {}),
                                                        //       )
                                                        : Column();
                                                  },
                                                ),
                                                title: oneTimeIncomeEditModeRow(constraints: constraints),
                                                children: [
                                                  GetBuilder<OneTimeIncomeExpansionVisibilityController>(
                                                    builder: (oneTimeIncomeController) {
                                                      return Container(
                                                        padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 5),
                                                        decoration: BoxDecoration(
                                                            // color: Colors.red,
                                                            border: Border(
                                                          bottom: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                                          top: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                                        )),
                                                        child: GetBuilder<OneTimeIncomeEditModeController>(
                                                          builder: (oneTimeIncomeEditModeController) {
                                                            return Column(
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    oneTimeIncomeData(
                                                                        boolValue: oneTimeIncomeController.oneTimeIncomeVisibilityIncome,
                                                                        constraints: constraints,
                                                                        visibilityValue: oneTimeIncomeController.oneTimeIncomeVisibility),
                                                                    Expanded(
                                                                      flex: oneTimeIncomeController.oneTimeIncomeVisibilityIncome == true
                                                                          ? 2
                                                                          : constraints.maxWidth < 1000
                                                                              ? 0
                                                                              : 2,
                                                                      child: Visibility(
                                                                        visible: constraints.maxWidth < 1000 ? oneTimeIncomeController.oneTimeIncomeVisibilityIncome : true,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                            top: maxWidth ? 25 : Get.height * 0.01,
                                                                            left: constraints.maxWidth > 1000 ? 8.0 : 10.0,
                                                                            // bottom: maxWidth
                                                                            //     ? showOneTimeIncomeSaveTextController.oneTimeIncomeShowTextWeb == false
                                                                            //         ? 62
                                                                            //         : showOneTimeIncomeSaveTextController.oneTimeIncomeShowTextWeb == true &&
                                                                            //                 oneTimeIncomeEditModeController.oneTimeIncomeEditMode == false
                                                                            //             ? Get.height * 0.04
                                                                            //             : Get.height * 0.01
                                                                            //     : 0.0,
                                                                          ),
                                                                          child: StreamBuilder(
                                                                              stream: oneTimeIncomeEditModeController.oneTimeIncomeEditMode
                                                                                  ? GetIncomeController.to.tempOneTimeIncomeList?.stream
                                                                                  : GetIncomeController.to.oneTimeIncomeList?.stream,
                                                                              builder: (context, snapshot) {
                                                                                return SingleChildScrollView(
                                                                                  controller: scrollControllerOneTimeIncome,
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  physics: const ClampingScrollPhysics(),
                                                                                  child: StreamBuilder(
                                                                                      stream: TotalIncomeExpenseController.to.datesList.stream,
                                                                                      builder: (context, snapshot) {
                                                                                        return Column(
                                                                                            children: List.generate(
                                                                                          oneTimeIncomeEditModeController.oneTimeIncomeEditMode
                                                                                              ? GetIncomeController.to.tempOneTimeIncomeList!.length
                                                                                              : GetIncomeController.to.oneTimeIncomeList!.length,
                                                                                          (index) => SizedBox(
                                                                                            height: oneTimeIncomeEditModeController.oneTimeIncomeEditMode
                                                                                                ? Get.height * 0.059
                                                                                                : maxWidth
                                                                                                    ? Get.height * 0.035
                                                                                                    : Get.height * 0.032,
                                                                                            child: ListView.builder(
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: TotalIncomeExpenseController.to.datesList.length,
                                                                                              itemBuilder: (context, dateIndex) {
                                                                                                int dateFormattedInt = int.parse(formatter
                                                                                                    .format(DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[dateIndex]))
                                                                                                    .toString()
                                                                                                    .replaceRange(0, 4, ''));
                                                                                                return SizedBox(
                                                                                                    width: constraints.maxWidth > 1000 ? Get.width * 0.067 : Get.width * 0.15,
                                                                                                    child: Text(
                                                                                                      // formatter
                                                                                                      //     .format(
                                                                                                      //     DateTime.parse(GetIncomeController.to.oneTimeIncomeList![index].date.toString()))
                                                                                                      //     .toString()
                                                                                                      //     .replaceRange(0, 4, '') ==
                                                                                                      //     TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, '')

                                                                                                      dateIndex != TotalIncomeExpenseController.to.datesList.length - 1 &&
                                                                                                                  int.parse(formatter
                                                                                                                          .format(DateTime.parse(
                                                                                                                              GetIncomeController.to.oneTimeIncomeList![index].date.toString()))
                                                                                                                          .toString()
                                                                                                                          .replaceRange(0, 4, '')) <
                                                                                                                      dateFormattedInt + 7 &&
                                                                                                                  int.parse(formatter
                                                                                                                          .format(DateTime.parse(
                                                                                                                              GetIncomeController.to.oneTimeIncomeList![index].date.toString()))
                                                                                                                          .toString()
                                                                                                                          .replaceRange(0, 4, '')) >
                                                                                                                      dateFormattedInt ||
                                                                                                              int.parse(formatter
                                                                                                                      .format(DateTime.parse(GetIncomeController.to.oneTimeIncomeList![index].date.toString()))
                                                                                                                      .toString()
                                                                                                                      .replaceRange(0, 4, '')) ==
                                                                                                                  dateFormattedInt
                                                                                                          ? '${GetIncomeController.to.oneTimeIncomeList?[index].amount}'
                                                                                                          : '-',
                                                                                                      // index == dateListIndex ? '${GetIncomeController.to.monthlyExpenseList![dateListIndex].amount}' : '-',
                                                                                                      style: greyDateTexStyle10W400,
                                                                                                      textAlign: TextAlign.center,
                                                                                                    ));
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ));
                                                                                      }),
                                                                                );
                                                                              }),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: maxWidth ? 10 : 5,
                                              right: maxWidth ? 15 : 0,
                                            ),
                                            child: MaterialButton(
                                              minWidth: maxWidth ? null : Get.width * 0.85,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                              onPressed: () {
                                                oneTimeIncomeVisibilityController.changeVisibility();
                                              },
                                              color: color097EA2,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                                                child: Text(
                                                  addOneTimeIncome,
                                                  style: whiteMontserrat11W500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    GetBuilder<OneTimeExpenseVisibilityController>(
                                      builder: (oneTimeExpenseVisibilityController) {
                                        return Visibility(
                                          visible: oneTimeExpenseVisibilityController.oneTimeExpenseVisibility,
                                          replacement: Padding(
                                            padding: EdgeInsets.only(right: maxWidth ? 8 : 0, bottom: maxWidth ? 13 : 0.0),
                                            child: Theme(
                                              data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                              child: ExpansionTile(
                                                collapsedBackgroundColor: Colors.white,
                                                backgroundColor: Colors.white,
                                                textColor: Colors.black,
                                                iconColor: color097EA2,
                                                tilePadding: const EdgeInsets.only(right: 0.0, left: 15),
                                                onExpansionChanged: (value) {
                                                  if (value) {
                                                    Future.delayed(const Duration(milliseconds: 50), () {
                                                      scrollControllerOneTimeExpense.jumpTo(
                                                        scrollController.position.pixels,
                                                      );
                                                    });
                                                  } else {
                                                    Future.delayed(const Duration(milliseconds: 50), () {
                                                      scrollControllerTotalListOneTimeExpense.jumpTo(
                                                        scrollController.position.pixels,
                                                      );
                                                    });
                                                  }
                                                  oneTimeExpenseExpansion = value.obs;
                                                  oneTimeExpenseExpansion.refresh();
                                                  oneTimeExpenseExpansionValue.changeExpansionValue();
                                                },
                                                trailing: GetBuilder<OneTimeExpenseExpansionChange>(
                                                  builder: (controller) {
                                                    return maxWidth && controller.oneTimeExpenseExpansionValue == false
                                                        ? Padding(
                                                            padding: const EdgeInsets.only(right: 25),
                                                            child: SizedBox(
                                                              width: Get.width / 2.1,
                                                              child: StreamBuilder(
                                                                stream: TotalIncomeExpenseController.to.totalWeeklyBudgetList.stream,
                                                                builder: (context, snapshot) {
                                                                  return totalListScrollAbleWidget(
                                                                      itemCount: TotalIncomeExpenseController.to.totalOneTimeExpenseList.length,
                                                                      scrollController: scrollControllerTotalListOneTimeExpense,
                                                                      totalIncomeExpenseList: TotalIncomeExpenseController.to.totalOneTimeExpenseList);
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        : Column();
                                                  },
                                                ),
                                                title: oneTimeExpenseEditModeRow(constraints: constraints),
                                                children: [
                                                  GetBuilder<OneTimeExpenseExpansionVisibilityController>(
                                                    builder: (oneTimeExpenseController) {
                                                      return Container(
                                                        padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 5),
                                                        decoration: BoxDecoration(
                                                            // color: Colors.red,
                                                            border: Border(
                                                          bottom: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                                          top: maxWidth ? BorderSide.none : const BorderSide(color: colorEDEDED),
                                                        )),
                                                        child: GetBuilder<OneTimeExpenseEditModeController>(
                                                          builder: (oneTimeExpenseEditModeController) {
                                                            return Column(
                                                              children: [
                                                                oneTimeExpenseController.oneTimeExpenseVisibility == false && oneTimeExpenseController.oneTimeExpenseVisibilityIncome == true
                                                                    ? Column()
                                                                    : Table(
                                                                        columnWidths: <int, TableColumnWidth>{
                                                                          0: FlexColumnWidth(oneTimeExpenseEditModeController.oneTimeExpenseEditMode == true ? 2.7 : 3.6),
                                                                          1: FlexColumnWidth(oneTimeExpenseEditModeController.oneTimeExpenseEditMode == true ? 2.3 : 3.1),
                                                                          2: FlexColumnWidth(oneTimeExpenseEditModeController.oneTimeExpenseEditMode == true ? 1.6 : 1.1),
                                                                        },
                                                                        children: [
                                                                          TableRow(children: [
                                                                            Text(
                                                                              incomeName,
                                                                              style: columnNameListStyle,
                                                                            ),
                                                                            Text(
                                                                              date,
                                                                              style: columnNameListStyle,
                                                                            ),
                                                                            Text(
                                                                              amount,
                                                                              style: columnNameListStyle,
                                                                            ),
                                                                          ]),
                                                                        ],
                                                                      ),
                                                                Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    oneTimeExpenseData(
                                                                        boolValue: oneTimeExpenseController.oneTimeExpenseVisibilityIncome,
                                                                        constraints: constraints,
                                                                        visibilityValue: oneTimeExpenseController.oneTimeExpenseVisibility),
                                                                    Expanded(
                                                                      flex: oneTimeExpenseController.oneTimeExpenseVisibilityIncome == true
                                                                          ? 2
                                                                          : constraints.maxWidth < 1000
                                                                              ? 0
                                                                              : 2,
                                                                      child: Visibility(
                                                                        visible: constraints.maxWidth < 1000 ? oneTimeExpenseController.oneTimeExpenseVisibilityIncome : true,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                            left: constraints.maxWidth > 1000 ? 8.0 : 10.0,
                                                                            // bottom: maxWidth
                                                                            //     ? showOneTimeExpenseSaveTextController.oneTimeExpenseShowTextWeb == false
                                                                            //         ? 62
                                                                            //         : showOneTimeExpenseSaveTextController.oneTimeExpenseShowTextWeb == true &&
                                                                            //                 oneTimeExpenseEditModeController.oneTimeExpenseEditMode == false
                                                                            //             ? Get.height * 0.04
                                                                            //             : Get.height * 0.01
                                                                            //     : 0.0,
                                                                            top: maxWidth ? 25 : Get.height * 0.01,
                                                                          ),
                                                                          child: StreamBuilder(
                                                                              stream: oneTimeExpenseEditModeController.oneTimeExpenseEditMode
                                                                                  ? GetIncomeController.to.tempOneTimeExpenseList?.stream
                                                                                  : GetIncomeController.to.oneTimeExpenseList?.stream,
                                                                              builder: (context, snapshot) {
                                                                                return SingleChildScrollView(
                                                                                  controller: scrollControllerOneTimeExpense,
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  physics: const ClampingScrollPhysics(),
                                                                                  child: StreamBuilder(
                                                                                      stream: TotalIncomeExpenseController.to.datesList.stream,
                                                                                      builder: (context, snapshot) {
                                                                                        return Column(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: List.generate(
                                                                                              oneTimeExpenseEditModeController.oneTimeExpenseEditMode
                                                                                                  ? GetIncomeController.to.tempOneTimeExpenseList!.length
                                                                                                  : GetIncomeController.to.oneTimeExpenseList!.length,
                                                                                              (index) => SizedBox(
                                                                                                height: oneTimeExpenseEditModeController.oneTimeExpenseEditMode
                                                                                                    ? Get.height * 0.059
                                                                                                    : maxWidth
                                                                                                        ? Get.height * 0.035
                                                                                                        : Get.height * 0.032,
                                                                                                child: ListView.builder(
                                                                                                  shrinkWrap: true,
                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                  itemCount: TotalIncomeExpenseController.to.datesList.length,
                                                                                                  itemBuilder: (context, dateIndex) {
                                                                                                    int dateFormattedInt = int.parse(formatter
                                                                                                        .format(DateFormat("yyyy-MM-dd").parse(TotalIncomeExpenseController.to.datesList[dateIndex]))
                                                                                                        .toString()
                                                                                                        .replaceRange(0, 4, ''));
                                                                                                    return SizedBox(
                                                                                                        width: constraints.maxWidth > 1000 ? Get.width * 0.067 : Get.width * 0.15,
                                                                                                        child: Text(
                                                                                                          // dateIndex != TotalIncomeExpenseController.to.datesList.length - 1 &&
                                                                                                          //     int.parse(formatter
                                                                                                          //         .format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![index].date.toString()))
                                                                                                          //         .toString()
                                                                                                          //         .replaceRange(0, 4, '')) <
                                                                                                          //         int.parse(
                                                                                                          //             TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, '')) +
                                                                                                          //             7 &&
                                                                                                          //     int.parse(formatter
                                                                                                          //         .format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![index].date.toString()))
                                                                                                          //         .toString()
                                                                                                          //         .replaceRange(0, 4, '')) >
                                                                                                          //         int.parse(
                                                                                                          //             TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, '')) ||
                                                                                                          //     int.parse(formatter
                                                                                                          //         .format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![index].date.toString()))
                                                                                                          //         .toString()
                                                                                                          //         .replaceRange(0, 4, '')) ==
                                                                                                          //         int.parse(TotalIncomeExpenseController.to.datesList[dateIndex].toString().replaceRange(0, 4, ''))

                                                                                                          dateIndex != TotalIncomeExpenseController.to.datesList.length - 1 &&
                                                                                                                      int.parse(formatter
                                                                                                                              .format(DateTime.parse(
                                                                                                                                  GetIncomeController.to.oneTimeExpenseList![index].date.toString()))
                                                                                                                              .toString()
                                                                                                                              .replaceRange(0, 4, '')) <
                                                                                                                          dateFormattedInt + 7 &&
                                                                                                                      int.parse(formatter
                                                                                                                              .format(DateTime.parse(
                                                                                                                                  GetIncomeController.to.oneTimeExpenseList![index].date.toString()))
                                                                                                                              .toString()
                                                                                                                              .replaceRange(0, 4, '')) >
                                                                                                                          dateFormattedInt ||
                                                                                                                  int.parse(formatter
                                                                                                                          .format(DateTime.parse(GetIncomeController.to.oneTimeExpenseList![index].date.toString()))
                                                                                                                          .toString()
                                                                                                                          .replaceRange(0, 4, '')) ==
                                                                                                                      dateFormattedInt
                                                                                                              ? '${GetIncomeController.to.oneTimeExpenseList?[index].amount}'
                                                                                                              : '-',
                                                                                                          style: greyDateTexStyle10W400,
                                                                                                          textAlign: TextAlign.center,
                                                                                                        ));
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ));
                                                                                      }),
                                                                                );
                                                                              }),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 15.0),
                                            child: MaterialButton(
                                              minWidth: maxWidth ? null : Get.width * 0.85,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                              onPressed: () {
                                                oneTimeExpenseVisibilityController.changeVisibility();
                                              },
                                              color: color097EA2,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                                                child: Text(
                                                  addOneTimeExpense,
                                                  style: whiteMontserrat11W500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            maxWidth
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            height: Get.height * 0.05,
                                            alignment: Alignment.centerLeft,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                    right: BorderSide(color: colorEDEDED),
                                                    bottom: BorderSide(
                                                      color: colorEDEDED,
                                                    ))),
                                            child: Text(
                                              previousWeekBalance,
                                              style: blackMontserrat12W600,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: Get.height * 0.05,
                                            alignment: Alignment.centerRight,
                                            decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: colorEDEDED))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 25),
                                              child: SizedBox(
                                                height: Get.height * 0.018,
                                                width: Get.width / 2.1,
                                                child: StreamBuilder(
                                                  stream: TotalIncomeExpenseController.to.totalPreviousWeekBalanceList.stream,
                                                  builder: (context, snapshot) {
                                                    return totalListScrollAbleWidget(
                                                        itemCount: TotalIncomeExpenseController.to.totalPreviousWeekBalanceList.length,
                                                        scrollController: scrollControllerPreviousWeekBalance,
                                                        totalIncomeExpenseList: TotalIncomeExpenseController.to.totalPreviousWeekBalanceList);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          previousWeekBalance,
                                          style: blackMontserrat12W600,
                                        ),
                                      ),
                                      const Divider(
                                        height: 10,
                                        color: colorEDEDED,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          width: Get.width / 2.05,
                                          height: Get.height * 0.02,
                                          child: Align(
                                            alignment: const FractionalOffset(0.5, 0.5),
                                            child: StreamBuilder(
                                              stream: TotalIncomeExpenseController.to.totalPreviousWeekBalanceList.stream,
                                              builder: (context, snapshot) {
                                                return totalListScrollAbleWidget(
                                                    textWidth: Get.width * 0.15,
                                                    itemCount: TotalIncomeExpenseController.to.totalPreviousWeekBalanceList.length,
                                                    scrollController: scrollControllerPreviousWeekBalance,
                                                    totalIncomeExpenseList: TotalIncomeExpenseController.to.totalPreviousWeekBalanceList);
                                              },
                                            ),
                                            // child: countForCashPageViewBuilderWidget(
                                            //     pageController: _previousWeekBalancePageController,
                                            //     onPageChanged: (value) {
                                            //     }),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      const Divider(
                                        height: 10,
                                        color: colorEDEDED,
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              height: maxWidth ? 0.0 : Get.height * 0.01,
                            ),
                            maxWidth
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            height: Get.height * 0.05,
                                            alignment: Alignment.centerLeft,
                                            decoration: const BoxDecoration(color: Colors.white, border: Border(right: BorderSide(color: colorEDEDED), bottom: BorderSide(color: colorEDEDED))),
                                            child: Text(
                                              totalWeeklyIncome,
                                              style: blackMontserrat12W600,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: Get.height * 0.05,
                                            alignment: Alignment.centerRight,
                                            decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: colorEDEDED))),
                                            child: SizedBox(
                                              // width: Get.width / 2.05,
                                              height: Get.height * 0.018,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 25),
                                                child: SizedBox(
                                                  height: Get.height * 0.018,
                                                  width: Get.width / 2.1,
                                                  child: StreamBuilder(
                                                    stream: TotalIncomeExpenseController.to.totalWeeklyIncomeList.stream,
                                                    builder: (context, snapshot) {
                                                      return totalListScrollAbleWidget(
                                                          itemCount: TotalIncomeExpenseController.to.totalWeeklyIncomeList.length,
                                                          scrollController: scrollControllerTotalWeeklyIncome,
                                                          totalIncomeExpenseList: TotalIncomeExpenseController.to.totalWeeklyIncomeList);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Wrap(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          totalWeeklyIncome,
                                          style: blackMontserrat12W600,
                                        ),
                                      ),
                                      const Divider(
                                        height: 10,
                                        color: colorEDEDED,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          width: Get.width / 2.05,
                                          height: Get.height * 0.02,
                                          child: Align(
                                            alignment: const FractionalOffset(0.5, 0.5),
                                            child: StreamBuilder(
                                              stream: TotalIncomeExpenseController.to.totalWeeklyIncomeList.stream,
                                              builder: (context, snapshot) {
                                                return totalListScrollAbleWidget(
                                                    textWidth: Get.width * 0.15,
                                                    itemCount: TotalIncomeExpenseController.to.totalWeeklyIncomeList.length,
                                                    scrollController: scrollControllerTotalWeeklyIncome,
                                                    totalIncomeExpenseList: TotalIncomeExpenseController.to.totalWeeklyIncomeList);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      const Divider(
                                        height: 10,
                                        color: colorEDEDED,
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              height: maxWidth ? 0.0 : Get.height * 0.01,
                            ),
                            maxWidth
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            height: Get.height * 0.05,
                                            alignment: Alignment.centerLeft,
                                            decoration:
                                                const BoxDecoration(color: Colors.white, border: Border(right: BorderSide(color: colorEDEDED), bottom: BorderSide(color: colorEDEDED, width: 2))),
                                            child: Text(
                                              totalWeeklyExpense,
                                              style: blackMontserrat12W600,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: Get.height * 0.05,
                                            alignment: Alignment.centerRight,
                                            decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: colorEDEDED))),
                                            child: SizedBox(
                                              // width: Get.width / 2.05,
                                              height: Get.height * 0.018,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 25),
                                                child: SizedBox(
                                                  height: Get.height * 0.018,
                                                  width: Get.width / 2.1,
                                                  child: StreamBuilder(
                                                    stream: TotalIncomeExpenseController.to.totalWeeklyBudgetList.stream,
                                                    builder: (context, snapshot) {
                                                      return totalListScrollAbleWidget(
                                                          itemCount: TotalIncomeExpenseController.to.totalWeeklyBudgetList.length,
                                                          scrollController: scrollControllerTotalWeeklyExpense,
                                                          totalIncomeExpenseList: TotalIncomeExpenseController.to.totalWeeklyBudgetList);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          totalWeeklyExpense,
                                          style: blackMontserrat12W600,
                                        ),
                                      ),
                                      const Divider(
                                        height: 10,
                                        color: colorEDEDED,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          width: Get.width / 2.05,
                                          height: Get.height * 0.02,
                                          child: Align(
                                            alignment: const FractionalOffset(0.5, 0.5),
                                            child: StreamBuilder(
                                              stream: TotalIncomeExpenseController.to.totalWeeklyBudgetList.stream,
                                              builder: (context, snapshot) {
                                                return totalListScrollAbleWidget(
                                                    textWidth: Get.width * 0.15,
                                                    itemCount: TotalIncomeExpenseController.to.totalWeeklyBudgetList.length,
                                                    scrollController: scrollControllerTotalWeeklyExpense,
                                                    totalIncomeExpenseList: TotalIncomeExpenseController.to.totalWeeklyBudgetList);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      const Divider(
                                        height: 10,
                                        color: colorEDEDED,
                                      ),
                                    ],
                                  ),
                            GetBuilder<SwitchController>(
                              builder: (controller) {
                                return controller.switchValue == true && constraints.maxWidth < 1000
                                    ? Align(
                                        alignment: const FractionalOffset(0.5, 0.0),
                                        child: _saveChangesButton(constraints: constraints),
                                      )
                                    : Container();
                              },
                            )
                          ],
                        ),
                      ),
                      maxWidth
                          ? Container()
                          : Positioned(
                              right: 0,
                              left: 0,
                              child: GestureDetector(
                                onTap: () {
                                  visibilityController.changeDashBoardVisibility();
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  child: const Icon(
                                    Icons.arrow_upward_sharp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: maxWidth
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          height: Get.height * 0.07,
                          color: Colors.white,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            endOfTheWeekBalance,
                            style: blueMontserrat12W600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: Get.height * 0.07,
                          alignment: Alignment.centerRight,
                          color: Colors.white,
                          child: SizedBox(
                            // width: Get.width / 2.05,
                            height: Get.height * 0.018,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: SizedBox(
                                height: Get.height * 0.018,
                                width: Get.width / 2.1,
                                child: StreamBuilder(
                                  stream: TotalIncomeExpenseController.to.totalEndOfTheWeekBalanceList.stream,
                                  builder: (context, snapshot) {
                                    return totalListScrollAbleWidget(
                                        itemCount: TotalIncomeExpenseController.to.totalEndOfTheWeekBalanceList.length,
                                        scrollController: scrollControllerEndOfTheWeekBalance,
                                        totalIncomeExpenseList: TotalIncomeExpenseController.to.totalEndOfTheWeekBalanceList);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Wrap(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Text(
                          endOfTheWeekBalance,
                          style: blueMontserrat12W600,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: Get.width / 2.05,
                          height: Get.height * 0.04,
                          child: Align(
                            alignment: const FractionalOffset(0.5, 0.5),
                            child: StreamBuilder(
                              stream: TotalIncomeExpenseController.to.totalEndOfTheWeekBalanceList.stream,
                              builder: (context, snapshot) {
                                return totalListScrollAbleWidget(
                                    textWidth: Get.width * 0.15,
                                    itemCount: TotalIncomeExpenseController.to.totalEndOfTheWeekBalanceList.length,
                                    scrollController: scrollControllerEndOfTheWeekBalance,
                                    totalIncomeExpenseList: TotalIncomeExpenseController.to.totalEndOfTheWeekBalanceList);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  calculateFutureDates() {
    DateTime today = DateTime.now();
    DateTime? returnedDate;
    for (int i = 0; i < 15; i++) {
      returnedDate = TotalIncomeExpenseController.to.findFirstDateOfTheWeek(i == 0
          ? selectedResetWeekDay != null
              ? selectedResetWeekDay!
              : today
          : returnedDate!.add(const Duration(days: 7)));
      // returnedDate = TotalIncomeExpenseController.to.findFirstDateOfTheWeek(i == 0 ? today : returnedDate!.add(const Duration(days: 7)));
      // print(returnedDate);
      // final lastDateOfTheWeek = TotalIncomeExpenseController.to.findFirstDateOfTheWeek(i == 0 ? DateTime.now().subtract(const Duration(days: 7)) : returnedDate.subtract(const Duration(days: 7)));
      // final date = formatter.format(returnedDate);
      // final date2 = formatter.format(_currentDate.add(Duration(days: i)));
      TotalIncomeExpenseController.to.datesList.add(DateFormat("yyyy-MM-dd").parse(returnedDate.toString()).toString());
    }
  }

  Future<dynamic>? calculatePastDates() {
    DateTime? startDate;
    for (int i = 0; i < 15; i++) {
      startDate = TotalIncomeExpenseController.to.findFirstDateOfTheWeek(i == 0
          ? selectedResetWeekDay != null
              ? selectedResetWeekDay!.subtract(const Duration(days: 7))
              : DateTime.now().subtract(const Duration(days: 7))
          : startDate!.subtract(const Duration(days: 7)));
      // startDate = TotalIncomeExpenseController.to.findFirstDateOfTheWeek(i == 0 ? DateTime.now().subtract(const Duration(days: 7)) : startDate!.subtract(const Duration(days: 7)));
      print(startDate);
      // final DateTime startDate = _currentDate.subtract(Duration(days: i + 1));
      final String start = formatter.format(startDate);
      final String dayFormate = DateFormat('EEEE').format(startDate);
      // print('DayFormate$dayFormate');
      final DateTime endDate = _currentDate.subtract(Duration(days: i));

      final String end = formatter.format(endDate);
      TotalIncomeExpenseController.to.datesList.insert(0, DateFormat("yyyy-MM-dd").parse(startDate.toString()).toString());

      final String apiUrl = 'https://api?start=$start&end=$end';
      print('====$apiUrl');
    }
  }

  _saveChangesButton({BoxConstraints? constraints}) {
    return commonButton(
      textStyle: whiteMontserrat11W500,
      height: 50,
      width: constraints!.maxWidth > 1000 ? Get.width * 0.13 : Get.width * 0.85,
      text: saveChanges,
      bgColor: color097EA2,
      onPress: () async {
        switchController.changeSwitchValue(value: false);
        if (monthlyIncomeEditMode.editMode == true) {
          monthlyIncomeEditMode.showEditMode();
        }
        if (weeklyIncomeEditMode.weeklyIncomeEditMode == true) {
          weeklyIncomeEditMode.showEditMode();
        }
        if (monthlyExpenseEditModeController.monthlyExpenseEditMode == true) {
          monthlyExpenseEditModeController.showEditMode();
        }
        if (weeklyBudgetEditModeController.weeklyBudgetEditMode == true) {
          weeklyBudgetEditModeController.showEditMode();
        }
        CreateIncomeController.to.createIncome(
            url: mSyncAllIncome, parameter: {rDeleteIncome: DeleteIncomeExpenseController.to.deleteMonthlyIncomeList, rUpsertIncome: GetIncomeController.to.tempMonthlyIncomeList}).whenComplete(() {
          DeleteIncomeExpenseController.to.deleteMonthlyIncomeList.clear();
          GetIncomeController.to.monthlyIncomeList?.clear();
          GetIncomeController.to.tempMonthlyIncomeList?.clear();
          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "3"});
        });
        CreateIncomeController.to.createIncome(
            url: mSyncAllIncome, parameter: {rDeleteIncome: DeleteIncomeExpenseController.to.deleteWeeklyIncomeList, rUpsertIncome: GetIncomeController.to.tempWeeklyIncomeList}).whenComplete(() {
          DeleteIncomeExpenseController.to.deleteWeeklyIncomeList.clear();
          GetIncomeController.to.weeklyIncomesList?.clear();
          GetIncomeController.to.tempWeeklyIncomeList?.clear();
          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "onetime_week_month": "2"});
        });
        CreateIncomeController.to.createIncome(
            url: mSyncAllIncome, parameter: {rDeleteIncome: DeleteIncomeExpenseController.to.deleteMonthlyExpenseList, rUpsertIncome: GetIncomeController.to.tempMonthlyExpenseList}).whenComplete(() {
          DeleteIncomeExpenseController.to.deleteMonthlyExpenseList.clear();
          GetIncomeController.to.monthlyExpenseList?.clear();
          GetIncomeController.to.tempMonthlyExpenseList?.clear();
          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "3"});
        });
        CreateIncomeController.to.createIncome(
            url: mSyncAllIncome, parameter: {rDeleteIncome: DeleteIncomeExpenseController.to.deleteWeeklyExpenseList, rUpsertIncome: GetIncomeController.to.tempWeeklyBudgetList}).whenComplete(() {
          DeleteIncomeExpenseController.to.deleteWeeklyExpenseList.clear();
          GetIncomeController.to.weeklyBudgetList?.clear();
          GetIncomeController.to.tempWeeklyBudgetList?.clear();
          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "onetime_week_month": "2"});
        });
      },
    );
  }

  Widget webHeaderRow({BoxConstraints? constraints}) {
    final formatedFirstDay = DateFormat('MMM dd').format(TotalIncomeExpenseController.to.findFirstDateOfTheWeek(DateTime.now()));
    final _lastDayOfTheweek = DateFormat('MMM dd').format(TotalIncomeExpenseController.to.findLastDateOfTheWeek(DateTime.now()));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(color: color12CC8E, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    endOfWeekBalance,
                    style: foreCashWeeklyBalanceStyleWeb,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    endOfTheWeekBalance,
                    style: foreCashWeeklyBalanceTextStyleWeb,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            margin: const EdgeInsets.only(left: 10, right: 10),
            // width: 250,
            decoration: BoxDecoration(color: color097EA2, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(border: Border(right: BorderSide(color: Colors.white))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        thisWeekBalance,
                        style: foreCashWeeklyBalanceStyleWeb,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        incomeThisWeek,
                        style: foreCashWeeklyBalanceTextStyleWeb,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thisWeekExpense,
                      style: foreCashWeeklyBalanceStyleWeb,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      expenseThisWeek,
                      style: foreCashWeeklyBalanceTextStyleWeb,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentWeek,
                style: currentWeekTextStyle,
              ),
              Text(
                '$formatedFirstDay-$_lastDayOfTheweek',
                style: currentWeekDateTextStyle,
              )
            ],
          ),
          const Spacer(),
          GetBuilder<SwitchController>(
            builder: (controller) {
              return Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.01),
                    child: Visibility(visible: controller.switchValue, child: _saveChangesButton(constraints: constraints)),
                  ),
                  Text(
                    controller.switchValue == true ? simulateModeOn : simulateModeOff,
                    style: switchController.switchValue ? simulateModeOnTextStyle : simulateModeOffTextStyle,
                  ),
                  _simulateModeSwitch(constraints: constraints)
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget mobileHeaderColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: Get.height * 0.019),
            width: double.infinity,
            decoration: BoxDecoration(color: color12CC8E, borderRadius: BorderRadius.circular(7)),
            child: Row(
              children: [
                Text(
                  foreCashWeeklyBalance,
                  style: foreCashWeeklyBalanceTextStyle,
                ),
                SvgPicture.asset(
                  informationSvg,
                  height: 17.sp,
                  width: 17.sp,
                  color: Colors.white,
                ),
                const Spacer(),
                Text(
                  endOfWeekBalance,
                  style: foreCashWeeklyBalanceStyle,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.005,
        ),
        GetBuilder<DashBoardVisibilityController>(
          builder: (controller) {
            return Visibility(
              visible: controller.visibility,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: Get.height * 0.01),
                    margin: const EdgeInsets.only(left: 10, right: 7),
                    // height: Get.height * 0.07,
                    decoration: BoxDecoration(color: color097EA2, borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          thisWeekBalance,
                          style: foreCashWeeklyBalanceStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          incomeThisWeek,
                          style: incomeExpenseTExtStyle,
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    // height: Get.height * 0.07,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: Get.height * 0.01),
                    decoration: BoxDecoration(color: color097EA2, borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          thisWeekExpense,
                          style: foreCashWeeklyBalanceStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          expenseThisWeek,
                          style: incomeExpenseTExtStyle,
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    height: controller.visibility ? Get.height * 0.09 : Get.height * 0.0,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  _mobileSimulateModeRow({BoxConstraints? constraints}) {
    final formatedFirstDay = DateFormat('MMM dd').format(TotalIncomeExpenseController.to.findFirstDateOfTheWeek(DateTime.now()));
    final _lastDayOfTheweek = DateFormat('MMM dd').format(TotalIncomeExpenseController.to.findLastDateOfTheWeek(DateTime.now()));
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  currentWeek,
                  style: currentWeekTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '$formatedFirstDay-$_lastDayOfTheweek',
                  style: currentWeekDateTextStyle,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        GetBuilder<SwitchController>(
          builder: (controller) {
            return Row(
              children: [
                Text(controller.switchValue == true ? simulateModeOn : simulateModeOff, style: switchController.switchValue ? simulateModeOnTextStyle : simulateModeOffTextStyle),
                _simulateModeSwitch(constraints: constraints)
              ],
            );
          },
        )
      ],
    );
  }

  _simulateModeSwitch({BoxConstraints? constraints}) {
    return Switch(
      activeColor: commonButtonColor,
      activeTrackColor: Colors.grey.withOpacity(0.3),
      inactiveThumbColor: color777C90,
      inactiveTrackColor: Colors.grey.withOpacity(0.3),
      value: switchController.switchValue,
      onChanged: (bool value) {
        if (value) {
          Get.showSnackbar(const GetSnackBar(
            snackStyle: SnackStyle.GROUNDED,
            message: 'Simulation Mode is on',
            snackPosition: SnackPosition.TOP,
            backgroundColor: color12CC8E,
            duration: Duration(milliseconds: 1600),
          ));
        }
        switchController.changeSwitchValue(value: value);
        if (value) {
          if (constraints!.maxWidth < 1000) {
            if (monthlyIncomeEditMode.circleAvatarVisibility == true) {
              monthlyIncomeEditMode.showEditMode();
            }
            if (weeklyIncomeEditMode.weeklyCircleAvatarVisibility == true) {
              weeklyIncomeEditMode.showEditMode();
            }
            if (monthlyExpenseEditModeController.monthlyExpenseCircleAvatarVisibility == true) {
              monthlyExpenseEditModeController.showEditMode();
            }
            if (weeklyBudgetEditModeController.weeklyBudgetCircleAvatarVisibility == true) {
              weeklyBudgetEditModeController.showEditMode();
            }
            if (monthlyIncomeVisibilityController.visibilityIncome == true) {
              monthlyIncomeVisibilityController.changeVisibility();
            }
            if (weeklyIncomeDataVisibilityController.incomeListVisibility == true) {
              weeklyIncomeDataVisibilityController.changeVisibility();
            }
            if (monthlyExpenseDataVisibilityController.monthlyExpenseListVisibility == true) {
              monthlyExpenseDataVisibilityController.changeVisibility();
            }
            if (weeklyBudgetVisibilityController.weeklyBudgetVisibilityIncome == true) {
              weeklyBudgetVisibilityController.changeVisibility();
            }
          } else {
            if (monthlyIncomeEditMode.editMode == false) {
              monthlyIncomeEditMode.showEditMode();
            }
            if (weeklyIncomeEditMode.weeklyIncomeEditMode == false) {
              weeklyIncomeEditMode.showEditMode();
            }
            if (monthlyExpenseEditModeController.monthlyExpenseEditMode == false) {
              monthlyExpenseEditModeController.showEditMode();
            }
            if (weeklyBudgetEditModeController.weeklyBudgetEditMode == false) {
              weeklyBudgetEditModeController.showEditMode();
            }
          }
        } else if (value == false) {
          // Future.delayed(const Duration(milliseconds: 1), () {
          if (monthlyIncomeEditMode.editMode == true) {
            monthlyIncomeEditMode.showEditMode();
          }
          if (weeklyIncomeEditMode.weeklyIncomeEditMode == true) {
            weeklyIncomeEditMode.showEditMode();
          }
          if (monthlyExpenseEditModeController.monthlyExpenseEditMode == true) {
            monthlyExpenseEditModeController.showEditMode();
          }
          if (weeklyBudgetEditModeController.weeklyBudgetEditMode == true) {
            weeklyBudgetEditModeController.showEditMode();
          }
          // });
        }
      },
    );
  }

  // Future<void> _selectDate({
  //   BuildContext? context,
  // }) async {
  //   final pickedDate = await showDatePicker(context: context!, initialDate: currentDate.value, firstDate: DateTime(2015), lastDate: DateTime(2050));
  //   if (pickedDate != null && pickedDate != currentDate) {
  //     currentDate.value = pickedDate;
  //     // print(currentDate);
  //     currentDate.refresh();
  //   }
  // }

}
