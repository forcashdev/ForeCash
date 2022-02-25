import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:fore_cash/common_widget/common_add_data_textfield.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_income_scrollable_widget.dart';
import 'package:fore_cash/common_widget/common_input_formatter.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/common_widget/page_view_common_widget.dart';
import 'package:fore_cash/controller/create_income_controller.dart';
import 'package:fore_cash/controller/get_income_controller.dart';
import 'package:fore_cash/getx/add_monthly_expense_showtext_controller.dart';
import 'package:fore_cash/getx/add_monthly_income_controller.dart';
import 'package:fore_cash/getx/add_onetime_expense_showtext_controller.dart';
import 'package:fore_cash/getx/add_onetime_income_showtext_controller.dart';
import 'package:fore_cash/getx/add_weekly_budget_showtext_controller.dart';
import 'package:fore_cash/getx/add_weekly_income_showtext_controller.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/dashboard_container_visibility.dart';
import 'package:fore_cash/getx/monthly_expansion_visibility_controller.dart';
import 'package:fore_cash/getx/monthly_expense_edit_mode_controller.dart';
import 'package:fore_cash/getx/monthly_expense_expansiondata_visibility_controller.dart';
import 'package:fore_cash/getx/monthlyincome_edit_mode_controller.dart';
import 'package:fore_cash/getx/on_monthly_expense_expansion_change_controller.dart';
import 'package:fore_cash/getx/on_monthly_income_expansion_change_controller.dart';
import 'package:fore_cash/getx/on_one_time_expense_expansion_change_controller.dart';
import 'package:fore_cash/getx/on_one_time_income_expansion_change_controller.dart';
import 'package:fore_cash/getx/on_weekly_budget_expansion_change_controller.dart';
import 'package:fore_cash/getx/on_weekly_income_expansion_change_controller.dart';
import 'package:fore_cash/getx/one_time_expense_visibility_controller.dart';
import 'package:fore_cash/getx/one_time_income_visibility_controller.dart';
import 'package:fore_cash/getx/onetime_expense_edit_mode_controller.dart';
import 'package:fore_cash/getx/onetime_expense_expansion_visibility_controller.dart';
import 'package:fore_cash/getx/onetime_income_edit_mode_controller.dart';
import 'package:fore_cash/getx/onetime_income_expansion_visibility_controller.dart';
import 'package:fore_cash/getx/pageview_pageindex_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/switch_controller.dart';
import 'package:fore_cash/getx/weekly_budget_edit_mode_controller.dart';
import 'package:fore_cash/getx/weekly_budget_expansion_visibility_controller.dart';
import 'package:fore_cash/getx/weekly_income_edit_mode_controller.dart';
import 'package:fore_cash/getx/weekly_income_expansion_visibility_controller.dart';
import 'package:fore_cash/model/get_income_model.dart';
import 'package:fore_cash/model/one_time_expense_model.dart';
import 'package:fore_cash/model/one_time_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/notifications/notifications_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DateTime currentDate = DateTime.now();
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
  late ScrollController scrollController;
  late ScrollController scrollController2;
  ScrollController scrollController3 = ScrollController();
  TextEditingController _monthlyIncomeNameController = TextEditingController();
  TextEditingController _monthlyIncomeAmountController = TextEditingController();
  double scrollWidth = 60;
  RxBool monthlyIncomeExpansion = false.obs;
  @override
  void initState() {
    GetIncomeController.to.monthlyIncomeList?.clear();
    GetIncomeController.to.weeklyIncomesList?.clear();
    GetIncomeController.to.monthlyExpenseList?.clear();
    GetIncomeController.to.weeklyBudgetList?.clear();
    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "2"});
    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "1"});
    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "week_month": "2"});
    GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "week_month": "1"});
    scrollController = ScrollController();
    scrollController2 = ScrollController();
    scrollController.addListener(() {
      // if (scrollController2.position.pixels == scrollController.position.maxScrollExtent) {
      // scrollController.jumpTo(scrollWidth++);
      // scrollController2.jumpTo(scrollWidth++);
      // if (monthlyIncomeExpansion == true) {
      scrollController2.animateTo(scrollController.offset, duration: const Duration(milliseconds: 50), curve: Curves.linear);
      scrollController3.animateTo(scrollController.offset, duration: const Duration(milliseconds: 50), curve: Curves.linear);
      // }
      // scrollController;
      // scrollController.jumpTo(
      //   scrollWidth++,
      // );
    });
    // scrollController2;
    scrollController2.addListener(() {
      // Future.delayed(
      //   Duration(milliseconds: 50),
      // ).then((value) {
      //   if (scrollController.offset <= scrollController2.position.pixels) {
      //     scrollController.animateTo(scrollController2.offset, duration: const Duration(milliseconds: 300), curve: Curves.linear);
      //     // scrollController2.jumpTo(scrollWidth++);
      //     // scrollController.jumpTo(scrollController2.offset);
      //   }
      // });
      if (scrollController.offset < scrollController2.offset || scrollController.offset > scrollController2.offset) {
        scrollController.animateTo(scrollController2.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      }
      if (scrollController3.offset < scrollController2.offset || scrollController3.offset > scrollController2.offset) {
        scrollController3.animateTo(scrollController2.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      }
    });
    scrollController3.addListener(() {
      // scrollController3;
      if (scrollController.offset < scrollController3.offset || scrollController.offset > scrollController3.offset) {
        scrollController.animateTo(scrollController3.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      }
      if (scrollController3.offset < scrollController3.offset || scrollController3.offset > scrollController3.offset) {
        scrollController2.animateTo(scrollController3.offset, duration: const Duration(milliseconds: 1), curve: Curves.linear);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController2.dispose();
    scrollController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visibilityController = Get.put(DashBoardVisibilityController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        PageController _pageController = PageController(viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1);
        PageController _previousWeekBalancePageController = PageController(viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1);
        PageController _totalWeeklyIncomePageController = PageController(viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1);
        PageController _totalWeeklyExpensePageController = PageController(viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1);
        PageController _singleMonthlyPageController = PageController(viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1);
        List<PageController> monthlyIncomepageControllerList = List.generate(
            1,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        List<PageController> weeklyIncomePageControllerList = List.generate(
            4,
            // WeeklyIncomeModel.weeklyIncomeList.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        List<PageController> monthlyExpensePageControllerList = List.generate(
            4,
            // MonthlyExpensesModel.monthlyExpensesListOld.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        List<PageController> weeklyBudgetPageControllerList = List.generate(
            4,
            // WeeklyBudgetModel.weeklyBudgetModel.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));

        List<PageController> oneTimeIncomePageControllerList = List.generate(
            OneTimeIncomeModel.oneTimeIncomeList.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        List<PageController> oneTimeExpensePageControllerList = List.generate(
            OneTimeExpenseModel.oneTimeExpenseList.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
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
                                  color: appBarActionColor,
                                ),
                                child: Image.asset(notificationImage),
                              ),
                            ),
                            const Positioned(
                              right: 3,
                              top: 4,
                              child: CircleAvatar(
                                backgroundColor: cameraBackGroundColor,
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
                          decoration: BoxDecoration(color: appBarActionColor, borderRadius: BorderRadius.circular(25)),
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
                            decoration: BoxDecoration(color: maxWidth ? Colors.white : commonTextFieldColor, borderRadius: BorderRadius.circular(maxWidth ? 5 : 0)),
                            height: 45,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
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
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // if (scrollWidth < scrollController.position.minScrollExtent - 80) {
                                            scrollController.jumpTo(
                                              scrollController.position.pixels - scrollWidth--,
                                            );
                                            // }
                                            if (monthlyIncomeExpansion == true) {
                                              scrollController2.jumpTo(
                                                scrollController.offset,
                                              );
                                            }
                                            scrollController3.jumpTo(
                                              scrollController.offset,
                                            );
                                            // _pageController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                            //
                                            // List.generate(monthlyIncomepageControllerList.length,
                                            //     (index) => monthlyIncomepageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            // List.generate(weeklyIncomePageControllerList.length,
                                            //     (index) => weeklyIncomePageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            // List.generate(weeklyBudgetPageControllerList.length,
                                            //     (index) => weeklyBudgetPageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            // List.generate(monthlyExpensePageControllerList.length,
                                            //     (index) => monthlyExpensePageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            // List.generate(oneTimeIncomePageControllerList.length,
                                            //     (index) => oneTimeIncomePageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            // List.generate(oneTimeExpensePageControllerList.length,
                                            //     (index) => oneTimeExpensePageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            // _totalWeeklyIncomePageController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                            // _totalWeeklyExpensePageController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                            // _previousWeekBalancePageController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios, color: Colors.black, size: 12.sp,
                                            // size: 20,
                                          ),
                                        ),
                                        Flexible(child: GetBuilder<PageViewPageIndex>(
                                          builder: (controller) {
                                            return SizedBox(
                                              height: Get.height * 0.03,
                                              child: SingleChildScrollView(
                                                controller: scrollController,
                                                scrollDirection: Axis.horizontal,
                                                child: ListView(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  // controller: scrollController,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  children: List.generate(
                                                      dataDateList.length,
                                                      (index) => SizedBox(
                                                            width: 60,
                                                            child: Text(
                                                              dataDateList[index],
                                                              style: greyDateTexStyle10W400,
                                                              textAlign: TextAlign.end,
                                                            ),
                                                          )),
                                                ),
                                              ),
                                              // child: PageView.builder(
                                              //   itemCount: dataDateList.length,
                                              //   scrollDirection: Axis.horizontal,
                                              //   controller: _pageController,
                                              //   itemBuilder: (context, index) {
                                              //     return Align(
                                              //       alignment: const FractionalOffset(0.3, 0.5),
                                              //       child: Text(
                                              //         dataDateList[index],
                                              //         style: greyDateTexStyle10W400,
                                              //         textAlign: TextAlign.end,
                                              //       ),
                                              //     );
                                              //   },
                                              //   onPageChanged: (value) {
                                              //     if (monthlyIncomeExpansion == true) {
                                              //       List.generate(monthlyIncomepageControllerList.length, (index) => monthlyIncomepageControllerList[index].jumpToPage(value));
                                              //     }
                                              //     List.generate(weeklyIncomePageControllerList.length, (index) => weeklyIncomePageControllerList[index].jumpToPage(value));
                                              //     List.generate(weeklyBudgetPageControllerList.length, (index) => weeklyBudgetPageControllerList[index].jumpToPage(value));
                                              //     List.generate(oneTimeIncomePageControllerList.length, (index) => oneTimeIncomePageControllerList[index].jumpToPage(value));
                                              //     List.generate(oneTimeExpensePageControllerList.length, (index) => oneTimeExpensePageControllerList[index].jumpToPage(value));
                                              //     List.generate(monthlyExpensePageControllerList.length,
                                              //         (index) => monthlyExpensePageControllerList[index].jumpToPage(value)); // _pageController2.jumpToPage(value);
                                              //     _previousWeekBalancePageController.jumpToPage(value);
                                              //     _totalWeeklyExpensePageController.jumpToPage(value);
                                              //     _totalWeeklyIncomePageController.jumpToPage(value);
                                              //
                                              //     // print(value);
                                              //   },
                                              // ),
                                            );
                                          },
                                        )),
                                        InkWell(
                                          onTap: () {
                                            print(scrollController.position);
                                            // if (scrollController.position.hasPixels == scrollController.position.minScrollExtent) {
                                            scrollController.jumpTo(
                                              scrollController.position.pixels + scrollWidth++,
                                            );

                                            if (monthlyIncomeExpansion == true) {
                                              scrollController2.jumpTo(
                                                scrollController.offset,
                                              );
                                            }
                                            scrollController3.jumpTo(
                                              scrollController.offset,
                                            );
                                          },
                                          // print('>>>>>>>>>>${_pageController.position}');
                                          // print(_pageController.page);
                                          //
                                          // _pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // if (monthlyIncomeExpansion == true) {
                                          //   // _pageController2.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          //   List.generate(monthlyIncomepageControllerList.length,
                                          //       (index) => monthlyIncomepageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                          // }
                                          // List.generate(weeklyIncomePageControllerList.length,
                                          //     (index) => weeklyIncomePageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                          // List.generate(monthlyExpensePageControllerList.length,
                                          //     (index) => monthlyExpensePageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                          // List.generate(weeklyBudgetPageControllerList.length,
                                          //     (index) => weeklyBudgetPageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                          // List.generate(oneTimeExpensePageControllerList.length,
                                          //     (index) => oneTimeExpensePageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                          // List.generate(oneTimeIncomePageControllerList.length,
                                          //     (index) => oneTimeIncomePageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                          // _previousWeekBalancePageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // _totalWeeklyExpensePageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // _totalWeeklyIncomePageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // _singleMonthlyPageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);

                                          // }
                                          // },
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 12.sp, color: Colors.black,
                                            // size: 20,
                                          ),
                                        ),
                                      ],
                                    ))
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
                                  // if (scrollController2.position.pixels != scrollController.position.pixels) {
                                  //   scrollController2.addListener(() {
                                  //     scrollController2.jumpTo(scrollController.offset);
                                  //   });
                                  // }
                                  if (value) {
                                    Future.delayed(Duration(milliseconds: 50), () {
                                      scrollController2.jumpTo(
                                        scrollController.position.pixels,
                                      );
                                    });
                                  }
                                  // scrollController2.reactive;
                                  monthlyIncomeExpansion = value.obs;
                                  monthlyIncomeExpansion.refresh();
                                  // if (value == true) {
                                  // List.generate(monthlyIncomepageControllerList.length, (index) {
                                  //   monthlyIncomepageControllerList[index].animateToPage(int.parse(_pageController.page?.toDouble()), duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                  // }); // curve: Curves.easeInOut);
                                  // }
                                  print(value);
                                  monthlyIncomeExpansionValue.changeExpansionValue();
                                },
                                collapsedBackgroundColor: Colors.white,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                iconColor: containerColor,
                                collapsedIconColor: containerColor,
                                trailing: GetBuilder<MonthlyIncomeExpansionChange>(
                                  builder: (controller) {
                                    return maxWidth && controller.expansionValue == false
                                        ? SizedBox(
                                            width: Get.width / 2.07,
                                            child: pageViewCommonWidget(pageController: _singleMonthlyPageController, text: incomes, itemCount: incomes.length, onPageChanged: (value) {}),
                                          )
                                        : Column();
                                  },
                                ),
                                tilePadding: const EdgeInsets.only(left: 15),
                                title: monthlyIncomeEditModeRow(constraints: constraints),
                                children: [
                                  GetBuilder<MonthlyIncomeVisibilityController>(
                                    builder: (monthlyIncomeController) {
                                      return Container(
                                        padding: EdgeInsets.only(left: maxWidth ? 14 : 0, right: maxWidth ? 0 : 5),
                                        decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: Border(
                                          bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                          top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                        )),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                                            bottom: maxWidth
                                                                ? controller.showTextWeb == false
                                                                    ? 62
                                                                    : controller.showTextWeb == true && MonthlyEditModeController.editMode == false
                                                                        ? Get.height * 0.042
                                                                        : 0.0
                                                                : 0.0,
                                                          ),
                                                          child: SizedBox(
                                                            // color: Colors.red, margin: EdgeInsets.only(bottom: 10),
                                                            // height: monthlyIncomeEditMode.editMode == true && maxWidth
                                                            //     ? Get.height * 0.041
                                                            //     : maxWidth
                                                            //         ? Get.height * 0.019
                                                            //         : Get.height * 0.018,
                                                            // height: Get.height * 0.5,
                                                            // width: double.infinity,
                                                            child: SingleChildScrollView(
                                                              controller: scrollController2,
                                                              scrollDirection: Axis.horizontal,
                                                              physics: ClampingScrollPhysics(),
                                                              child: Column(
                                                                // direction: Axis.vertical,
                                                                // mainAxisSize: MainAxisSize.min,
                                                                children: List.generate(
                                                                    5,
                                                                    (index) => Row(
                                                                          // controller: scrollController2,
                                                                          // physics: const NeverScrollableScrollPhysics(),
                                                                          // shrinkWrap: true,
                                                                          // scrollDirection: Axis.horizontal,
                                                                          children: List.generate(
                                                                              incomes.length,
                                                                              (index) => SizedBox(
                                                                                    width: 60,
                                                                                    height: monthlyIncomeEditMode.editMode == true && maxWidth
                                                                                        ? Get.height * 0.041
                                                                                        : maxWidth
                                                                                            ? Get.height * 0.019
                                                                                            : Get.height * 0.018,
                                                                                    child: Text(
                                                                                      incomes[index],
                                                                                      style: greyDateTexStyle10W400,
                                                                                      textAlign: TextAlign.end,
                                                                                    ),
                                                                                  )),
                                                                        )),
                                                              ),
                                                            ),
                                                          ),
                                                          // child: scrollableWidget(
                                                          //     height: monthlyIncomeEditMode.editMode == true && maxWidth
                                                          //         ? Get.height * 0.041
                                                          //         : maxWidth
                                                          //             ? Get.height * 0.019
                                                          //             : Get.height * 0.018,
                                                          //     editMode: monthlyIncomeEditMode.editMode,
                                                          //     text: incomes,
                                                          //     listViewItemCount: monthlyIncomepageControllerList.length,
                                                          //     constraints: constraints,
                                                          //     controller: monthlyIncomepageControllerList,
                                                          //     pageViewItemCount: incomes.length,
                                                          //     onPageChanged: (value) {
                                                          //       List.generate(
                                                          //           weeklyIncomePageControllerList.length,
                                                          //           (index) => weeklyIncomePageControllerList[index].animateToPage(value,
                                                          //               duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                          //       List.generate(
                                                          //           monthlyExpensePageControllerList.length,
                                                          //           (index) => monthlyExpensePageControllerList[index]
                                                          //               .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                          //       List.generate(
                                                          //           weeklyBudgetPageControllerList.length,
                                                          //           (index) => weeklyBudgetPageControllerList[index]
                                                          //               .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                          //       List.generate(
                                                          //           oneTimeIncomePageControllerList.length,
                                                          //           (index) => oneTimeIncomePageControllerList[index]
                                                          //               .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                          //       List.generate(
                                                          //           oneTimeExpensePageControllerList.length,
                                                          //           (index) => oneTimeExpensePageControllerList[index]
                                                          //               .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                          //       // _pageController2.jumpToPage(value);
                                                          //       _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //       _totalWeeklyExpensePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //       _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //       _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //     }),
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
                                iconColor: containerColor,
                                tilePadding: const EdgeInsets.only(left: 15),
                                onExpansionChanged: (value) {
                                  weeklyIncomeExpansionValue.changeExpansionValue();
                                  if (value) {
                                    Future.delayed(Duration(milliseconds: 50), () {
                                      scrollController3.jumpTo(
                                        scrollController.position.pixels,
                                      );
                                    });
                                  }
                                },
                                trailing: GetBuilder<WeeklyIncomeExpansionChange>(
                                  builder: (controller) {
                                    return maxWidth && controller.weeklyIncomeExpansionValue == false
                                        ? SizedBox(
                                            width: Get.width / 2.07,
                                            child: pageViewCommonWidget(pageController: _singleMonthlyPageController, text: incomes, itemCount: incomes.length, onPageChanged: (value) {}),
                                          )
                                        : Column();
                                  },
                                ),
                                title: weeklyIncomeEditModeRow(constraints: constraints),
                                children: [
                                  GetBuilder<WeeklyIncomeDataVisibilityController>(
                                    builder: (weeklyIncomeDataController) {
                                      return Container(
                                        padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 2),
                                        decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: Border(
                                          bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                          top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                        )),
                                        child: GetBuilder<WeeklyIncomeEditModeController>(
                                          builder: (weeklyIncomeEditModeController) {
                                            return Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                                            bottom: maxWidth
                                                                ? controller.weeklyIncomeShowTextWeb == false
                                                                    ? 62.0
                                                                    : controller.weeklyIncomeShowTextWeb == true && weeklyIncomeEditModeController.weeklyIncomeEditMode == false
                                                                        ? Get.height * 0.042
                                                                        : 0.0
                                                                : 0.0,
                                                          ),
                                                          child: SingleChildScrollView(
                                                            controller: scrollController3,
                                                            scrollDirection: Axis.horizontal,
                                                            physics: const ClampingScrollPhysics(),
                                                            child: Column(
                                                              // direction: Axis.vertical,
                                                              // mainAxisSize: MainAxisSize.min,
                                                              children: List.generate(
                                                                  5,
                                                                  (index) => Row(
                                                                        // controller: scrollController2,
                                                                        // physics: const NeverScrollableScrollPhysics(),
                                                                        // shrinkWrap: true,
                                                                        // scrollDirection: Axis.horizontal,
                                                                        children: List.generate(
                                                                            incomes.length,
                                                                            (index) => SizedBox(
                                                                                  width: 60,
                                                                                  height: monthlyIncomeEditMode.editMode == true && maxWidth
                                                                                      ? Get.height * 0.041
                                                                                      : maxWidth
                                                                                          ? Get.height * 0.019
                                                                                          : Get.height * 0.018,
                                                                                  child: Text(
                                                                                    incomes[index],
                                                                                    style: greyDateTexStyle10W400,
                                                                                    textAlign: TextAlign.end,
                                                                                  ),
                                                                                )),
                                                                      )),
                                                            ),
                                                          ),
                                                          // child: SizedBox(
                                                          //   height: weeklyIncomeEditModeController.weeklyIncomeEditMode == true && maxWidth
                                                          //       ? Get.height * 0.041
                                                          //       : maxWidth
                                                          //           ? Get.height * 0.019
                                                          //           : Get.height * 0.018,
                                                          //   child: ListView(
                                                          //     controller: scrollController3,
                                                          //     // physics: NeverScrollableScrollPhysics(),
                                                          //     shrinkWrap: true,
                                                          //     scrollDirection: Axis.horizontal,
                                                          //     children: List.generate(
                                                          //         incomes.length,
                                                          //         (index) => SizedBox(
                                                          //               width: 60,
                                                          //               child: Text(
                                                          //                 incomes[index],
                                                          //                 style: greyDateTexStyle10W400,
                                                          //                 textAlign: TextAlign.end,
                                                          //               ),
                                                          //             )),
                                                          //   ),
                                                          // ),
                                                          // child: scrollableWidget(
                                                          //     height: weeklyIncomeEditModeController.weeklyIncomeEditMode == true && maxWidth
                                                          //         ? Get.height * 0.041
                                                          //         : maxWidth
                                                          //             ? Get.height * 0.019
                                                          //             : Get.height * 0.018,
                                                          //     text: incomes,
                                                          //     listViewItemCount: weeklyIncomePageControllerList.length,
                                                          //     constraints: constraints,
                                                          //     controller: weeklyIncomePageControllerList,
                                                          //     pageViewItemCount: incomes.length,
                                                          //     onPageChanged: (value) {
                                                          //       List.generate(
                                                          //           monthlyIncomepageControllerList.length,
                                                          //           (index) => monthlyIncomepageControllerList[index].animateToPage(value,
                                                          //               duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                          //       List.generate(
                                                          //           monthlyExpensePageControllerList.length,
                                                          //           (index) => monthlyExpensePageControllerList[index]
                                                          //               .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                          //       _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //
                                                          //       List.generate(
                                                          //           weeklyBudgetPageControllerList.length,
                                                          //           (index) => weeklyBudgetPageControllerList[index]
                                                          //               .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                          //       List.generate(
                                                          //           oneTimeIncomePageControllerList.length,
                                                          //           (index) => oneTimeIncomePageControllerList[index]
                                                          //               .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                          //
                                                          //       List.generate(
                                                          //           oneTimeExpensePageControllerList.length,
                                                          //           (index) => oneTimeExpensePageControllerList[index]
                                                          //               .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                          //       _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //       _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //       _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //       _totalWeeklyExpensePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                          //     }),
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
                                iconColor: containerColor,
                                onExpansionChanged: (value) {
                                  monthlyExpenseExpansionValue.changeExpansionValue();
                                },
                                trailing: GetBuilder<MonthlyExpenseExpansionChange>(
                                  builder: (controller) {
                                    return maxWidth && controller.monthlyExpenseExpansionValue == false
                                        ? SizedBox(
                                            width: Get.width / 2.07,
                                            child: pageViewCommonWidget(pageController: _singleMonthlyPageController, text: incomes, itemCount: incomes.length, onPageChanged: (value) {}),
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
                                        padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 2),
                                        decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: Border(
                                          bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                          top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                        )),
                                        child: GetBuilder<MonthlyExpenseEditModeController>(
                                          builder: (monthlyExpenseEditModeController) {
                                            return Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                                            bottom: maxWidth
                                                                ? controller.monthlyExpenseShowTextWeb == false
                                                                    ? 62.0
                                                                    : controller.monthlyExpenseShowTextWeb == true && monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                                                        ? 35.0
                                                                        : 0.0
                                                                : 0.0,
                                                          ),
                                                          child: scrollableWidget(
                                                              height: monthlyExpenseEditModeController.monthlyExpenseEditMode == true && maxWidth ? Get.height * 0.04 : Get.height * 0.019,
                                                              text: incomes,
                                                              listViewItemCount: monthlyExpensePageControllerList.length,
                                                              constraints: constraints,
                                                              controller: monthlyExpensePageControllerList,
                                                              pageViewItemCount: incomes.length,
                                                              onPageChanged: (value) {
                                                                _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                List.generate(
                                                                    weeklyIncomePageControllerList.length,
                                                                    (index) => weeklyIncomePageControllerList[index].animateToPage(value,
                                                                        duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                                List.generate(
                                                                    monthlyIncomepageControllerList.length,
                                                                    (index) => monthlyIncomepageControllerList[index]
                                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                List.generate(
                                                                    weeklyBudgetPageControllerList.length,
                                                                    (index) => weeklyBudgetPageControllerList[index]
                                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));

                                                                List.generate(
                                                                    oneTimeIncomePageControllerList.length,
                                                                    (index) => oneTimeIncomePageControllerList[index]
                                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                List.generate(
                                                                    oneTimeExpensePageControllerList.length,
                                                                    (index) => oneTimeExpensePageControllerList[index]
                                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));

                                                                _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                _totalWeeklyExpensePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
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
                                iconColor: containerColor,
                                tilePadding: const EdgeInsets.only(left: 15),

                                onExpansionChanged: (value) {
                                  print(value);
                                  weeklyBudgetExpansionValue.changeExpansionValue();
                                },
                                trailing: GetBuilder<WeeklyBudgetExpansionChange>(
                                  builder: (controller) {
                                    return maxWidth && controller.weeklyBudgetExpansionValue == false
                                        ? SizedBox(
                                            width: Get.width / 2.07,
                                            child: pageViewCommonWidget(pageController: _singleMonthlyPageController, text: incomes, itemCount: incomes.length, onPageChanged: (value) {}),
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
                                          bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                          top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
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
                                                            bottom: maxWidth
                                                                ? controller.weeklyBudgetShowTextWeb == false
                                                                    ? 62.0
                                                                    : controller.weeklyBudgetShowTextWeb == true && weeklyBudgetEditModeController.weeklyBudgetEditMode == false
                                                                        ? 35.0
                                                                        : 0.0
                                                                : 0.0,
                                                          ),
                                                          child: scrollableWidget(
                                                              height: weeklyBudgetEditModeController.weeklyBudgetEditMode == true && maxWidth ? Get.height * 0.04 : Get.height * 0.019,
                                                              listViewItemCount: weeklyBudgetPageControllerList.length,
                                                              text: incomes,
                                                              constraints: constraints,
                                                              controller: weeklyBudgetPageControllerList,
                                                              pageViewItemCount: incomes.length,
                                                              onPageChanged: (value) {
                                                                List.generate(
                                                                    monthlyIncomepageControllerList.length,
                                                                    (index) => monthlyIncomepageControllerList[index]
                                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                List.generate(
                                                                    weeklyIncomePageControllerList.length,
                                                                    (index) => weeklyIncomePageControllerList[index].animateToPage(value,
                                                                        duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                                List.generate(
                                                                    monthlyExpensePageControllerList.length,
                                                                    (index) => monthlyExpensePageControllerList[index]
                                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));

                                                                List.generate(
                                                                    oneTimeIncomePageControllerList.length,
                                                                    (index) => oneTimeIncomePageControllerList[index]
                                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                List.generate(
                                                                    oneTimeExpensePageControllerList.length,
                                                                    (index) => oneTimeExpensePageControllerList[index]
                                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                // _pageController2.jumpToPage(value);
                                                                _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                _totalWeeklyExpensePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
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
                                              iconColor: containerColor,
                                              tilePadding: const EdgeInsets.only(left: 15),
                                              onExpansionChanged: (value) {
                                                oneTimeIncomeExpansionValue.changeExpansionValue();
                                              },
                                              trailing: GetBuilder<OneTimeIncomeExpansionChange>(
                                                builder: (controller) {
                                                  return maxWidth && controller.oneTimeIncomeExpansionValue == false
                                                      ? SizedBox(
                                                          width: Get.width / 2.07,
                                                          child:
                                                              pageViewCommonWidget(pageController: _singleMonthlyPageController, text: incomes, itemCount: incomes.length, onPageChanged: (value) {}),
                                                        )
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
                                                        bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                                        top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                                      )),
                                                      child: GetBuilder<OneTimeIncomeEditModeController>(
                                                        builder: (oneTimeIncomeEditModeController) {
                                                          return Column(
                                                            children: [
                                                              oneTimeIncomeController.oneTimeIncomeVisibility == false && oneTimeIncomeController.oneTimeIncomeVisibilityIncome == true
                                                                  ? Column()
                                                                  : Table(
                                                                      columnWidths: <int, TableColumnWidth>{
                                                                        0: FlexColumnWidth(oneTimeIncomeEditModeController.oneTimeIncomeEditMode == true ? 2.7 : 3.6),
                                                                        1: FlexColumnWidth(oneTimeIncomeEditModeController.oneTimeIncomeEditMode == true ? 2.3 : 3.1),
                                                                        2: FlexColumnWidth(oneTimeIncomeEditModeController.oneTimeIncomeEditMode == true ? 1.6 : 1.1),
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
                                                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                                                          bottom: maxWidth
                                                                              ? showOneTimeIncomeSaveTextController.oneTimeIncomeShowTextWeb == false
                                                                                  ? 62.0
                                                                                  : showOneTimeIncomeSaveTextController.oneTimeIncomeShowTextWeb == true &&
                                                                                          oneTimeIncomeEditModeController.oneTimeIncomeEditMode == false
                                                                                      ? Get.height * 0.042
                                                                                      : 0.0
                                                                              : 0.0,
                                                                        ),
                                                                        child: scrollableWidget(
                                                                            height: oneTimeIncomeEditModeController.oneTimeIncomeEditMode == true && maxWidth
                                                                                ? Get.height * 0.04
                                                                                : maxWidth
                                                                                    ? Get.height * 0.019
                                                                                    : Get.height * 0.018,
                                                                            text: incomes,
                                                                            listViewItemCount: oneTimeIncomePageControllerList.length,
                                                                            constraints: constraints,
                                                                            controller: oneTimeIncomePageControllerList,
                                                                            pageViewItemCount: incomes.length,
                                                                            onPageChanged: (value) {
                                                                              List.generate(
                                                                                  monthlyIncomepageControllerList.length,
                                                                                  (index) => monthlyIncomepageControllerList[index]
                                                                                      .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                              List.generate(
                                                                                  weeklyIncomePageControllerList.length,
                                                                                  (index) => weeklyIncomePageControllerList[index].animateToPage(value,
                                                                                      duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                                              List.generate(
                                                                                  monthlyExpensePageControllerList.length,
                                                                                  (index) => monthlyExpensePageControllerList[index]
                                                                                      .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                              List.generate(
                                                                                  weeklyBudgetPageControllerList.length,
                                                                                  (index) => weeklyBudgetPageControllerList[index]
                                                                                      .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                              List.generate(
                                                                                  oneTimeExpensePageControllerList.length,
                                                                                  (index) => oneTimeExpensePageControllerList[index]
                                                                                      .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                              _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                              _previousWeekBalancePageController.animateToPage(value,
                                                                                  duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                              _totalWeeklyExpensePageController.animateToPage(value,
                                                                                  duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                              _totalWeeklyIncomePageController.animateToPage(value,
                                                                                  duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
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
                                            color: containerColor,
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
                                              iconColor: containerColor,
                                              tilePadding: const EdgeInsets.only(right: 0.0, left: 15),
                                              onExpansionChanged: (value) {
                                                oneTimeExpenseExpansionValue.changeExpansionValue();
                                              },
                                              trailing: GetBuilder<OneTimeExpenseExpansionChange>(
                                                builder: (controller) {
                                                  return maxWidth && controller.oneTimeExpenseExpansionValue == false
                                                      ? SizedBox(
                                                          width: Get.width / 2.07,
                                                          child:
                                                              pageViewCommonWidget(pageController: _singleMonthlyPageController, text: incomes, itemCount: incomes.length, onPageChanged: (value) {}),
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
                                                        bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                                        top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
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
                                                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                                                          bottom: maxWidth
                                                                              ? showOneTimeExpenseSaveTextController.oneTimeExpenseShowText == false
                                                                                  ? 62.0
                                                                                  : showOneTimeExpenseSaveTextController.oneTimeExpenseShowText == true &&
                                                                                          oneTimeExpenseEditModeController.oneTimeExpenseEditMode == false
                                                                                      ? Get.height * 0.042
                                                                                      : 0.0
                                                                              : 0.0,
                                                                        ),
                                                                        child: scrollableWidget(
                                                                            text: incomes,
                                                                            height: oneTimeExpenseEditModeController.oneTimeExpenseEditMode == true && maxWidth
                                                                                ? Get.height * 0.04
                                                                                : maxWidth
                                                                                    ? Get.height * 0.019
                                                                                    : Get.height * 0.018,
                                                                            listViewItemCount: oneTimeExpensePageControllerList.length,
                                                                            constraints: constraints,
                                                                            controller: oneTimeExpensePageControllerList,
                                                                            pageViewItemCount: incomes.length,
                                                                            onPageChanged: (value) {
                                                                              List.generate(
                                                                                  monthlyIncomepageControllerList.length,
                                                                                  (index) => monthlyIncomepageControllerList[index]
                                                                                      .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                              List.generate(
                                                                                  weeklyIncomePageControllerList.length,
                                                                                  (index) => weeklyIncomePageControllerList[index].animateToPage(value,
                                                                                      duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                                              List.generate(
                                                                                  monthlyExpensePageControllerList.length,
                                                                                  (index) => monthlyExpensePageControllerList[index]
                                                                                      .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                              List.generate(
                                                                                  weeklyBudgetPageControllerList.length,
                                                                                  (index) => weeklyBudgetPageControllerList[index]
                                                                                      .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                              List.generate(
                                                                                  oneTimeIncomePageControllerList.length,
                                                                                  (index) => oneTimeIncomePageControllerList[index]
                                                                                      .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                              _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                              _previousWeekBalancePageController.animateToPage(value,
                                                                                  duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                              _totalWeeklyIncomePageController.animateToPage(value,
                                                                                  duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                              _totalWeeklyExpensePageController.animateToPage(value,
                                                                                  duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
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
                                            color: containerColor,
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
                                                  right: BorderSide(color: borderColor),
                                                  bottom: BorderSide(
                                                    color: borderColor,
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
                                          decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: borderColor))),
                                          child: SizedBox(
                                            // width: Get.width / 2.05,
                                            height: Get.height * 0.018,
                                            child: countForCashPageViewBuilderWidget(
                                                pageController: _previousWeekBalancePageController,
                                                onPageChanged: (value) {
                                                  List.generate(monthlyIncomepageControllerList.length,
                                                      (index) => monthlyIncomepageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(
                                                      weeklyIncomePageControllerList.length,
                                                      (index) => weeklyIncomePageControllerList[index]
                                                          .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                  List.generate(monthlyExpensePageControllerList.length,
                                                      (index) => monthlyExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(weeklyBudgetPageControllerList.length,
                                                      (index) => weeklyBudgetPageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(oneTimeExpensePageControllerList.length,
                                                      (index) => oneTimeExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(oneTimeIncomePageControllerList.length,
                                                      (index) => oneTimeIncomePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                  _totalWeeklyExpensePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                  _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                }),
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
                                      color: borderColor,
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
                                          child: countForCashPageViewBuilderWidget(
                                              pageController: _previousWeekBalancePageController,
                                              onPageChanged: (value) {
                                                List.generate(monthlyIncomepageControllerList.length,
                                                    (index) => monthlyIncomepageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(
                                                    weeklyIncomePageControllerList.length,
                                                    (index) => weeklyIncomePageControllerList[index]
                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                List.generate(monthlyExpensePageControllerList.length,
                                                    (index) => monthlyExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(weeklyBudgetPageControllerList.length,
                                                    (index) => weeklyBudgetPageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(oneTimeExpensePageControllerList.length,
                                                    (index) => oneTimeExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(oneTimeIncomePageControllerList.length,
                                                    (index) => oneTimeIncomePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                _totalWeeklyExpensePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                              }),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    const Divider(
                                      height: 10,
                                      color: borderColor,
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
                                          decoration: const BoxDecoration(color: Colors.white, border: Border(right: BorderSide(color: borderColor), bottom: BorderSide(color: borderColor))),
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
                                          decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: borderColor))),
                                          child: SizedBox(
                                            // width: Get.width / 2.05,
                                            height: Get.height * 0.018,
                                            child: countForCashPageViewBuilderWidget(
                                                pageController: _totalWeeklyIncomePageController,
                                                onPageChanged: (value) {
                                                  List.generate(monthlyIncomepageControllerList.length,
                                                      (index) => monthlyIncomepageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(
                                                      weeklyIncomePageControllerList.length,
                                                      (index) => weeklyIncomePageControllerList[index]
                                                          .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                  List.generate(monthlyExpensePageControllerList.length,
                                                      (index) => monthlyExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(weeklyBudgetPageControllerList.length,
                                                      (index) => weeklyBudgetPageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(oneTimeExpensePageControllerList.length,
                                                      (index) => oneTimeExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(oneTimeIncomePageControllerList.length,
                                                      (index) => oneTimeIncomePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                  _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                  _totalWeeklyExpensePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                }),
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
                                      color: borderColor,
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
                                          child: countForCashPageViewBuilderWidget(
                                              pageController: _totalWeeklyIncomePageController,
                                              onPageChanged: (value) {
                                                List.generate(monthlyIncomepageControllerList.length,
                                                    (index) => monthlyIncomepageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(
                                                    weeklyIncomePageControllerList.length,
                                                    (index) => weeklyIncomePageControllerList[index]
                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                List.generate(monthlyExpensePageControllerList.length,
                                                    (index) => monthlyExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(weeklyBudgetPageControllerList.length,
                                                    (index) => weeklyBudgetPageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(oneTimeExpensePageControllerList.length,
                                                    (index) => oneTimeExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(oneTimeIncomePageControllerList.length,
                                                    (index) => oneTimeIncomePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                _totalWeeklyExpensePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                              }),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    const Divider(
                                      height: 10,
                                      color: borderColor,
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
                                          decoration: const BoxDecoration(color: Colors.white, border: Border(right: BorderSide(color: borderColor), bottom: BorderSide(color: borderColor, width: 2))),
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
                                          decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: borderColor))),
                                          child: SizedBox(
                                            // width: Get.width / 2.05,
                                            height: Get.height * 0.018,
                                            child: countForCashPageViewBuilderWidget(
                                                pageController: _totalWeeklyExpensePageController,
                                                onPageChanged: (value) {
                                                  List.generate(monthlyIncomepageControllerList.length,
                                                      (index) => monthlyIncomepageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(
                                                      weeklyIncomePageControllerList.length,
                                                      (index) => weeklyIncomePageControllerList[index]
                                                          .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                  List.generate(monthlyExpensePageControllerList.length,
                                                      (index) => monthlyExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(weeklyBudgetPageControllerList.length,
                                                      (index) => weeklyBudgetPageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(oneTimeExpensePageControllerList.length,
                                                      (index) => oneTimeExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  List.generate(oneTimeIncomePageControllerList.length,
                                                      (index) => oneTimeIncomePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                  _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                  _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                  _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                }),
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
                                      color: borderColor,
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
                                          child: countForCashPageViewBuilderWidget(
                                              pageController: _totalWeeklyExpensePageController,
                                              onPageChanged: (value) {
                                                List.generate(monthlyIncomepageControllerList.length,
                                                    (index) => monthlyIncomepageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(
                                                    weeklyIncomePageControllerList.length,
                                                    (index) => weeklyIncomePageControllerList[index]
                                                        .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                List.generate(monthlyExpensePageControllerList.length,
                                                    (index) => monthlyExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(weeklyBudgetPageControllerList.length,
                                                    (index) => weeklyBudgetPageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(oneTimeExpensePageControllerList.length,
                                                    (index) => oneTimeExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                List.generate(oneTimeIncomePageControllerList.length,
                                                    (index) => oneTimeIncomePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                              }),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    const Divider(
                                      height: 10,
                                      color: borderColor,
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
                            child: countForCashPageViewBuilderWidget(
                                // pageController: _totalWeeklyExpensePageController,
                                onPageChanged: (value) {
                              // List.generate(monthlyIncomepageControllerList.length,
                              //     (index) => monthlyIncomepageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // List.generate(
                              //     weeklyIncomePageControllerList.length,
                              //     (index) => weeklyIncomePageControllerList[index]
                              //         .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                              // List.generate(monthlyExpensePageControllerList.length,
                              //     (index) => monthlyExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // List.generate(weeklyBudgetPageControllerList.length,
                              //     (index) => weeklyBudgetPageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // List.generate(oneTimeExpensePageControllerList.length,
                              //     (index) => oneTimeExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // List.generate(oneTimeIncomePageControllerList.length,
                              //     (index) => oneTimeIncomePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                              // _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                              // _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                            }),
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
                            child: countForCashPageViewBuilderWidget(
                                // pageController: _totalWeeklyExpensePageController,
                                onPageChanged: (value) {
                              // List.generate(monthlyIncomepageControllerList.length,
                              //     (index) => monthlyIncomepageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // List.generate(
                              //     weeklyIncomePageControllerList.length,
                              //     (index) => weeklyIncomePageControllerList[index]
                              //         .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                              // List.generate(monthlyExpensePageControllerList.length,
                              //     (index) => monthlyExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // List.generate(weeklyBudgetPageControllerList.length,
                              //     (index) => weeklyBudgetPageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // List.generate(oneTimeExpensePageControllerList.length,
                              //     (index) => oneTimeExpensePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // List.generate(oneTimeIncomePageControllerList.length,
                              //     (index) => oneTimeIncomePageControllerList[index].animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                              // _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                              // _previousWeekBalancePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                              // _totalWeeklyIncomePageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                            }),
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

  _saveChangesButton({BoxConstraints? constraints}) {
    return commonButton(
      textStyle: whiteMontserrat11W500,
      height: 50,
      width: constraints!.maxWidth > 1000 ? Get.width * 0.13 : Get.width * 0.85,
      text: saveChanges,
      bgColor: containerColor,
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
        CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempMonthlyIncomeList}).whenComplete(() {
          GetIncomeController.to.monthlyIncomeList?.clear();
          GetIncomeController.to.tempMonthlyIncomeList?.clear();
          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "2"});
        });
        CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempWeeklyIncomeList}).whenComplete(() {
          GetIncomeController.to.weeklyIncomesList?.clear();
          GetIncomeController.to.tempWeeklyIncomeList?.clear();
          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "1"});
        });
        CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempMonthlyExpenseList}).whenComplete(() {
          GetIncomeController.to.monthlyExpenseList?.clear();
          GetIncomeController.to.tempMonthlyExpenseList?.clear();
          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "week_month": "2"});
        });
        CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempWeeklyBudgetList}).whenComplete(() {
          GetIncomeController.to.weeklyBudgetList?.clear();
          GetIncomeController.to.tempWeeklyBudgetList?.clear();
          GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "week_month": "1"});
        });
      },
    );
  }

  Widget webHeaderRow({BoxConstraints? constraints}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              // width: 200,
              // height: Get.height * 0.063,
              decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(10)),
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
            decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(10)),
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
                currentWeekDate,
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
                  // Switch(
                  //   // onChanged: toggleSwitch,
                  //   // value: isSwitched,
                  //   activeColor: commonButtonColor,
                  //   activeTrackColor: Colors.white,
                  //   inactiveThumbColor: commonTextColor2,
                  //   // thumbColor: commonTextColor2,
                  //   inactiveTrackColor: Colors.white,
                  //   value: switchController.switchValue,
                  //   onChanged: (bool value) {
                  //     switchController.changeSwitchValue(value: value);
                  //     if (value) {
                  //       if (monthlyIncomeEditMode.editMode == false) {
                  //         // Future.delayed(const Duration(milliseconds: 1), () {
                  //         monthlyIncomeEditMode.showEditMode();
                  //         // });
                  //       }
                  //     }
                  //   },
                  // ),
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
            // height: Get.height * 0.06,
            decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(7)),
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
                    decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(7)),
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
                    decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(7)),
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
                  currentWeekDate,
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
      inactiveThumbColor: commonTextColor2,
      inactiveTrackColor: Colors.grey.withOpacity(0.3),
      value: switchController.switchValue,
      onChanged: (bool value) {
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
            // if (monthlyIncomeEditMode.editMode == false) {
            //   // Future.delayed(const Duration(milliseconds: 1), () {
            //   monthlyIncomeEditMode.showEditMode();
            //   // });
            // }
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

  monthlyIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    // tempMonthlyIncomeList = GetIncomeController.to.monthlyIncomeList;
    final dropDownController = Get.put(SelectedDropDownItem());
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: StreamBuilder(
          stream: GetIncomeController.to.monthlyIncomeList?.stream,
          builder: (context, snapshot) {
            return GetBuilder<MonthlyIncomeEditModeController>(
              builder: (editModeController) {
                return Stack(
                  overflow: Overflow.visible,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(right: monthlyIncomeVisibilityController.visibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0, left: editModeController.editMode == true ? 5 : 0.0),
                      padding: EdgeInsets.only(right: editModeController.editMode == false ? 0.0 : Get.width * 0.005),
                      decoration: BoxDecoration(
                          border: Border(
                              right: monthlyIncomeVisibilityController.visibility == true && constraints!.maxWidth < 1000 && editModeController.editMode == true
                                  ? BorderSide.none
                                  : const BorderSide(color: borderColor))),
                      child: Column(
                        children: [
                          constraints!.maxWidth > 1000 || monthlyIncomeVisibilityController.visibility == true && monthlyIncomeVisibilityController.visibilityIncome == false
                              ? Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(editModeController.editMode == true ? 3 : 2.95),
                                    1: const FlexColumnWidth(2),
                                    2: const FlexColumnWidth(2),
                                    3: const FlexColumnWidth(2),
                                    4: const FlexColumnWidth(2),
                                    5: const FlexColumnWidth(1),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: editModeController.editMode == true && constraints.maxWidth > 1000
                                                ? 0.0
                                                : editModeController.editMode == true && constraints.maxWidth < 1000
                                                    ? 5.0
                                                    : editModeController.editMode == false && constraints.maxWidth > 1000
                                                        ? 0.0
                                                        : 9.0),
                                        child: Text(
                                          incomeName,
                                          style: columnNameListStyle,
                                        ),
                                      ),
                                      Text(
                                        paidOn,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        every,
                                        style: columnNameListStyle,
                                      ),

                                      // if (editModeController.editMode && constraints.maxWidth > 1000)
                                      Text(
                                        effectiveDate,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        amount,
                                        style: columnNameListStyle,
                                      ),
                                      if (editModeController.editMode && constraints.maxWidth > 1000)
                                        Text(
                                          action,
                                          style: columnNameListStyle,
                                        )
                                    ]),
                                  ],
                                )
                              : Column(),
                          StreamBuilder(
                              stream: GetIncomeController.to.tempMonthlyIncomeList?.stream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: editModeController.editMode == true ? GetIncomeController.to.tempMonthlyIncomeList?.length : GetIncomeController.to.monthlyIncomeList?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: Get.height * 0.015,
                                        top: index == 0 ? Get.height * 0.01 : 0.0,
                                      ),
                                      child: SwipeActionCell(
                                        backgroundColor: Colors.transparent,
                                        isDraggable: constraints.maxWidth > 1000
                                            ? false
                                            : editModeController.editMode
                                                ? true
                                                : false,
                                        trailingActions: [
                                          SwipeAction(
                                            backgroundRadius: 5,
                                            widthSpace: 50,
                                            color: colorsFFEBEB,
                                            icon: Image.asset(
                                              deleteImage,
                                              height: Get.height * 0.025,
                                            ),
                                            onTap: (p0) {
                                              showCommonDialog(
                                                  context: context,
                                                  headerTitle: sureToDelete,
                                                  descriptionTitle: sureToDeleteSubTitle,
                                                  buttonColor: Colors.white,
                                                  saveButtonBorderColor: colorsEE4242,
                                                  noButtonTextStyle: noButtonTextStyle,
                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                  noButtonColor: Colors.black,
                                                  onPressYes: () {
                                                    GetIncomeController.to.tempMonthlyIncomeList?.removeAt(index);
                                                    GetIncomeController.to.monthlyIncomeList?.refresh();
                                                    Get.back();
                                                  },
                                                  onPressNo: () {
                                                    Get.back();
                                                  });
                                            },
                                          ),
                                        ],
                                        key: UniqueKey(),
                                        child: boolValue == true && constraints.maxWidth < 1000
                                            ? Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text(
                                                  GetIncomeController.to.monthlyIncomeList?[index].name ?? '',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: blackMontserrat10W500,
                                                ),
                                              )
                                            : Table(
                                                columnWidths: const <int, TableColumnWidth>{
                                                  0: FlexColumnWidth(3),
                                                  1: FlexColumnWidth(2),
                                                  2: FlexColumnWidth(2),
                                                  3: FlexColumnWidth(2),
                                                  4: FlexColumnWidth(2),
                                                  5: FlexColumnWidth(1.1),
                                                },
                                                children: [
                                                  TableRow(
                                                    children: [
                                                      TableCell(
                                                        // verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: SizedBox(
                                                          height: editModeController.editMode ? Get.height * 0.044 : Get.height * 0.02,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02,
                                                                left: editModeController.editMode == true && constraints.maxWidth < 1000
                                                                    ? 5
                                                                    : constraints.maxWidth < 1000
                                                                        ? 10.0
                                                                        : 0.0),
                                                            child: editModeController.editMode == false
                                                                ? Text(
                                                                    '${GetIncomeController.to.monthlyIncomeList?[index].name ?? ''}',
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: blackMontserrat10W500,
                                                                  )
                                                                : commonTextFormField(
                                                                    keyboardType: TextInputType.text,
                                                                    inputAction: TextInputAction.next,
                                                                    inputFormatter: [characterInputFormatter()],
                                                                    contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                    textEditingController: TextEditingController(text: GetIncomeController.to.tempMonthlyIncomeList?[index].name ?? ''),
                                                                    onFieldSubmit: (value) {
                                                                      print('????${GetIncomeController.to.tempMonthlyIncomeList?[0].name}');
                                                                      print(GetIncomeController.to.monthlyIncomeList?[0].name);
                                                                    },
                                                                    onChangedFunction: (value) {
                                                                      // _monthlyIncomeName?.value[index].text = value;
                                                                      GetIncomeController.to.tempMonthlyIncomeList?[index].name = value;
                                                                      // GetIncomeController.to.monthlyExpenseList?[index].name = _monthlyExpenseName?.text;
                                                                    }),
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: editModeController.editMode == true ? 5 : 0.0),
                                                          child: editModeController.editMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        value: '${GetIncomeController.to.tempMonthlyIncomeList?[index].paidOn ?? 1}th'
                                                                            .replaceAllMapped('1th', (match) => '1st')
                                                                            .replaceAllMapped('2th', (match) => '2nd')
                                                                            .replaceAllMapped('3th', (match) => '3rd')
                                                                            .replaceAllMapped('11st', (match) => '11th')
                                                                            .replaceAllMapped('12nd', (match) => '12th')
                                                                            .replaceAllMapped('13rd', (match) => '13th'),
                                                                        // value: controller1.selectedMonthlyIncomeDateList[index],
                                                                        itemList: dateList,
                                                                        onChanged: (item) {
                                                                          // controller1.changeDate(item: item, index: index);
                                                                          GetIncomeController.to.tempMonthlyIncomeList?[index].paidOn =
                                                                              int.parse(item.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', ''));
                                                                          GetIncomeController.to.tempMonthlyIncomeList?.refresh();
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.monthlyIncomeList?[index].paidOn ?? 1}th'
                                                                      .replaceAllMapped('1th', (match) => '1st')
                                                                      .replaceAllMapped('2th', (match) => '2nd')
                                                                      .replaceAllMapped('3th', (match) => '3rd')
                                                                      .replaceAllMapped('11st', (match) => '11th')
                                                                      .replaceAllMapped('12nd', (match) => '12th')
                                                                      .replaceAllMapped('13rd', (match) => '13th'),
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(
                                                              right: constraints.maxWidth < 1000
                                                                  ? Get.width * 0.02
                                                                  : editModeController.editMode == true
                                                                      ? Get.width * 0.02
                                                                      : Get.width * 0.02),
                                                          decoration:
                                                              BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: editModeController.editMode == true ? 5 : 0.0),
                                                          child: editModeController.editMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        value: '${GetIncomeController.to.tempMonthlyIncomeList?[index].every ?? 1} mon',
                                                                        // value: controller1.selectedMonthlyIncomeMonthList[index],
                                                                        itemList: months,
                                                                        onChanged: (item) {
                                                                          // controller1.changeItem(item: item, index: index);
                                                                          GetIncomeController.to.tempMonthlyIncomeList?[index].every = int.parse(item.replaceAll('mon', '').replaceAll(' ', ''));
                                                                          GetIncomeController.to.tempMonthlyIncomeList?.refresh();
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.monthlyIncomeList?[index].every ?? 1} mon',
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(
                                                              right: constraints.maxWidth < 1000
                                                                  ? editModeController.editMode == false
                                                                      ? Get.width * 0.02
                                                                      : Get.width * 0.02
                                                                  : Get.width * 0.02),
                                                          decoration:
                                                              BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: InkWell(
                                                          onTap: () {
                                                            // _selectDate(context: context, index: index);
                                                          },
                                                          child: Container(
                                                              margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                              decoration:
                                                                  BoxDecoration(color: editModeController.editMode ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                                              // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: editModeController.editMode == true && constraints.maxWidth < 1000
                                                                      ? Get.width * 0.015
                                                                      : editModeController.editMode == true && constraints.maxWidth > 1000
                                                                          ? Get.width * 0.005
                                                                          : 0.0),

                                                              // width: Get.width * 0.080,
                                                              // height: Get.height * 0.04,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      DateFormat('dd-MM-yyyy').format(DateTime.parse(editModeController.editMode == true
                                                                          ? GetIncomeController.to.tempMonthlyIncomeList![index].date
                                                                          : GetIncomeController.to.monthlyIncomeList![index].date.toString())),
                                                                      // tempMonthlyIncomeList![index].date.toString().replaceAll('T10:16:38.185Z', ''),
                                                                      // '${GetIncomeController.to.monthlyIncomeList?[index].date}',
                                                                      style: blackMontserrat10W500,
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                  constraints.maxWidth > 1000 && editModeController.editMode == true
                                                                      ? Image.asset(
                                                                          calendarImage2,
                                                                          height: Get.height * 0.02,
                                                                          width: Get.width * 0.010,
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: constraints.maxWidth < 1000 && editModeController.editMode == true ? Get.width * 0.01 : 0.0),
                                                          child: editModeController.editMode == false
                                                              ? Text(
                                                                  '${GetIncomeController.to.monthlyIncomeList?[index].amount}',
                                                                  style: blackMontserrat10W500,
                                                                  maxLines: 1,
                                                                )
                                                              : commonTextFormField(
                                                                  prefixText: '\$',
                                                                  prefixstyle: blackMontserrat10W500,
                                                                  keyboardType: TextInputType.phone,
                                                                  inputAction: TextInputAction.done,
                                                                  inputFormatter: [digitInputFormatter()],
                                                                  //contentPadding: const EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 14.0),
                                                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                  // textStyle: incomeNameStyle,
                                                                  textEditingController: TextEditingController(text: GetIncomeController.to.tempMonthlyIncomeList?[index].amount.toString()),
                                                                  onChangedFunction: (value) {
                                                                    GetIncomeController.to.tempMonthlyIncomeList?[index].amount = int.parse(value);
                                                                    // GetIncomeController.to.monthlyExpenseList?[index].name = _monthlyExpenseName?.text;
                                                                  }),
                                                        ),
                                                      ),
                                                      // if (editModeController.editMode == true && constraints.maxWidth > 1000)

                                                      if (editModeController.editMode && constraints.maxWidth > 1000)
                                                        TableCell(
                                                          verticalAlignment: TableCellVerticalAlignment.middle,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showCommonDialog(
                                                                  context: context,
                                                                  headerTitle: sureToDelete,
                                                                  descriptionTitle: sureToDeleteSubTitle,
                                                                  buttonColor: Colors.white,
                                                                  saveButtonBorderColor: colorsEE4242,
                                                                  noButtonTextStyle: noButtonTextStyle,
                                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                                  noButtonColor: Colors.black,
                                                                  onPressYes: () {
                                                                    // tempMonthlyIncomeList?.removeAt(index);
                                                                    // GetIncomeController.to.monthlyIncomeList?.refresh();
                                                                    Get.back();
                                                                  },
                                                                  onPressNo: () {
                                                                    Get.back();
                                                                  });
                                                              // setState(() {
                                                              //   MonthlyIncomeModelOld.monthlyIncomeList.removeAt(index);
                                                              // });
                                                              // GetIncomeController.to.monthlyIncomeList?.removeAt(index);
                                                              // GetIncomeController.to.monthlyIncomeList?.refresh();
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                                margin: const EdgeInsets.only(left: 10.0),
                                                                width: Get.width * 0.015,
                                                                height: Get.height * 0.03,
                                                                child: Image.asset(
                                                                  deleteImage,
                                                                  height: Get.height * 0.01,
                                                                  // width: 30.0,
                                                                )),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                      ),
                                    );
                                  },
                                );
                              }),
                          Visibility(
                            visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : editModeController.editMode,
                            child: GetBuilder<SaveDataTextController>(
                              builder: (showSaveTextController) {
                                return Column(
                                  children: [
                                    if (showSaveTextController.showTextWeb == false || showSaveTextController.showText == false)
                                      Padding(
                                        padding: EdgeInsets.only(right: editModeController.editMode == true ? 0.0 : 10.0),
                                        child: Table(
                                          columnWidths: <int, TableColumnWidth>{
                                            0: const FlexColumnWidth(3),
                                            1: const FlexColumnWidth(2),
                                            2: const FlexColumnWidth(2),
                                            3: const FlexColumnWidth(2),
                                            4: FlexColumnWidth(constraints.maxWidth > 1000 ? 1.85 : 2),
                                          },
                                          children: [
                                            TableRow(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: Get.height * 0.044,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth > 1000 ? 0.0 : 5),
                                                    child: commonTextFormField(
                                                        hintText: incomeName,
                                                        hintStyle: blackMontserrat10W500,
                                                        keyboardType: TextInputType.text,
                                                        inputAction: TextInputAction.next,
                                                        inputFormatter: [characterInputFormatter()],
                                                        contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                        textEditingController: _monthlyIncomeNameController),
                                                  ),
                                                ),
                                                TableCell(
                                                  verticalAlignment: TableCellVerticalAlignment.fill,
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                    ),

                                                    // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,

                                                    // height: Get.height * 0.04,

                                                    // alignment: Alignment.center,
                                                    child: GetBuilder<SelectedDropDownItem>(
                                                      builder: (dropDownController) {
                                                        return commonDropDown(
                                                            valueTextStyle: blackMontserrat10W500,
                                                            selectedItemTextStyle: blackMontserrat10W500,
                                                            hintTextStyle: blackMontserrat10W500,
                                                            hintText: chooseDate,
                                                            value: dropDownController.selectedDate,
                                                            itemList: dateList,
                                                            onChanged: (item) {
                                                              dropDownController.changeMonthlyIncomeDate(item: item);
                                                            });
                                                      },
                                                    ),
                                                    // child: dropDownDayGetBuilder(dropDownList: dateList),
                                                    margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                    decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                  ),
                                                ),
                                                TableCell(
                                                  verticalAlignment: TableCellVerticalAlignment.fill,
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 5),

                                                    // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                                    //
                                                    // height: Get.height * 0.04,

                                                    alignment: Alignment.center,
                                                    child: GetBuilder<SelectedDropDownItem>(
                                                      builder: (monthDropDownController) {
                                                        return commonDropDown(
                                                            selectedItemTextStyle: blackMontserrat10W500,
                                                            valueTextStyle: blackMontserrat10W500,
                                                            hintText: chooseMonth,
                                                            hintTextStyle: blackMontserrat10W500,
                                                            value: monthDropDownController.selectedMonth,
                                                            itemList: months,
                                                            onChanged: (item) {
                                                              monthDropDownController.changeMonthlyIncomeMonth(item: item);
                                                            });
                                                      },
                                                    ),
                                                    // child: dropDownWeekGetBuilder(dropDownList: months),
                                                    margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                    decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                                  ),
                                                ),
                                                TableCell(
                                                    verticalAlignment: TableCellVerticalAlignment.fill,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _selectDate(context: context);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: constraints.maxWidth < 1000
                                                                ? Get.width * 0.015
                                                                : constraints.maxWidth > 1000
                                                                    ? Get.width * 0.005
                                                                    : 0.0),
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          DateFormat('dd-MM-yyyy').format(currentDate),
                                                          style: blackMontserrat10W500,
                                                          maxLines: 1,
                                                        ),
                                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                        decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    )),
                                                TableCell(
                                                  verticalAlignment: TableCellVerticalAlignment.fill,
                                                  child: commonTextFormField(
                                                      hintText: amount,
                                                      hintStyle: blackMontserrat10W500,
                                                      keyboardType: TextInputType.phone,
                                                      inputAction: TextInputAction.done,
                                                      prefixText: '\$',
                                                      prefixstyle: blackMontserrat10W500,
                                                      inputFormatter: [digitInputFormatter()],
                                                      contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                      textEditingController: _monthlyIncomeAmountController),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    else
                                      Container(),
                                    Visibility(
                                      visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : showSaveTextController.showText,
                                      replacement: Row(
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              // setState(() {
                                              final controller = Get.put(SelectedDropDownItem());
                                              if (constraints.maxWidth < 1000) {
                                                GetIncomeController.to.tempMonthlyIncomeList?.add(DataModel(
                                                    name: _monthlyIncomeNameController.text,
                                                    amount: int.parse(_monthlyIncomeAmountController.text),
                                                    every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                    paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                    weekMonth: 2,
                                                    incomeOutgoing: 1,
                                                    date: currentDate.toString()));
                                                // tempMonthlyIncomeList?.refresh();
                                              } else {
                                                var response = await CreateIncomeController.to.createIncome(parameter: {
                                                  'income': [
                                                    DataModel(
                                                        name: _monthlyIncomeNameController.text,
                                                        amount: int.parse(_monthlyIncomeAmountController.text),
                                                        every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                        paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                        weekMonth: 2,
                                                        incomeOutgoing: 1,
                                                        date: currentDate.toString())
                                                  ]
                                                }).whenComplete(() {
                                                  GetIncomeController.to.monthlyIncomeList?.clear();
                                                  GetIncomeController.to.tempMonthlyIncomeList?.clear();
                                                  GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "2"});
                                                });
                                                print("{{{{{{{{{{{{{{{{$response");
                                                // if (response["success"] == true) {
                                                //   GetIncomeController.to.monthlyIncomeList?.add(DataModel(
                                                //       name: _monthlyIncomeNameController.text,
                                                //       amount: int.parse(_monthlyIncomeAmountController.text),
                                                //       every: int.parse(controller.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                //       paidOn: int.parse(controller.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                //       weekMonth: 2,
                                                //       incomeOutgoing: 1,
                                                //       date: currentDate.toString()));
                                                //   GetIncomeController.to.monthlyIncomeList?.refresh();
                                                // }
                                              }
                                              _monthlyIncomeAmountController.clear();
                                              _monthlyIncomeNameController.clear();
                                              controller.selectedMonth = null;
                                              controller.selectedDate = null;
                                              // MonthlyIncomeModelOld.monthlyIncomeList
                                              //     .add(MonthlyIncomeModelOld(expenseName: _monthlyIncomeNameController.text, amount: _monthlyAmountController.text));
                                              // controller.selectedMonthlyIncomeDateList.add(controller.selectedSingleMonthlyExpenseDate as Object);
                                              // controller.selectedMonthlyIncomeMonthList.add(controller.selectedSingleMonthlyExpenseMonth as Object);
                                              // checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
                                              // });
                                              constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                            },
                                            child: Text(
                                              save,
                                              style: greenMontserrat11W500,
                                            ),
                                          ),
                                          TextButton(
                                            child: Text(
                                              cancel,
                                              style: redMontserrat11W500,
                                            ),
                                            onPressed: () {
                                              constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                              _monthlyIncomeAmountController.clear();
                                              _monthlyIncomeNameController.clear();
                                              dropDownController.selectedMonth = null;
                                              dropDownController.selectedDate = null;
                                            },
                                          )
                                        ],
                                      ),
                                      child: constraints.maxWidth > 1000 && monthlyIncomeEditMode.editMode == true
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                              child: GestureDetector(
                                                onTap: () {
                                                  constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                                },
                                                child: Align(
                                                  alignment: const FractionalOffset(0.0, 0.0),
                                                  child: Text(
                                                    addMonthlyIncome,
                                                    style: addWeekIncomeStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 1,
                      bottom: 1,
                      child: constraints.maxWidth > 1000
                          ? Container()
                          : GetBuilder<MonthlyIncomeEditModeController>(
                              builder: (circleVisibilityController) {
                                // final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
                                return Visibility(
                                    visible: circleVisibilityController.circleAvatarVisibility,
                                    child: GestureDetector(
                                      onTap: () {
                                        monthlyIncomeVisibilityController.changeVisibility();
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: const Color(0xffF2F2F2),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: monthlyIncomeVisibilityController.visibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                          child: Icon(
                                            monthlyIncomeVisibilityController.visibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                            color: Colors.black,
                                            size: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                            ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }

  weeklyIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    // tempWeeklyIncomeList = GetIncomeController.to.weeklyIncomesList;
    final dropDownController = Get.put(SelectedDropDownItem());
    TextEditingController _weeklyIncomeNameController = TextEditingController();
    TextEditingController _weeklyAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: StreamBuilder(
          stream: GetIncomeController.to.weeklyIncomesList?.stream,
          builder: (context, snapshot) {
            return GetBuilder<WeeklyIncomeEditModeController>(
              builder: (weeklyEditModeController) {
                return Stack(
                  overflow: Overflow.visible,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: weeklyIncomeDataVisibilityController.weeklyDataVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                          left: weeklyEditModeController.weeklyIncomeEditMode == true ? 5 : 0.0),
                      padding: EdgeInsets.only(right: weeklyEditModeController.weeklyIncomeEditMode == false ? 0.0 : Get.width * 0.003),
                      decoration: BoxDecoration(
                          border: Border(
                              right: weeklyIncomeDataVisibilityController.weeklyDataVisibility == true && constraints!.maxWidth < 1000 && weeklyEditModeController.weeklyIncomeEditMode == true
                                  ? BorderSide.none
                                  : const BorderSide(color: borderColor))),
                      child: Column(
                        children: [
                          constraints!.maxWidth > 1000 || weeklyIncomeDataVisibilityController.weeklyDataVisibility == true && weeklyIncomeDataVisibilityController.incomeListVisibility == false
                              ? Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(weeklyEditModeController.weeklyIncomeEditMode == true ? 3 : 2.95),
                                    1: const FlexColumnWidth(2),
                                    2: const FlexColumnWidth(2),
                                    3: const FlexColumnWidth(2),
                                    4: const FlexColumnWidth(2),
                                    5: const FlexColumnWidth(1),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        incomeName,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        paidOn,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        every,
                                        style: columnNameListStyle,
                                      ),

                                      // if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
                                      Text(
                                        effectiveDate,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        amount,
                                        style: columnNameListStyle,
                                      ),
                                      if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
                                        Text(
                                          action,
                                          style: columnNameListStyle,
                                        )
                                    ]),
                                  ],
                                )
                              : Column(),
                          StreamBuilder(
                              stream: GetIncomeController.to.tempWeeklyIncomeList?.stream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: weeklyEditModeController.weeklyIncomeEditMode ? GetIncomeController.to.tempWeeklyIncomeList?.length : GetIncomeController.to.weeklyIncomesList?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: Get.height * 0.015, top: index == 0 ? Get.height * 0.01 : 0.0),
                                      child: SwipeActionCell(
                                        backgroundColor: Colors.transparent,
                                        isDraggable: constraints.maxWidth > 1000
                                            ? false
                                            : weeklyEditModeController.weeklyIncomeEditMode
                                                ? true
                                                : false,
                                        trailingActions: [
                                          SwipeAction(
                                            backgroundRadius: 5,
                                            widthSpace: 50,
                                            color: colorsFFEBEB,
                                            icon: Image.asset(
                                              deleteImage,
                                              height: Get.height * 0.025,
                                            ),
                                            onTap: (p0) {
                                              showCommonDialog(
                                                  context: context,
                                                  headerTitle: sureToDelete,
                                                  descriptionTitle: sureToDeleteSubTitle,
                                                  buttonColor: Colors.white,
                                                  saveButtonBorderColor: colorsEE4242,
                                                  noButtonTextStyle: noButtonTextStyle,
                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                  noButtonColor: Colors.black,
                                                  onPressYes: () {
                                                    GetIncomeController.to.tempWeeklyIncomeList?.removeAt(index);
                                                    GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                    // GetIncomeController.to.monthlyIncomeList?.refresh();
                                                    Get.back();
                                                  },
                                                  onPressNo: () {
                                                    Get.back();
                                                  });
                                            },
                                          ),
                                        ],
                                        key: UniqueKey(),
                                        child: boolValue == true && constraints.maxWidth < 1000
                                            ? Text(
                                                GetIncomeController.to.weeklyIncomesList?[index].name ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: blackMontserrat10W500,
                                                // textAlign: TextAlign.center,
                                              )
                                            : Table(
                                                columnWidths: const <int, TableColumnWidth>{
                                                  0: FlexColumnWidth(3),
                                                  1: FlexColumnWidth(2),
                                                  2: FlexColumnWidth(2),
                                                  3: FlexColumnWidth(2),
                                                  4: FlexColumnWidth(2),
                                                  5: FlexColumnWidth(1.1),
                                                },
                                                children: [
                                                  TableRow(
                                                    children: [
                                                      TableCell(
                                                        // verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: SizedBox(
                                                          height: weeklyEditModeController.weeklyIncomeEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                            child: weeklyEditModeController.weeklyIncomeEditMode == false
                                                                ? Text(
                                                                    GetIncomeController.to.weeklyIncomesList?[index].name ?? '',
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: blackMontserrat10W500,
                                                                    // textAlign: TextAlign.center,
                                                                  )
                                                                : commonTextFormField(
                                                                    inputAction: TextInputAction.next,
                                                                    keyboardType: TextInputType.text,
                                                                    inputFormatter: [characterInputFormatter()],
                                                                    contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                    textStyle: blackMontserrat10W500,
                                                                    textEditingController: TextEditingController(text: GetIncomeController.to.tempWeeklyIncomeList?[index].name ?? ''),
                                                                    onChangedFunction: (value) {
                                                                      GetIncomeController.to.tempWeeklyIncomeList?[index].name = value;
                                                                      // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                    },
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: weeklyEditModeController.weeklyIncomeEditMode == true ? 5 : 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: weeklyEditModeController.weeklyIncomeEditMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        value: '${GetIncomeController.to.tempWeeklyIncomeList?[index].paidOn ?? 1}'
                                                                            .toString()
                                                                            .replaceAll('1', 'Sun')
                                                                            .replaceAll('2', 'Mon')
                                                                            .replaceAll('3', 'Tue')
                                                                            .replaceAll('4', 'Wed')
                                                                            .replaceAll('5', 'Thu')
                                                                            .replaceAll('6', 'Fri')
                                                                            .replaceAll('7', 'Sat'),
                                                                        itemList: days,
                                                                        onChanged: (item) {
                                                                          // controller1.changeDate(item: item, index: index);
                                                                          GetIncomeController.to.tempWeeklyIncomeList?[index].paidOn = int.parse(item
                                                                              .replaceAll('Sun', '1')
                                                                              .replaceAll('Mon', '2')
                                                                              .replaceAll('Tue', '3')
                                                                              .replaceAll('Wed', '4')
                                                                              .replaceAll('Thu', '5')
                                                                              .replaceAll('Fri', '6')
                                                                              .replaceAll('Sat', '7'));
                                                                          GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.weeklyIncomesList?[index].paidOn ?? 1}'
                                                                      .toString()
                                                                      .replaceAll('1', 'Sun')
                                                                      .replaceAll('2', 'Mon')
                                                                      .replaceAll('3', 'Tue')
                                                                      .replaceAll('4', 'Wed')
                                                                      .replaceAll('5', 'Thu')
                                                                      .replaceAll('6', 'Fri')
                                                                      .replaceAll('7', 'Sat'),
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(right: Get.width * 0.02),
                                                          decoration: BoxDecoration(
                                                              color: weeklyEditModeController.weeklyIncomeEditMode == true ? backGroundColor : Colors.transparent,
                                                              borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: weeklyEditModeController.weeklyIncomeEditMode == true ? 5 : 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: weeklyEditModeController.weeklyIncomeEditMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        // value: controller1.selectWeekDropDown[index],
                                                                        value: '${GetIncomeController.to.tempWeeklyIncomeList?[index].every ?? 1}W',
                                                                        itemList: weeks,
                                                                        onChanged: (item) {
                                                                          // controller1.changeItem(item: item, index: index);
                                                                          GetIncomeController.to.tempWeeklyIncomeList?[index].every = int.parse(item.replaceAll('W', ''));
                                                                          GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.weeklyIncomesList?[index].every ?? 1}W',
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(right: Get.width * 0.02),
                                                          decoration: BoxDecoration(
                                                              color: weeklyEditModeController.weeklyIncomeEditMode == true ? backGroundColor : Colors.transparent,
                                                              borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: InkWell(
                                                          onTap: () {
                                                            // _selectDate(context: context, index: index);
                                                          },
                                                          child: Container(
                                                              margin: EdgeInsets.only(right: Get.width * 0.02),
                                                              decoration: BoxDecoration(
                                                                  color: weeklyEditModeController.weeklyIncomeEditMode ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                                              // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: weeklyEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth < 1000
                                                                      ? Get.width * 0.02
                                                                      : weeklyEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth > 1000
                                                                          ? Get.width * 0.005
                                                                          : 0.0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      DateFormat('dd-MM-yyyy').format(DateTime.parse(weeklyEditModeController.weeklyIncomeEditMode
                                                                          ? GetIncomeController.to.tempWeeklyIncomeList![index].date.toString()
                                                                          : GetIncomeController.to.weeklyIncomesList![index].date.toString())),
                                                                      style: blackMontserrat10W500,
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                  constraints.maxWidth > 1000 && weeklyEditModeController.weeklyIncomeEditMode == true
                                                                      ? Image.asset(
                                                                          calendarImage2,
                                                                          height: Get.height * 0.02,
                                                                          width: Get.width * 0.010,
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.01 : Get.width * 0.0),
                                                          child: weeklyEditModeController.weeklyIncomeEditMode == false
                                                              ? Text(
                                                                  '${GetIncomeController.to.weeklyIncomesList?[index].amount ?? ''}'.toString(),
                                                                  style: blackMontserrat10W500,
                                                                  maxLines: 1,
                                                                )
                                                              : commonTextFormField(
                                                                  inputAction: TextInputAction.done,
                                                                  keyboardType: TextInputType.phone,
                                                                  inputFormatter: [digitInputFormatter()],
                                                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                  textStyle: blackMontserrat10W500,
                                                                  prefixText: '\$',
                                                                  prefixstyle: blackMontserrat10W500,
                                                                  textEditingController: TextEditingController(text: GetIncomeController.to.tempWeeklyIncomeList?[index].amount.toString() ?? ''),
                                                                  onChangedFunction: (value) {
                                                                    GetIncomeController.to.tempWeeklyIncomeList?[index].amount = int.parse(value);
                                                                    // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                  },
                                                                ),
                                                        ),
                                                      ),
                                                      if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
                                                        TableCell(
                                                          verticalAlignment: TableCellVerticalAlignment.middle,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showCommonDialog(
                                                                  context: context,
                                                                  headerTitle: sureToDelete,
                                                                  descriptionTitle: sureToDeleteSubTitle,
                                                                  buttonColor: Colors.white,
                                                                  saveButtonBorderColor: colorsEE4242,
                                                                  noButtonTextStyle: noButtonTextStyle,
                                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                                  noButtonColor: Colors.black,
                                                                  onPressYes: () {
                                                                    GetIncomeController.to.tempWeeklyIncomeList?.removeAt(index);
                                                                    GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                    // GetIncomeController.to.monthlyIncomeList?.refresh();
                                                                    Get.back();
                                                                  },
                                                                  onPressNo: () {
                                                                    Get.back();
                                                                  });
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                                // margin: const EdgeInsets.only(left: 10.0),
                                                                width: Get.width * 0.015,
                                                                height: Get.height * 0.03,
                                                                child: Image.asset(
                                                                  deleteImage,
                                                                  // height: Get.height * 0.02,
                                                                  // width: 30.0,
                                                                )),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                      ),
                                    );
                                  },
                                );
                              }),
                          Visibility(
                            visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : weeklyEditModeController.weeklyIncomeEditMode,
                            child: GetBuilder<ShowWeeklyIncomeSaveDataTextController>(
                              builder: (showWeeklyIncomeSaveTextController) {
                                return Column(
                                  children: [
                                    showWeeklyIncomeSaveTextController.weeklyIncomeShowTextWeb == false || showWeeklyIncomeSaveTextController.weeklyIncomeShowText == false
                                        ? Padding(
                                            padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? 0.0 : 10.0),
                                            child: Table(
                                              columnWidths: <int, TableColumnWidth>{
                                                0: const FlexColumnWidth(3),
                                                1: const FlexColumnWidth(2),
                                                2: const FlexColumnWidth(2),
                                                3: const FlexColumnWidth(2),
                                                4: FlexColumnWidth(constraints.maxWidth > 1000 ? 1.85 : 2),
                                              },
                                              children: [
                                                TableRow(
                                                  children: [
                                                    SizedBox(
                                                      height: Get.height * 0.044,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                        child: commonTextFormField(
                                                            hintText: incomeName,
                                                            hintStyle: blackMontserrat10W500,
                                                            keyboardType: TextInputType.text,
                                                            inputAction: TextInputAction.next,
                                                            inputFormatter: [characterInputFormatter()],
                                                            contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                            textEditingController: _weeklyIncomeNameController),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(
                                                          horizontal: 5,
                                                        ),

                                                        // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                                        // height: Get.height * 0.04,
                                                        alignment: Alignment.center,
                                                        child: GetBuilder<SelectedDropDownItem>(
                                                          builder: (dropDownController) {
                                                            return commonDropDown(
                                                                valueTextStyle: blackMontserrat10W500,
                                                                selectedItemTextStyle: blackMontserrat10W500,
                                                                hintTextStyle: blackMontserrat10W500,
                                                                hintText: day,
                                                                value: dropDownController.selectedSingleWeeklyIncomeDay,
                                                                itemList: days,
                                                                onChanged: (item) {
                                                                  dropDownController.changeSingleDay(item: item);
                                                                });
                                                          },
                                                        ),
                                                        // child: dropDownDayGetBuilder(dropDownList: dateList),
                                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                        decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5),

                                                        // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                                        // height: Get.height * 0.04,
                                                        alignment: Alignment.center,
                                                        child: GetBuilder<SelectedDropDownItem>(
                                                          builder: (weeklyDropDownController) {
                                                            return commonDropDown(
                                                                selectedItemTextStyle: blackMontserrat10W500,
                                                                valueTextStyle: blackMontserrat10W500,
                                                                hintText: week,
                                                                hintTextStyle: blackMontserrat10W500,
                                                                value: weeklyDropDownController.selectedSingleWeeklyIncomeWeek,
                                                                itemList: weeks,
                                                                onChanged: (item) {
                                                                  weeklyDropDownController.changeSingleWeek(item: item);
                                                                });
                                                          },
                                                        ),
                                                        // child: dropDownWeekGetBuilder(dropDownList: months),
                                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                        decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            _selectDate(context: context);
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: constraints.maxWidth < 1000
                                                                    ? Get.width * 0.015
                                                                    : constraints.maxWidth > 1000
                                                                        ? Get.width * 0.005
                                                                        : 0.0),
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              DateFormat('dd-MM-yyyy').format(currentDate),
                                                              style: blackMontserrat10W500,
                                                              maxLines: 1,
                                                            ),
                                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                            decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                                                          ),
                                                        )),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: commonTextFormField(
                                                          hintText: amount,
                                                          hintStyle: blackMontserrat10W500,
                                                          prefixText: '\$',
                                                          prefixstyle: blackMontserrat10W500,
                                                          keyboardType: TextInputType.phone,
                                                          inputAction: TextInputAction.done,
                                                          inputFormatter: [digitInputFormatter()],
                                                          contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                          textEditingController: _weeklyAmountController),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    Visibility(
                                      visible: constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.weeklyIncomeShowTextWeb : showWeeklyIncomeSaveTextController.weeklyIncomeShowText,
                                      replacement: Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              final controller = Get.put(SelectedDropDownItem());
                                              if (constraints.maxWidth < 1000) {
                                                GetIncomeController.to.tempWeeklyIncomeList?.add(DataModel(
                                                    name: _weeklyIncomeNameController.text,
                                                    amount: int.parse(_weeklyAmountController.text),
                                                    paidOn: int.parse(controller.selectedSingleWeeklyIncomeDay
                                                        .toString()
                                                        .replaceAll('Sun', '1')
                                                        .replaceAll('Mon', '2')
                                                        .replaceAll('Tue', '3')
                                                        .replaceAll('Wed', '4')
                                                        .replaceAll('Thu', '5')
                                                        .replaceAll('Fri', '6')
                                                        .replaceAll('Sat', '7')),
                                                    every: int.parse(controller.selectedSingleWeeklyIncomeWeek!.replaceAll('W', '')),
                                                    weekMonth: 1,
                                                    incomeOutgoing: 1,
                                                    date: currentDate.toString().replaceAll('T00:00:00.000Z', '')));
                                                // tempWeeklyIncomeList?.refresh();
                                              } else {
                                                var response = await CreateIncomeController.to.createIncome(parameter: {
                                                  'income': [
                                                    DataModel(
                                                        name: _weeklyIncomeNameController.text,
                                                        amount: int.parse(_weeklyAmountController.text),
                                                        paidOn: int.parse(controller.selectedSingleWeeklyIncomeDay
                                                            .toString()
                                                            .replaceAll('Sun', '1')
                                                            .replaceAll('Mon', '2')
                                                            .replaceAll('Tue', '3')
                                                            .replaceAll('Wed', '4')
                                                            .replaceAll('Thu', '5')
                                                            .replaceAll('Fri', '6')
                                                            .replaceAll('Sat', '7')),
                                                        every: int.parse(controller.selectedSingleWeeklyIncomeWeek!.replaceAll('W', '')),
                                                        weekMonth: 1,
                                                        incomeOutgoing: 1,
                                                        date: currentDate.toString().replaceAll('T00:00:00.000Z', ''))
                                                  ]
                                                });
                                                print("{{{{{{{{{{{{{{{{$response");
                                                if (response["success"] == true) {
                                                  GetIncomeController.to.weeklyIncomesList?.add(DataModel(
                                                      name: _weeklyIncomeNameController.text,
                                                      amount: int.parse(_weeklyAmountController.text),
                                                      paidOn: int.parse(controller.selectedSingleWeeklyIncomeDay
                                                          .toString()
                                                          .replaceAll('Sun', '1')
                                                          .replaceAll('Mon', '2')
                                                          .replaceAll('Tue', '3')
                                                          .replaceAll('Wed', '4')
                                                          .replaceAll('Thu', '5')
                                                          .replaceAll('Fri', '6')
                                                          .replaceAll('Sat', '7')),
                                                      every: int.parse(controller.selectedSingleWeeklyIncomeWeek!.replaceAll('W', '')),
                                                      weekMonth: 1,
                                                      incomeOutgoing: 1,
                                                      date: currentDate.toString().replaceAll('T00:00:00.000Z', '')));
                                                  GetIncomeController.to.weeklyIncomesList?.refresh();
                                                }
                                              }
                                              GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                              _weeklyIncomeNameController.clear();
                                              _weeklyAmountController.clear();
                                              controller.selectedSingleWeeklyIncomeWeek = null;
                                              controller.selectedSingleWeeklyIncomeDay = null;
                                              constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.changeVisibilityForWeb() : showWeeklyIncomeSaveTextController.changeVisibility();
                                            },
                                            child: Text(
                                              save,
                                              style: greenMontserrat11W500,
                                            ),
                                          ),
                                          TextButton(
                                            child: Text(
                                              cancel,
                                              style: redMontserrat11W500,
                                            ),
                                            onPressed: () {
                                              constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.changeVisibilityForWeb() : showWeeklyIncomeSaveTextController.changeVisibility();
                                              _weeklyAmountController.clear();
                                              _weeklyIncomeNameController.clear();
                                              dropDownController.selectedSingleWeeklyIncomeWeek = null;
                                              dropDownController.selectedSingleWeeklyIncomeDay = null;
                                            },
                                          )
                                        ],
                                      ),
                                      child: constraints.maxWidth > 1000 && weeklyIncomeEditMode.weeklyIncomeEditMode == true
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                              child: GestureDetector(
                                                onTap: () {
                                                  constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.changeVisibilityForWeb() : showWeeklyIncomeSaveTextController.changeVisibility();
                                                },
                                                child: Align(
                                                  alignment: const FractionalOffset(0.0, 0.0),
                                                  child: Text(
                                                    addWeeklyIncome,
                                                    style: addWeekIncomeStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    constraints.maxWidth > 1000
                        ? Container()
                        : GetBuilder<WeeklyIncomeEditModeController>(
                            builder: (weeklyCircleVisibilityController) {
                              return Visibility(
                                  visible: weeklyCircleVisibilityController.weeklyCircleAvatarVisibility,
                                  child: Positioned(
                                    right: 0,
                                    top: 1,
                                    bottom: 1,
                                    // left: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        weeklyIncomeDataVisibilityController.changeVisibility();
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: const Color(0xffF2F2F2),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: weeklyIncomeDataVisibilityController.weeklyDataVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                          child: Icon(
                                            weeklyIncomeDataVisibilityController.weeklyDataVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                            color: Colors.black,
                                            size: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          )
                  ],
                );
              },
            );
          }),
    );
  }

  monthlyExpenseData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    final dropDownController = Get.put(SelectedDropDownItem());
    TextEditingController _monthlyExpenseNameController = TextEditingController();
    TextEditingController _monthlyExpenseAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: StreamBuilder(
          stream: GetIncomeController.to.monthlyExpenseList?.stream,
          builder: (context, snapshot) {
            return GetBuilder<MonthlyExpenseEditModeController>(
              builder: (monthlyExpenseEditModeController) {
                return Stack(
                  overflow: Overflow.visible,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                      ),
                      padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == false ? 0.0 : Get.width * 0.003),
                      decoration: BoxDecoration(
                          border: Border(
                              right: monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == true &&
                                      constraints!.maxWidth < 1000 &&
                                      monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                  ? BorderSide.none
                                  : const BorderSide(color: borderColor))),
                      child: Column(
                        children: [
                          constraints!.maxWidth > 1000 ||
                                  monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == true && monthlyExpenseDataVisibilityController.monthlyExpenseListVisibility == false
                              ? Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? 3 : 2.95),
                                    1: const FlexColumnWidth(2),
                                    2: const FlexColumnWidth(2),
                                    3: const FlexColumnWidth(2),
                                    4: const FlexColumnWidth(2),
                                    5: const FlexColumnWidth(1.1),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        expenseName,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        dueOn,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        every,
                                        style: columnNameListStyle,
                                      ),

                                      // if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                                      Text(
                                        effectiveDate,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        amount,
                                        style: columnNameListStyle,
                                      ),
                                      if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                                        Text(
                                          action,
                                          style: columnNameListStyle,
                                        )
                                    ]),
                                  ],
                                )
                              : Column(),
                          StreamBuilder(
                              stream: GetIncomeController.to.tempWeeklyIncomeList?.stream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                      ? GetIncomeController.to.tempMonthlyExpenseList?.length
                                      : GetIncomeController.to.monthlyExpenseList?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: Get.height * 0.015, top: index == 0 ? Get.height * 0.01 : 0.0),
                                      child: SwipeActionCell(
                                        backgroundColor: Colors.transparent,
                                        isDraggable: constraints.maxWidth > 1000
                                            ? false
                                            : monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                ? true
                                                : false,
                                        trailingActions: [
                                          SwipeAction(
                                            backgroundRadius: 5,
                                            widthSpace: 50,
                                            color: colorsFFEBEB,
                                            icon: Image.asset(
                                              deleteImage,
                                              height: Get.height * 0.025,
                                            ),
                                            onTap: (p0) {
                                              showCommonDialog(
                                                  context: context,
                                                  headerTitle: sureToDelete,
                                                  descriptionTitle: sureToDeleteSubTitle,
                                                  buttonColor: Colors.white,
                                                  saveButtonBorderColor: colorsEE4242,
                                                  noButtonTextStyle: noButtonTextStyle,
                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                  noButtonColor: Colors.black,
                                                  onPressYes: () {
                                                    GetIncomeController.to.tempMonthlyExpenseList?.removeAt(index);

                                                    Get.back();
                                                  },
                                                  onPressNo: () {
                                                    Get.back();
                                                  });
                                            },
                                          ),
                                        ],
                                        key: UniqueKey(),
                                        child: boolValue == true && constraints.maxWidth < 1000
                                            ? Text(
                                                GetIncomeController.to.monthlyExpenseList?[index].name ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: blackMontserrat10W500,
                                                // textAlign: TextAlign.center,
                                              )
                                            : Table(
                                                columnWidths: const <int, TableColumnWidth>{
                                                  0: FlexColumnWidth(3),
                                                  1: FlexColumnWidth(2),
                                                  2: FlexColumnWidth(2),
                                                  3: FlexColumnWidth(2),
                                                  4: FlexColumnWidth(2),
                                                  5: FlexColumnWidth(1.1),
                                                },
                                                children: [
                                                  TableRow(
                                                    children: [
                                                      SizedBox(
                                                        height: monthlyExpenseEditModeController.monthlyExpenseEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                          child: monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                                              ? Text(
                                                                  GetIncomeController.to.monthlyExpenseList?[index].name ?? "",
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: blackMontserrat10W500,
                                                                )
                                                              : commonTextFormField(
                                                                  keyboardType: TextInputType.text,
                                                                  inputAction: TextInputAction.next,
                                                                  inputFormatter: [characterInputFormatter()],
                                                                  contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                  textStyle: blackMontserrat10W500,
                                                                  textEditingController: TextEditingController(text: GetIncomeController.to.tempMonthlyExpenseList?[index].name ?? ''),
                                                                  onChangedFunction: (value) {
                                                                    GetIncomeController.to.tempMonthlyExpenseList?[index].name = value;
                                                                    // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                  },
                                                                ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: monthlyExpenseEditModeController.monthlyExpenseEditMode ? 5 : 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        value: '${GetIncomeController.to.tempMonthlyExpenseList?[index].paidOn ?? 1}th'
                                                                            .replaceAllMapped('1th', (match) => '1st')
                                                                            .replaceAllMapped('2th', (match) => '2nd')
                                                                            .replaceAllMapped('3th', (match) => '3rd')
                                                                            .replaceAllMapped('11st', (match) => '11th')
                                                                            .replaceAllMapped('12nd', (match) => '12th')
                                                                            .replaceAllMapped('13rd', (match) => '13th'),
                                                                        itemList: dateList,
                                                                        onChanged: (item) {
                                                                          // controller1.changeDate(item: item, index: index);
                                                                          GetIncomeController.to.tempMonthlyExpenseList?[index].paidOn =
                                                                              int.parse(item.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', ''));
                                                                          GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.monthlyExpenseList?[index].paidOn ?? 1}th'
                                                                      .replaceAllMapped('1th', (match) => '1st')
                                                                      .replaceAllMapped('2th', (match) => '2nd')
                                                                      .replaceAllMapped('3th', (match) => '3rd')
                                                                      .replaceAllMapped('11st', (match) => '11th')
                                                                      .replaceAllMapped('12nd', (match) => '12th')
                                                                      .replaceAllMapped('13rd', (match) => '13th'),
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(right: Get.width * 0.02),
                                                          decoration: BoxDecoration(
                                                              color: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? backGroundColor : Colors.transparent,
                                                              borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: monthlyExpenseEditModeController.monthlyExpenseEditMode ? 5 : 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        value: '${GetIncomeController.to.tempMonthlyExpenseList?[index].every ?? 1} mon',
                                                                        // value: controller1.selectedMonthlyExpenseMonth[index],
                                                                        itemList: months,
                                                                        onChanged: (item) {
                                                                          GetIncomeController.to.tempMonthlyExpenseList?[index].every = int.parse(item.replaceAll('mon', '').replaceAll(' ', ''));
                                                                          GetIncomeController.to.tempWeeklyIncomeList?.refresh();
                                                                          // controller1.changeItem(item: item, index: index);
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.monthlyExpenseList?[index].every ?? 1} mon',
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(right: Get.width * 0.02),
                                                          decoration: BoxDecoration(
                                                              color: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? backGroundColor : Colors.transparent,
                                                              borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: InkWell(
                                                          onTap: () {
                                                            // _selectDate(context: context, index: index);
                                                          },
                                                          child: Container(
                                                              margin: EdgeInsets.only(right: Get.width * 0.02),
                                                              decoration: BoxDecoration(
                                                                  color: monthlyExpenseEditModeController.monthlyExpenseEditMode ? backGroundColor : Colors.transparent,
                                                                  borderRadius: BorderRadius.circular(5)),
                                                              // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth < 1000
                                                                      ? Get.width * 0.015
                                                                      : monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth > 1000
                                                                          ? Get.width * 0.005
                                                                          : 0.0),
                                                              // width: Get.width * 0.080,
                                                              // height: Get.height * 0.04,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      DateFormat('dd-MM-yyyy').format(DateTime.parse(monthlyExpenseEditModeController.monthlyExpenseEditMode
                                                                          ? GetIncomeController.to.tempMonthlyExpenseList![index].date.toString()
                                                                          : GetIncomeController.to.monthlyExpenseList![index].date.toString())),
                                                                      // tempMonthlyIncomeList![index].date.toString().replaceAll('T10:16:38.185Z', ''),
                                                                      // '${GetIncomeController.to.monthlyIncomeList?[index].date}',
                                                                      style: blackMontserrat10W500,
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                  constraints.maxWidth > 1000 && editModeController.editMode == true
                                                                      ? Image.asset(
                                                                          calendarImage2,
                                                                          height: Get.height * 0.02,
                                                                          width: Get.width * 0.010,
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.01 : Get.width * 0.0),
                                                          child: monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                                              ? Text(
                                                                  '${GetIncomeController.to.monthlyExpenseList?[index].amount ?? 1}',
                                                                  style: blackMontserrat10W500,
                                                                  maxLines: 1,
                                                                )
                                                              : commonTextFormField(
                                                                  textEditingController: TextEditingController(text: GetIncomeController.to.tempMonthlyExpenseList?[index].amount.toString() ?? ''),
                                                                  prefixText: '\$',
                                                                  keyboardType: TextInputType.phone,
                                                                  prefixstyle: blackMontserrat10W500,
                                                                  inputAction: TextInputAction.done,
                                                                  onChangedFunction: (value) {
                                                                    GetIncomeController.to.tempMonthlyExpenseList?[index].amount = int.parse(value);
                                                                  },
                                                                  inputFormatter: [digitInputFormatter()],
                                                                  contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
                                                                  textStyle: blackMontserrat10W500,
                                                                ),
                                                        ),
                                                      ),
                                                      if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                                                        TableCell(
                                                          verticalAlignment: TableCellVerticalAlignment.middle,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showCommonDialog(
                                                                  context: context,
                                                                  headerTitle: sureToDelete,
                                                                  descriptionTitle: sureToDeleteSubTitle,
                                                                  buttonColor: Colors.white,
                                                                  saveButtonBorderColor: colorsEE4242,
                                                                  noButtonTextStyle: noButtonTextStyle,
                                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                                  noButtonColor: Colors.black,
                                                                  onPressYes: () {
                                                                    GetIncomeController.to.monthlyExpenseList?.removeAt(index);
                                                                    Get.back();
                                                                  },
                                                                  onPressNo: () {
                                                                    Get.back();
                                                                  });
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                                // margin: const EdgeInsets.only(left: 10.0),
                                                                // width: Get.width * 0.015,
                                                                height: Get.height * 0.03,
                                                                child: Image.asset(
                                                                  deleteImage,
                                                                  // height: Get.height * 0.02,
                                                                  // width: 30.0,
                                                                )),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                      ),
                                    );
                                  },
                                );
                              }),
                          Visibility(
                            visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : monthlyExpenseEditModeController.monthlyExpenseEditMode,
                            child: GetBuilder<ShowMonthlyExpenseSaveDataTextController>(
                              builder: (showMonthlyExpenseSaveTextController) {
                                return Column(
                                  children: [
                                    showMonthlyExpenseSaveTextController.monthlyExpenseShowTextWeb == false || showMonthlyExpenseSaveTextController.monthlyExpenseShowText == false
                                        ? Padding(
                                            padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? 0.0 : 10.0),
                                            child: Table(
                                              columnWidths: <int, TableColumnWidth>{
                                                0: const FlexColumnWidth(3),
                                                1: const FlexColumnWidth(2),
                                                2: const FlexColumnWidth(2),
                                                3: const FlexColumnWidth(2),
                                                4: FlexColumnWidth(constraints.maxWidth > 1000 ? 1.85 : 2),
                                              },
                                              children: [
                                                TableRow(
                                                  children: [
                                                    SizedBox(
                                                      height: Get.height * 0.044,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                        child: commonTextFormField(
                                                            hintText: expenseName,
                                                            hintStyle: blackMontserrat10W500,
                                                            keyboardType: TextInputType.text,
                                                            inputAction: TextInputAction.next,
                                                            inputFormatter: [characterInputFormatter()],
                                                            contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                            textEditingController: _monthlyExpenseNameController),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(
                                                          horizontal: 5,
                                                        ),
                                                        alignment: Alignment.center,
                                                        child: GetBuilder<SelectedDropDownItem>(
                                                          builder: (dropDownController) {
                                                            return commonDropDown(
                                                                valueTextStyle: blackMontserrat10W500,
                                                                selectedItemTextStyle: blackMontserrat10W500,
                                                                hintTextStyle: blackMontserrat10W500,
                                                                hintText: chooseDate,
                                                                value: dropDownController.selectedSingleMonthlyExpenseDate,
                                                                itemList: dateList,
                                                                onChanged: (item) {
                                                                  dropDownController.changeSingleDate(item: item);
                                                                });
                                                          },
                                                        ),
                                                        // child: dropDownDayGetBuilder(dropDownList: dateList),
                                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1300 ? Get.width * 0.02 : Get.width * 0.02),
                                                        decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                                        alignment: Alignment.center,
                                                        child: GetBuilder<SelectedDropDownItem>(
                                                          builder: (monthDropDownController) {
                                                            return commonDropDown(
                                                                selectedItemTextStyle: blackMontserrat10W500,
                                                                valueTextStyle: blackMontserrat10W500,
                                                                hintText: chooseMonth,
                                                                hintTextStyle: blackMontserrat10W500,
                                                                value: monthDropDownController.selectedSingleMonthlyExpenseMonth,
                                                                itemList: months,
                                                                onChanged: (item) {
                                                                  monthDropDownController.changeSingleMonth(item: item);
                                                                });
                                                          },
                                                        ),
                                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                        decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            _selectDate(context: context);
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: constraints.maxWidth < 1000
                                                                    ? Get.width * 0.015
                                                                    : constraints.maxWidth > 1000
                                                                        ? Get.width * 0.005
                                                                        : 0.0),
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              DateFormat('dd-MM-yyyy').format(currentDate),
                                                              style: blackMontserrat10W500,
                                                              maxLines: 1,
                                                            ),
                                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                            decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                                                          ),
                                                        )),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: commonTextFormField(
                                                          hintText: amount,
                                                          hintStyle: blackMontserrat10W500,
                                                          prefixText: '\$',
                                                          prefixstyle: blackMontserrat10W500,
                                                          keyboardType: TextInputType.phone,
                                                          inputAction: TextInputAction.done,
                                                          inputFormatter: [digitInputFormatter()],
                                                          contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                          textEditingController: _monthlyExpenseAmountController),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    Visibility(
                                      visible:
                                          constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.monthlyExpenseShowTextWeb : showMonthlyExpenseSaveTextController.monthlyExpenseShowText,
                                      replacement: Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              final controller = Get.put(SelectedDropDownItem());
                                              if (constraints.maxWidth < 1000) {
                                                GetIncomeController.to.tempMonthlyExpenseList?.add(DataModel(
                                                    name: _monthlyExpenseNameController.text,
                                                    amount: int.parse(_monthlyExpenseAmountController.text),
                                                    every: int.parse(controller.selectedSingleMonthlyExpenseMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                    paidOn: int.parse(controller.selectedSingleMonthlyExpenseDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                    weekMonth: 2,
                                                    incomeOutgoing: 2,
                                                    date: currentDate.toString()));
                                                // tempMonthlyIncomeList?.refresh();
                                              } else {
                                                var response = await CreateIncomeController.to.createIncome(parameter: {
                                                  'income': [
                                                    DataModel(
                                                        name: _monthlyExpenseNameController.text,
                                                        amount: int.parse(_monthlyExpenseAmountController.text),
                                                        every: int.parse(controller.selectedSingleMonthlyExpenseMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                        paidOn:
                                                            int.parse(controller.selectedSingleMonthlyExpenseDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                        weekMonth: 2,
                                                        incomeOutgoing: 2,
                                                        date: currentDate.toString())
                                                  ]
                                                });
                                                print("{{{{{{{{{{{{{{{{$response");
                                                if (response["success"] == true) {
                                                  GetIncomeController.to.monthlyExpenseList?.add(DataModel(
                                                      name: _monthlyExpenseNameController.text,
                                                      amount: int.parse(_monthlyExpenseAmountController.text),
                                                      every: int.parse(controller.selectedSingleMonthlyExpenseMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                                                      paidOn:
                                                          int.parse(controller.selectedSingleMonthlyExpenseDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                                                      weekMonth: 2,
                                                      incomeOutgoing: 2,
                                                      date: currentDate.toString()));
                                                  GetIncomeController.to.monthlyExpenseList?.refresh();
                                                }
                                              }
                                              _monthlyExpenseNameController.clear();
                                              _monthlyExpenseAmountController.clear();
                                              controller.selectedSingleMonthlyExpenseMonth = null;
                                              controller.selectedSingleMonthlyExpenseDate = null;
                                              // setState(() {
                                              //   final controller = Get.put(SelectedDropDownItem());
                                              //   MonthlyExpensesModel.monthlyExpensesListOld
                                              //       .add(MonthlyExpensesModel(expenseName: _monthlyExpenseNameController.text, amount: _monthlyExpenseAmountController.text));
                                              //   controller.selectedMonthlyExpenseDate.add(controller.selectedSingleMonthlyExpenseDate as Object);
                                              //   controller.selectedMonthlyExpenseMonth.add(controller.selectedSingleMonthlyExpenseDate as Object);
                                              // });
                                              constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.changeVisibilityForWeb() : showMonthlyExpenseSaveTextController.changeVisibility();
                                            },
                                            child: Text(
                                              save,
                                              style: greenMontserrat11W500,
                                            ),
                                          ),
                                          TextButton(
                                            child: Text(
                                              cancel,
                                              style: redMontserrat11W500,
                                            ),
                                            onPressed: () {
                                              constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.changeVisibilityForWeb() : showMonthlyExpenseSaveTextController.changeVisibility();
                                              _monthlyExpenseAmountController.clear();
                                              _monthlyExpenseNameController.clear();
                                              dropDownController.selectedSingleMonthlyExpenseMonth = null;
                                              dropDownController.selectedSingleMonthlyExpenseDate = null;
                                            },
                                          )
                                        ],
                                      ),
                                      child: constraints.maxWidth > 1000 && monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                              child: GestureDetector(
                                                onTap: () {
                                                  constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.changeVisibilityForWeb() : showMonthlyExpenseSaveTextController.changeVisibility();
                                                },
                                                child: Align(
                                                  alignment: const FractionalOffset(0.0, 0.0),
                                                  child: Text(
                                                    addWeeklyIncome,
                                                    style: addWeekIncomeStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    constraints.maxWidth > 1000
                        ? Container()
                        : GetBuilder<MonthlyExpenseEditModeController>(
                            builder: (monthlyExpenseCircleVisibilityController) {
                              return Visibility(
                                  visible: monthlyExpenseCircleVisibilityController.monthlyExpenseCircleAvatarVisibility,
                                  child: Positioned(
                                    right: 0,
                                    top: 1,
                                    bottom: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        monthlyExpenseDataVisibilityController.changeVisibility();
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: const Color(0xffF2F2F2),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                          child: Icon(
                                            monthlyExpenseDataVisibilityController.monthlyExpenseDataVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                            color: Colors.black,
                                            size: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          )
                  ],
                );
              },
            );
          }),
    );
  }

  weeklyBudgetData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    final dropDownController = Get.put(SelectedDropDownItem());
    TextEditingController _weeklyBudgetNameController = TextEditingController();
    TextEditingController _weeklyBudgetAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: StreamBuilder(
          stream: GetIncomeController.to.weeklyBudgetList?.stream,
          builder: (context, snapshot) {
            return GetBuilder<WeeklyBudgetEditModeController>(
              builder: (editModeController) {
                return Stack(
                  overflow: Overflow.visible,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: weeklyBudgetVisibilityController.weeklyBudgetVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                      ),
                      padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == false ? 0.0 : Get.width * 0.003),
                      decoration: BoxDecoration(
                          border: Border(
                              right: weeklyBudgetVisibilityController.weeklyBudgetVisibility == true && constraints!.maxWidth < 1000 && editModeController.weeklyBudgetEditMode == false
                                  ? BorderSide.none
                                  : const BorderSide(color: borderColor))),
                      child: Column(
                        children: [
                          constraints!.maxWidth > 1000 || weeklyBudgetVisibilityController.weeklyBudgetVisibility == true && weeklyBudgetVisibilityController.weeklyBudgetVisibilityIncome == false
                              ? Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 3 : 2.95),
                                    1: const FlexColumnWidth(2),
                                    2: const FlexColumnWidth(2),
                                    3: const FlexColumnWidth(2),
                                    4: const FlexColumnWidth(2),
                                    5: const FlexColumnWidth(1.1),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        expenseName,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        resetOn,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        every,
                                        style: columnNameListStyle,
                                      ),

                                      // if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
                                      Text(
                                        effectiveDate,
                                        style: columnNameListStyle,
                                      ),
                                      Text(
                                        amount,
                                        style: columnNameListStyle,
                                      ),
                                      if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
                                        Text(
                                          action,
                                          style: columnNameListStyle,
                                        )
                                    ]),
                                  ],
                                )
                              : Column(),
                          StreamBuilder(
                              stream: GetIncomeController.to.tempWeeklyBudgetList?.stream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: editModeController.weeklyBudgetEditMode == true ? GetIncomeController.to.tempWeeklyBudgetList?.length : GetIncomeController.to.weeklyBudgetList?.length,
                                  itemBuilder: (context, index) {
                                    // if (index < MonthlyIncomeModelOld.monthlyIncomeList.length) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: Get.height * 0.015,
                                        top: index == 0 ? Get.height * 0.01 : 0.0,
                                      ),
                                      child: SwipeActionCell(
                                        backgroundColor: Colors.transparent,
                                        isDraggable: constraints.maxWidth > 1000
                                            ? false
                                            : editModeController.weeklyBudgetEditMode
                                                ? true
                                                : false,
                                        trailingActions: [
                                          SwipeAction(
                                            backgroundRadius: 5,
                                            widthSpace: 50,
                                            color: colorsFFEBEB,
                                            icon: Image.asset(
                                              deleteImage,
                                              height: Get.height * 0.025,
                                            ),
                                            onTap: (p0) {
                                              showCommonDialog(
                                                  context: context,
                                                  headerTitle: sureToDelete,
                                                  descriptionTitle: sureToDeleteSubTitle,
                                                  buttonColor: Colors.white,
                                                  saveButtonBorderColor: colorsEE4242,
                                                  noButtonTextStyle: noButtonTextStyle,
                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                  noButtonColor: Colors.black,
                                                  onPressYes: () {
                                                    GetIncomeController.to.tempWeeklyBudgetList?.removeAt(index);

                                                    Get.back();
                                                  },
                                                  onPressNo: () {
                                                    Get.back();
                                                  });
                                            },
                                          ),
                                        ],
                                        key: UniqueKey(),
                                        child: boolValue == true && constraints.maxWidth < 1000
                                            ? Text(
                                                '${GetIncomeController.to.weeklyBudgetList?[index].name}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: blackMontserrat10W500,
                                              )
                                            : Table(
                                                // columnWidths: <int, TableColumnWidth>{
                                                //   0: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 3.5 : 3.3),
                                                //   1: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 3 : 2.2),
                                                //   2: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 3 : 2.2),
                                                //   3: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 2.5 : 1.4),
                                                //   4: FlexColumnWidth(constraints.maxWidth > 1000 && weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 2.3 : 2.2),
                                                //   5: const FlexColumnWidth(1.1),
                                                // },
                                                columnWidths: const <int, TableColumnWidth>{
                                                  0: FlexColumnWidth(3),
                                                  1: FlexColumnWidth(2),
                                                  2: FlexColumnWidth(2),
                                                  3: FlexColumnWidth(2),
                                                  4: FlexColumnWidth(2),
                                                  5: FlexColumnWidth(1.1),
                                                },
                                                children: [
                                                  TableRow(
                                                    children: [
                                                      TableCell(
                                                        child: SizedBox(
                                                          height: weeklyBudgetEditModeController.weeklyBudgetEditMode ? Get.height * 0.044 : Get.height * 0.02,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                            child: editModeController.weeklyBudgetEditMode == false
                                                                ? Text(
                                                                    GetIncomeController.to.weeklyBudgetList?[index].name ?? '',
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: blackMontserrat10W500,
                                                                  )
                                                                : commonTextFormField(
                                                                    keyboardType: TextInputType.text,
                                                                    inputAction: TextInputAction.next,
                                                                    inputFormatter: [characterInputFormatter()],
                                                                    contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                                    textStyle: blackMontserrat10W500,
                                                                    textEditingController: TextEditingController(text: GetIncomeController.to.tempWeeklyBudgetList?[index].name ?? ''),
                                                                    onChangedFunction: (value) {
                                                                      GetIncomeController.to.tempWeeklyBudgetList?[index].name = value;
                                                                      // GetIncomeController.to.weeklyIncomesList?[index].name = _incomeName?.text;
                                                                    },
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: weeklyBudgetEditModeController.weeklyBudgetEditMode ? 4 : 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: editModeController.weeklyBudgetEditMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    return commonDropDown(
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        value: '${GetIncomeController.to.tempWeeklyBudgetList?[index].paidOn ?? 1}'
                                                                            .toString()
                                                                            .replaceAll('1', 'Sun')
                                                                            .replaceAll('2', 'Mon')
                                                                            .replaceAll('3', 'Tue')
                                                                            .replaceAll('4', 'Wed')
                                                                            .replaceAll('5', 'Thu')
                                                                            .replaceAll('6', 'Fri')
                                                                            .replaceAll('7', 'Sat'),
                                                                        // value: controller1.weeklyBudgetDayDropDownList[index],
                                                                        itemList: days,
                                                                        onChanged: (item) {
                                                                          GetIncomeController.to.tempWeeklyBudgetList?[index].paidOn = int.parse(item
                                                                              .replaceAll('Sun', '1')
                                                                              .replaceAll('Mon', '2')
                                                                              .replaceAll('Tue', '3')
                                                                              .replaceAll('Wed', '4')
                                                                              .replaceAll('Thu', '5')
                                                                              .replaceAll('Fri', '6')
                                                                              .replaceAll('Sat', '7'));
                                                                          GetIncomeController.to.tempWeeklyBudgetList?.refresh();
                                                                          // controller1.changeWeeklyBudgetDayList(item: item, index: index);
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.weeklyBudgetList?[index].paidOn ?? 1}'
                                                                      .toString()
                                                                      .replaceAll('1', 'Sun')
                                                                      .replaceAll('2', 'Mon')
                                                                      .replaceAll('3', 'Tue')
                                                                      .replaceAll('4', 'Wed')
                                                                      .replaceAll('5', 'Thu')
                                                                      .replaceAll('6', 'Fri')
                                                                      .replaceAll('7', 'Sat'),
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(right: Get.width * 0.02),
                                                          decoration: BoxDecoration(
                                                              color: editModeController.weeklyBudgetEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: weeklyBudgetEditModeController.weeklyBudgetEditMode ? 4 : 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: editModeController.weeklyBudgetEditMode == true
                                                              ? GetBuilder<SelectedDropDownItem>(
                                                                  builder: (controller1) {
                                                                    // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                                                    return commonDropDown(
                                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                                        valueTextStyle: blackMontserrat10W500,
                                                                        value: '${GetIncomeController.to.tempWeeklyBudgetList?[index].every ?? 1}W',
                                                                        // value: controller1.weeklyBudgetWeekDropDownList[index],
                                                                        itemList: weeks,
                                                                        onChanged: (item) {
                                                                          GetIncomeController.to.tempWeeklyBudgetList?[index].every = int.parse(item.replaceAll('W', ''));
                                                                          GetIncomeController.to.tempWeeklyBudgetList?.refresh();
                                                                          // controller1.changeWeeklyBudgetWeekList(item: item, index: index);
                                                                        });
                                                                  },
                                                                )
                                                              : Text(
                                                                  '${GetIncomeController.to.weeklyBudgetList?[index].every ?? 1}W',
                                                                  style: blackMontserrat10W500,
                                                                ),
                                                          margin: EdgeInsets.only(right: Get.width * 0.02),
                                                          decoration: BoxDecoration(
                                                              color: editModeController.weeklyBudgetEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: InkWell(
                                                          onTap: () {
                                                            // _selectDate(context: context, index: index);
                                                          },
                                                          child: Container(
                                                              margin: EdgeInsets.only(right: Get.width * 0.02),
                                                              decoration: BoxDecoration(
                                                                  color: editModeController.weeklyBudgetEditMode ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                                              // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: editModeController.weeklyBudgetEditMode == true && constraints.maxWidth < 1000
                                                                      ? Get.width * 0.02
                                                                      : editModeController.weeklyBudgetEditMode == true && constraints.maxWidth > 1000
                                                                          ? Get.width * 0.005
                                                                          : 0.0),
                                                              // width: Get.width * 0.080,
                                                              // height: Get.height * 0.04,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      DateFormat('dd-MM-yyyy').format(DateTime.parse(editModeController.weeklyBudgetEditMode
                                                                          ? GetIncomeController.to.tempWeeklyBudgetList![index].date.toString()
                                                                          : GetIncomeController.to.weeklyBudgetList![index].date.toString())),
                                                                      // tempMonthlyIncomeList![index].date.toString().replaceAll('T10:16:38.185Z', ''),
                                                                      // '${GetIncomeController.to.monthlyIncomeList?[index].date}',
                                                                      style: blackMontserrat10W500,
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                  constraints.maxWidth > 1000 && editModeController.weeklyBudgetEditMode == true
                                                                      ? Image.asset(
                                                                          calendarImage2,
                                                                          height: Get.height * 0.02,
                                                                          width: Get.width * 0.010,
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.01 : Get.width * 0.0),
                                                          child: editModeController.weeklyBudgetEditMode == false
                                                              ? Text(
                                                                  '${GetIncomeController.to.weeklyBudgetList?[index].amount ?? ''}',
                                                                  style: blackMontserrat10W500,
                                                                  maxLines: 1,
                                                                )
                                                              : commonTextFormField(
                                                                  textEditingController: TextEditingController(text: GetIncomeController.to.tempWeeklyBudgetList?[index].amount.toString() ?? ''),
                                                                  prefixText: '\$',
                                                                  keyboardType: TextInputType.phone,
                                                                  prefixstyle: blackMontserrat10W500,
                                                                  inputAction: TextInputAction.done,
                                                                  onChangedFunction: (value) {
                                                                    GetIncomeController.to.tempWeeklyBudgetList?[index].amount = int.parse(value);
                                                                  },
                                                                  inputFormatter: [digitInputFormatter()],
                                                                  contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
                                                                  textStyle: blackMontserrat10W500,
                                                                ),
                                                        ),
                                                      ),
                                                      if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
                                                        TableCell(
                                                          verticalAlignment: TableCellVerticalAlignment.middle,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showCommonDialog(
                                                                  context: context,
                                                                  headerTitle: sureToDelete,
                                                                  descriptionTitle: sureToDeleteSubTitle,
                                                                  buttonColor: Colors.white,
                                                                  saveButtonBorderColor: colorsEE4242,
                                                                  noButtonTextStyle: noButtonTextStyle,
                                                                  saveButtonTextStyle: yesButtonTextStyle,
                                                                  noButtonColor: Colors.black,
                                                                  onPressYes: () {
                                                                    GetIncomeController.to.tempWeeklyBudgetList?.removeAt(index);
                                                                    Get.back();
                                                                  },
                                                                  onPressNo: () {
                                                                    Get.back();
                                                                  });
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                                // margin: const EdgeInsets.only(left: 10.0),
                                                                width: Get.width * 0.015,
                                                                height: Get.height * 0.03,
                                                                child: Image.asset(
                                                                  deleteImage,
                                                                  // height: Get.height * 0.02,
                                                                  // width: 30.0,
                                                                )),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                      ),
                                    );
                                  },
                                );
                              }),
                          Visibility(
                            visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : editModeController.weeklyBudgetEditMode,
                            child: GetBuilder<ShowWeeklyBudgetSaveDataTextController>(
                              builder: (showSaveTextController) {
                                return Column(
                                  children: [
                                    showSaveTextController.weeklyBudgetShowTextWeb == false || showSaveTextController.weeklyBudgetShowText == false
                                        ? Padding(
                                            padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? 0.0 : 10.0),
                                            child: Table(
                                              columnWidths: <int, TableColumnWidth>{
                                                0: const FlexColumnWidth(3),
                                                1: const FlexColumnWidth(2),
                                                2: const FlexColumnWidth(2),
                                                3: const FlexColumnWidth(2),
                                                4: FlexColumnWidth(constraints.maxWidth > 1000 ? 1.85 : 2),
                                              },
                                              children: [
                                                TableRow(
                                                  children: [
                                                    TableCell(
                                                      child: SizedBox(
                                                        height: Get.height * 0.044,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                          child: commonTextFormField(
                                                              hintText: expenseName,
                                                              hintStyle: blackMontserrat10W500,
                                                              keyboardType: TextInputType.text,
                                                              inputAction: TextInputAction.next,
                                                              inputFormatter: [characterInputFormatter()],
                                                              contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                              textEditingController: _weeklyBudgetNameController),
                                                        ),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(
                                                          horizontal: 5,
                                                        ),

                                                        alignment: Alignment.center,
                                                        child: GetBuilder<SelectedDropDownItem>(
                                                          builder: (dropDownController) {
                                                            return commonDropDown(
                                                                valueTextStyle: blackMontserrat10W500,
                                                                selectedItemTextStyle: blackMontserrat10W500,
                                                                hintTextStyle: blackMontserrat10W500,
                                                                hintText: day,
                                                                value: dropDownController.weeklyBudgetDay,
                                                                itemList: days,
                                                                onChanged: (item) {
                                                                  dropDownController.changeWeeklyBudgetSingleDay(item: item);
                                                                });
                                                          },
                                                        ),
                                                        // child: dropDownDayGetBuilder(dropDownList: dateList),
                                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                        decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                                        alignment: Alignment.center,
                                                        child: GetBuilder<SelectedDropDownItem>(
                                                          builder: (monthDropDownController) {
                                                            return commonDropDown(
                                                                selectedItemTextStyle: blackMontserrat10W500,
                                                                valueTextStyle: blackMontserrat10W500,
                                                                hintText: week,
                                                                hintTextStyle: blackMontserrat10W500,
                                                                value: monthDropDownController.weeklyBudgetWeek,
                                                                itemList: weeks,
                                                                onChanged: (item) {
                                                                  monthDropDownController.changeWeeklyBudgetSingleWeek(item: item);
                                                                });
                                                          },
                                                        ),
                                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                                                        decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                    TableCell(
                                                        verticalAlignment: TableCellVerticalAlignment.fill,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            _selectDate(context: context);
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: constraints.maxWidth < 1000
                                                                    ? Get.width * 0.015
                                                                    : constraints.maxWidth > 1000
                                                                        ? Get.width * 0.005
                                                                        : 0.0),
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              DateFormat('dd-MM-yyyy').format(currentDate),
                                                              style: blackMontserrat10W500,
                                                              maxLines: 1,
                                                            ),
                                                            margin: EdgeInsets.only(right: Get.width * 0.02),
                                                            decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                                                          ),
                                                        )),
                                                    TableCell(
                                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                                      child: commonTextFormField(
                                                          hintText: amount,
                                                          hintStyle: blackMontserrat10W500,
                                                          prefixText: '\$',
                                                          prefixstyle: blackMontserrat10W500,
                                                          keyboardType: TextInputType.phone,
                                                          inputAction: TextInputAction.done,
                                                          inputFormatter: [digitInputFormatter()],
                                                          contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                                                          textEditingController: _weeklyBudgetAmountController),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    Visibility(
                                      visible: constraints.maxWidth > 1000 ? showSaveTextController.weeklyBudgetShowTextWeb : showSaveTextController.weeklyBudgetShowText,
                                      replacement: Row(
                                        children: [
                                          // SizedBox(
                                          //   width: Get.width * 0.01,
                                          // ),
                                          InkWell(
                                            onTap: () async {
                                              final controller = Get.put(SelectedDropDownItem());
                                              if (constraints.maxWidth < 1000) {
                                                GetIncomeController.to.tempWeeklyBudgetList?.add(DataModel(
                                                    name: _weeklyBudgetNameController.text,
                                                    amount: int.parse(_weeklyBudgetAmountController.text),
                                                    paidOn: int.parse(controller.weeklyBudgetDay
                                                        .toString()
                                                        .replaceAll('Sun', '1')
                                                        .replaceAll('Mon', '2')
                                                        .replaceAll('Tue', '3')
                                                        .replaceAll('Wed', '4')
                                                        .replaceAll('Thu', '5')
                                                        .replaceAll('Fri', '6')
                                                        .replaceAll('Sat', '7')),
                                                    every: int.parse(controller.weeklyBudgetWeek!.replaceAll('W', '')),
                                                    weekMonth: 1,
                                                    incomeOutgoing: 2,
                                                    date: currentDate.toString()));
                                              } else {
                                                var response = await CreateIncomeController.to.createIncome(parameter: {
                                                  'income': [
                                                    DataModel(
                                                        name: _weeklyBudgetNameController.text,
                                                        amount: int.parse(_weeklyBudgetAmountController.text),
                                                        paidOn: int.parse(controller.weeklyBudgetDay
                                                            .toString()
                                                            .replaceAll('Sun', '1')
                                                            .replaceAll('Mon', '2')
                                                            .replaceAll('Tue', '3')
                                                            .replaceAll('Wed', '4')
                                                            .replaceAll('Thu', '5')
                                                            .replaceAll('Fri', '6')
                                                            .replaceAll('Sat', '7')),
                                                        every: int.parse(controller.weeklyBudgetWeek!.replaceAll('W', '')),
                                                        weekMonth: 1,
                                                        incomeOutgoing: 2,
                                                        date: currentDate.toString())
                                                  ]
                                                });
                                                print("{{{{{{{{{{{{{{{{$response");
                                                if (response["success"] == true) {
                                                  GetIncomeController.to.weeklyBudgetList?.add(DataModel(
                                                      name: _weeklyBudgetNameController.text,
                                                      amount: int.parse(_weeklyBudgetAmountController.text),
                                                      paidOn: int.parse(controller.weeklyBudgetDay
                                                          .toString()
                                                          .replaceAll('Sun', '1')
                                                          .replaceAll('Mon', '2')
                                                          .replaceAll('Tue', '3')
                                                          .replaceAll('Wed', '4')
                                                          .replaceAll('Thu', '5')
                                                          .replaceAll('Fri', '6')
                                                          .replaceAll('Sat', '7')),
                                                      every: int.parse(controller.weeklyBudgetWeek!.replaceAll('W', '')),
                                                      weekMonth: 1,
                                                      incomeOutgoing: 2,
                                                      date: currentDate.toString()));
                                                  GetIncomeController.to.weeklyBudgetList?.refresh();
                                                }
                                              }
                                              GetIncomeController.to.tempWeeklyBudgetList?.refresh();
                                              _weeklyBudgetNameController.clear();
                                              _weeklyBudgetAmountController.clear();
                                              controller.weeklyBudgetDay = null;
                                              controller.weeklyBudgetWeek = null;
                                              constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                            },
                                            child: Text(
                                              save,
                                              style: greenMontserrat11W500,
                                            ),
                                          ),
                                          TextButton(
                                            child: Text(
                                              cancel,
                                              style: redMontserrat11W500,
                                            ),
                                            onPressed: () {
                                              constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                              _weeklyBudgetAmountController.clear();
                                              _weeklyBudgetNameController.clear();
                                              dropDownController.weeklyBudgetDay = null;
                                              dropDownController.weeklyBudgetWeek = null;
                                            },
                                          )
                                        ],
                                      ),
                                      child: constraints.maxWidth > 1000 && editModeController.weeklyBudgetEditMode == true
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                              child: GestureDetector(
                                                onTap: () {
                                                  constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                                },
                                                child: Align(
                                                  alignment: const FractionalOffset(0.0, 0.0),
                                                  child: Text(
                                                    addWeeklyBudget,
                                                    style: addWeekIncomeStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    constraints.maxWidth > 1000
                        ? Container()
                        : GetBuilder<WeeklyBudgetEditModeController>(
                            builder: (circleVisibilityController) {
                              return Visibility(
                                  visible: circleVisibilityController.weeklyBudgetCircleAvatarVisibility,
                                  child: Positioned(
                                    right: 0,
                                    top: 1,
                                    bottom: 1,
                                    // left: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        weeklyBudgetVisibilityController.changeVisibility();
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: const Color(0xffF2F2F2),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: weeklyBudgetVisibilityController.weeklyBudgetVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                          child: Icon(
                                            weeklyBudgetVisibilityController.weeklyBudgetVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                            color: Colors.black,
                                            size: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          )
                  ],
                );
              },
            );
          }),
    );
  }

  oneTimeIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    TextEditingController _monthlyIncomeNameController = TextEditingController();
    TextEditingController _monthlyAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: GetBuilder<OneTimeIncomeEditModeController>(
        builder: (editModeController) {
          return Stack(
            overflow: Overflow.visible,
            fit: StackFit.loose,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                ),
                padding: EdgeInsets.only(right: editModeController.oneTimeIncomeEditMode == false ? 0.0 : Get.width * 0.005),
                decoration: BoxDecoration(
                    border: Border(
                        right: oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == true && constraints!.maxWidth < 1000 && editModeController.oneTimeIncomeEditMode == false
                            ? BorderSide.none
                            : const BorderSide(color: borderColor))),
                child: Column(
                  children: [
                    constraints!.maxWidth > 1000
                        ? Table(
                            columnWidths: <int, TableColumnWidth>{
                              0: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 3.5 : 3.8),
                              1: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 3 : 3.4),
                              2: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 2 : 1),
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
                          )
                        : Column(),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: OneTimeIncomeModel.oneTimeIncomeList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: Get.height * 0.015,
                            top: index == 0 ? Get.height * 0.01 : 0.0,
                          ),
                          child: boolValue == true && constraints.maxWidth < 1000
                              ? Container(
                                  padding: EdgeInsets.only(
                                      left: editModeController.oneTimeIncomeEditMode == true
                                          ? 10
                                          : constraints.maxWidth < 1000
                                              ? 7.0
                                              : 0.0),
                                  width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                  height: editModeController.oneTimeIncomeEditMode == true ? Get.height * 0.04 : null,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${OneTimeIncomeModel.oneTimeIncomeList[index].incomeName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: blackMontserrat10W500,
                                  ),
                                  decoration: BoxDecoration(color: editModeController.oneTimeIncomeEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                )
                              : Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 3.5 : 3.6),
                                    1: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 3 : 3.1),
                                    2: FlexColumnWidth(editModeController.oneTimeIncomeEditMode == true ? 2 : 1.1),
                                  },
                                  children: [
                                    TableRow(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.045),
                                          padding: EdgeInsets.only(left: editModeController.oneTimeIncomeEditMode == true ? 10 : 0.0),
                                          width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                          height: editModeController.oneTimeIncomeEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          child: editModeController.oneTimeIncomeEditMode == false
                                              ? Text(
                                                  '${OneTimeIncomeModel.oneTimeIncomeList[index].incomeName}',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: blackMontserrat10W500,
                                                )
                                              : CommonDataTextField.commonTextField(
                                                  inputFormatter: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
                                                  hintText: OneTimeIncomeModel.oneTimeIncomeList[index].incomeName,
                                                  hintStyle: blackMontserrat10W500,
                                                  contentPadding: EdgeInsets.only(bottom: Get.height * 0.018),
                                                  textStyle: blackMontserrat10W500,
                                                ),
                                          decoration:
                                              BoxDecoration(color: editModeController.oneTimeIncomeEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: editModeController.oneTimeIncomeEditMode == true ? 10 : 0.0),
                                          width: editModeController.oneTimeIncomeEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: editModeController.oneTimeIncomeEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          child: editModeController.oneTimeIncomeEditMode == true
                                              ? InkWell(
                                                  child: Text(
                                                    '${DateFormat('dd/MM/yyyy').format(currentDate)}',
                                                    style: blackMontserrat10W500,
                                                  ),
                                                  onTap: () {
                                                    _selectDate(context: context);
                                                  },
                                                )
                                              : Text(
                                                  DateFormat('dd/MM/yyyy').format(currentDate),
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(right: editModeController.oneTimeIncomeEditMode == true ? Get.width * 0.04 : Get.width * 0.045),
                                          decoration:
                                              BoxDecoration(color: editModeController.oneTimeIncomeEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: editModeController.oneTimeIncomeEditMode == false && constraints.maxWidth > 1000 ? 7 : 0),

                                          width: editModeController.oneTimeIncomeEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.15
                                                  : Get.width * 0.06
                                              : constraints.maxWidth < 1000
                                                  ? Get.width * 0.06
                                                  : Get.width * 0.025,
                                          height: editModeController.oneTimeIncomeEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          // padding: EdgeInsets.only(left: editModeController.editMode == true ? 0 : 0.0),
                                          child: editModeController.oneTimeIncomeEditMode == false
                                              ? Text(
                                                  '${OneTimeIncomeModel.oneTimeIncomeList[index].amount}',
                                                  style: blackMontserrat10W500,
                                                  maxLines: 1,
                                                )
                                              : CommonDataTextField.commonTextField(
                                                  inputFormatter: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
                                                  hintText: OneTimeIncomeModel.oneTimeIncomeList[index].amount,
                                                  hintStyle: blackMontserrat10W500,
                                                  prefixStyle: blackMontserrat10W500,
                                                  contentPadding: EdgeInsets.only(bottom: Get.height * 0.018),
                                                  textStyle: blackMontserrat10W500,
                                                  prefixText: '\$',
                                                ),
                                          margin: EdgeInsets.only(right: constraints.maxWidth > 1000 && editModeController.oneTimeIncomeEditMode == true ? Get.width * 0.02 : Get.width * 0.0),
                                          decoration:
                                              BoxDecoration(color: editModeController.oneTimeIncomeEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                        );
                      },
                    ),
                    Visibility(
                      visible: constraints.maxWidth > 1000 ? showOneTimeIncomeSaveTextController.oneTimeIncomeShowTextWeb : editModeController.oneTimeIncomeEditMode,
                      child: GetBuilder<ShowOneTimeIncomeSaveDataTextController>(
                        builder: (showSaveTextController) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              showSaveTextController.oneTimeIncomeShowTextWeb == false || showSaveTextController.oneTimeIncomeShowText == false
                                  ? Padding(
                                      padding: EdgeInsets.only(right: editModeController.oneTimeIncomeEditMode == true ? 0.0 : 10.0),
                                      child: Table(
                                        columnWidths: <int, TableColumnWidth>{
                                          0: FlexColumnWidth(constraints.maxWidth > 1000 ? 2.85 : 2.1),
                                          1: FlexColumnWidth(constraints.maxWidth > 1000 ? 2.5 : 1.8),
                                          2: FlexColumnWidth(constraints.maxWidth > 1000 ? 0.7 : 1.15),
                                          // 3: FlexColumnWidth(weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 2.5 : 1.33),
                                          // 4: FlexColumnWidth(weeklyBudgetEditModeController.weeklyBudgetEditMode == true ? 2.3 : 2.2),
                                          // 5: const FlexColumnWidth(1),
                                        },
                                        children: [
                                          TableRow(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.09 : Get.width * 0.04),
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                                height: Get.height * 0.04,
                                                child: CommonDataTextField.commonTextField(
                                                  inputFormatter: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
                                                  controller: _monthlyIncomeNameController,
                                                  hintText: expenseName,
                                                  hintStyle: blackMontserrat10W500,
                                                  contentPadding: EdgeInsets.only(bottom: Get.height * 0.018),
                                                  textStyle: blackMontserrat10W500,
                                                ),
                                                decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _selectDate(context: context);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.11 : Get.width * 0.04),
                                                  padding: const EdgeInsets.only(
                                                    left: 6,
                                                  ),
                                                  width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.06,
                                                  height: Get.height * 0.04,
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    DateFormat('dd/MM/yyyy').format(currentDate),
                                                    style: blackMontserrat10W500,
                                                  ),
                                                  decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                ),
                                              ),
                                              Container(
                                                width: constraints.maxWidth < 1000 ? Get.width * 0.15 : Get.width * 0.06,
                                                height: Get.height * 0.04,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.only(left: Get.width * 0.005, bottom: Get.height * 0.015),
                                                child: CommonDataTextField.commonTextField(
                                                  inputFormatter: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
                                                  controller: _monthlyAmountController,
                                                  prefixStyle: blackMontserrat10W500,
                                                  prefixText: '\$',
                                                  contentPadding: EdgeInsets.only(bottom: Get.height * 0.018),
                                                  textStyle: blackMontserrat10W500,
                                                ),
                                                // margin: EdgeInsets.only(right: Get.width * 0.04),
                                                decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Visibility(
                                visible: constraints.maxWidth > 1000 ? showSaveTextController.oneTimeIncomeShowTextWeb : showSaveTextController.oneTimeIncomeShowText,
                                replacement: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          OneTimeIncomeModel.oneTimeIncomeList
                                              .add(OneTimeIncomeModel(incomeName: _monthlyIncomeNameController.text, amount: _monthlyAmountController.text, dateTime: currentDate));
                                        });
                                        constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                      },
                                      child: Text(
                                        save,
                                        style: greenMontserrat11W500,
                                      ),
                                    ),
                                    TextButton(
                                      child: Text(
                                        cancel,
                                        style: redMontserrat11W500,
                                      ),
                                      onPressed: () {
                                        constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                        _monthlyAmountController.clear();
                                        _monthlyIncomeNameController.clear();
                                      },
                                    )
                                  ],
                                ),
                                child: constraints.maxWidth > 1000 && oneTimeIncomeEditMode.oneTimeIncomeEditMode == true
                                    ? Container()
                                    : Padding(
                                        padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                        child: GestureDetector(
                                          onTap: () {
                                            constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                          },
                                          child: Text(
                                            addOneTimeIncome2,
                                            style: addWeekIncomeStyle,
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              constraints.maxWidth > 1000
                  ? Container()
                  : GetBuilder<OneTimeIncomeEditModeController>(
                      builder: (circleVisibilityController) {
                        return Visibility(
                            visible: circleVisibilityController.oneTimeIncomeCircleAvatarVisibility,
                            child: Positioned(
                              right: 0,
                              top: 1,
                              bottom: 1,
                              // left: 0,
                              child: GestureDetector(
                                onTap: () {
                                  oneTimeIncomeExpansionVisibilityController.changeVisibility();
                                },
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: const Color(0xffF2F2F2),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                    child: Icon(
                                      oneTimeIncomeExpansionVisibilityController.oneTimeIncomeVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    )
            ],
          );
        },
      ),
    );
  }

  oneTimeExpenseData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    TextEditingController _monthlyIncomeNameController = TextEditingController();
    TextEditingController _monthlyAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: GetBuilder<OneTimeExpenseEditModeController>(
        builder: (editModeController) {
          return Stack(
            overflow: Overflow.visible,
            fit: StackFit.loose,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: oneTimeExpenseExpansionVisibilityController.oneTimeExpenseVisibility == false && constraints!.maxWidth < 1000 ? 13 : 0.0,
                ),
                padding: EdgeInsets.only(right: editModeController.oneTimeExpenseEditMode == false ? 0.0 : Get.width * 0.005),
                decoration: BoxDecoration(
                    border: Border(
                        right: oneTimeExpenseExpansionVisibilityController.oneTimeExpenseVisibility == true && constraints!.maxWidth < 1000 && editModeController.oneTimeExpenseEditMode == false
                            ? BorderSide.none
                            : const BorderSide(color: borderColor))),
                child: Column(
                  children: [
                    constraints!.maxWidth > 1000
                        ? Table(
                            columnWidths: <int, TableColumnWidth>{
                              0: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 3.5 : 3.6),
                              1: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 3 : 3.1),
                              2: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 2 : 1.1),
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
                          )
                        : Column(),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: OneTimeExpenseModel.oneTimeExpenseList.length,
                      itemBuilder: (context, index) {
                        // if (index < MonthlyIncomeModelOld.monthlyIncomeList.length) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: Get.height * 0.015,
                            top: index == 0 ? Get.height * 0.01 : 0.0,
                          ),
                          child: boolValue == true && constraints.maxWidth < 1000
                              ? Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                  height: editModeController.oneTimeExpenseEditMode == true ? Get.height * 0.04 : null,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${OneTimeExpenseModel.oneTimeExpenseList[index].incomeName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: blackMontserrat10W500,
                                  ),
                                  decoration: BoxDecoration(color: editModeController.oneTimeExpenseEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                )
                              : Table(
                                  columnWidths: <int, TableColumnWidth>{
                                    0: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 3.5 : 3.8),
                                    1: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 3 : 3.3),
                                    2: FlexColumnWidth(editModeController.oneTimeExpenseEditMode == true ? 2 : 1.05),
                                  },
                                  children: [
                                    TableRow(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.045),
                                          padding: EdgeInsets.only(left: editModeController.oneTimeExpenseEditMode == true ? 10 : 0.0),
                                          width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                          height: editModeController.oneTimeExpenseEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          child: editModeController.oneTimeExpenseEditMode == false
                                              ? Text(
                                                  '${OneTimeExpenseModel.oneTimeExpenseList[index].incomeName}',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: blackMontserrat10W500,
                                                )
                                              : CommonDataTextField.commonTextField(
                                                  inputFormatter: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
                                                  hintText: OneTimeExpenseModel.oneTimeExpenseList[index].incomeName,
                                                  hintStyle: blackMontserrat10W500,
                                                  contentPadding: EdgeInsets.only(bottom: Get.height * 0.018),
                                                  textStyle: blackMontserrat10W500,
                                                ),
                                          decoration:
                                              BoxDecoration(color: editModeController.oneTimeExpenseEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: editModeController.oneTimeExpenseEditMode == true ? 6 : 0.0),
                                          width: editModeController.oneTimeExpenseEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: editModeController.oneTimeExpenseEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          child: editModeController.oneTimeExpenseEditMode == true
                                              ? InkWell(
                                                  child: Text(
                                                    '${DateFormat('dd/MM/yyyy').format(currentDate)}',
                                                    style: blackMontserrat10W500,
                                                  ),
                                                  onTap: () {
                                                    _selectDate(context: context);
                                                  },
                                                )
                                              : Text(
                                                  DateFormat('dd/MM/yyyy').format(currentDate),
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(right: editModeController.oneTimeExpenseEditMode == true ? Get.width * 0.04 : Get.width * 0.045),
                                          decoration:
                                              BoxDecoration(color: editModeController.oneTimeExpenseEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: editModeController.oneTimeExpenseEditMode == false && constraints.maxWidth > 1000 ? 7 : 0),
                                          width: editModeController.oneTimeExpenseEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.15
                                                  : Get.width * 0.06
                                              : constraints.maxWidth < 1000
                                                  ? Get.width * 0.06
                                                  : Get.width * 0.025,
                                          margin: EdgeInsets.only(right: constraints.maxWidth > 1000 && editModeController.oneTimeExpenseEditMode == true ? Get.width * 0.02 : Get.width * 0.0),
                                          height: editModeController.oneTimeExpenseEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          child: editModeController.oneTimeExpenseEditMode == false
                                              ? Text(
                                                  '${OneTimeExpenseModel.oneTimeExpenseList[index].amount}',
                                                  style: blackMontserrat10W500,
                                                  maxLines: 1,
                                                )
                                              : CommonDataTextField.commonTextField(
                                                  inputFormatter: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
                                                  hintText: OneTimeExpenseModel.oneTimeExpenseList[index].amount,
                                                  hintStyle: blackMontserrat10W500,
                                                  prefixStyle: blackMontserrat10W500,
                                                  contentPadding: EdgeInsets.only(bottom: Get.height * 0.018),
                                                  textStyle: blackMontserrat10W500,
                                                  prefixText: '\$',
                                                ),
                                          decoration:
                                              BoxDecoration(color: editModeController.oneTimeExpenseEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                        );
                      },
                    ),
                    Visibility(
                      visible: constraints.maxWidth > 1000 ? showOneTimeExpenseSaveTextController.oneTimeExpenseShowTextWeb : editModeController.oneTimeExpenseEditMode,
                      child: GetBuilder<ShowOneTimeExpenseSaveDataTextController>(
                        builder: (showSaveTextController) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              showSaveTextController.oneTimeExpenseShowTextWeb == false || showSaveTextController.oneTimeExpenseShowText == false
                                  ? Padding(
                                      padding: EdgeInsets.only(right: editModeController.oneTimeExpenseEditMode == true ? 0.0 : 10.0),
                                      child: Table(
                                        columnWidths: <int, TableColumnWidth>{
                                          0: FlexColumnWidth(constraints.maxWidth > 1000 ? 2.85 : 2.1),
                                          1: FlexColumnWidth(constraints.maxWidth > 1000 ? 2.5 : 1.8),
                                          2: FlexColumnWidth(constraints.maxWidth > 1000 ? 0.7 : 1.15),
                                        },
                                        children: [
                                          TableRow(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.09 : Get.width * 0.04),
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                                height: Get.height * 0.04,
                                                child: CommonDataTextField.commonTextField(
                                                  inputFormatter: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
                                                  controller: _monthlyIncomeNameController,
                                                  hintText: expenseName,
                                                  hintStyle: blackMontserrat10W500,
                                                  contentPadding: EdgeInsets.only(bottom: Get.height * 0.018),
                                                  textStyle: blackMontserrat10W500,
                                                ),
                                                decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // _selectDate(context: context);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.11 : Get.width * 0.04),
                                                  padding: const EdgeInsets.only(
                                                    left: 6,
                                                  ),
                                                  width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.06,
                                                  height: Get.height * 0.04,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    DateFormat('dd/MM/yyyy').format(currentDate),
                                                    style: blackMontserrat10W500,
                                                  ),
                                                  decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                                ),
                                              ),
                                              Container(
                                                width: constraints.maxWidth < 1000 ? Get.width * 0.15 : Get.width * 0.06,
                                                height: Get.height * 0.04,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.only(left: Get.width * 0.005, bottom: Get.height * 0.015),
                                                child: CommonDataTextField.commonTextField(
                                                  inputFormatter: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
                                                  controller: _monthlyAmountController,
                                                  prefixStyle: blackMontserrat10W500,
                                                  prefixText: '\$',
                                                  contentPadding: EdgeInsets.only(bottom: Get.height * 0.018),
                                                  textStyle: blackMontserrat10W500,
                                                ),
                                                margin: EdgeInsets.only(right: constraints.maxWidth > 1000 && editModeController.oneTimeExpenseEditMode == true ? Get.width * 0.02 : Get.width * 0.0),
                                                decoration: BoxDecoration(color: commonTextFieldColor, borderRadius: BorderRadius.circular(4)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Visibility(
                                visible: constraints.maxWidth > 1000 ? showSaveTextController.oneTimeExpenseShowTextWeb : showSaveTextController.oneTimeExpenseShowText,
                                replacement: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          OneTimeExpenseModel.oneTimeExpenseList
                                              .add(OneTimeExpenseModel(incomeName: _monthlyIncomeNameController.text, amount: _monthlyAmountController.text, dateTime: currentDate));
                                        });
                                        constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                      },
                                      child: Text(
                                        save,
                                        style: greenMontserrat11W500,
                                      ),
                                    ),
                                    TextButton(
                                      child: Text(
                                        cancel,
                                        style: redMontserrat11W500,
                                      ),
                                      onPressed: () {
                                        constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                        _monthlyAmountController.clear();
                                        _monthlyIncomeNameController.clear();
                                      },
                                    )
                                  ],
                                ),
                                child: constraints.maxWidth > 1000 && oneTimeExpenseEditMode.oneTimeExpenseEditMode == true
                                    ? Container()
                                    : Padding(
                                        padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                        child: GestureDetector(
                                          onTap: () {
                                            constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                          },
                                          child: Text(
                                            addOneTimeExpense2,
                                            style: addWeekIncomeStyle,
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              constraints.maxWidth > 1000
                  ? Container()
                  : GetBuilder<OneTimeExpenseEditModeController>(
                      builder: (circleVisibilityController) {
                        return Visibility(
                            visible: circleVisibilityController.oneTimeExpenseCircleAvatarVisibility,
                            child: Positioned(
                              right: 0,
                              top: 1,
                              bottom: 1,
                              // left: 0,
                              child: GestureDetector(
                                onTap: () {
                                  oneTimeExpenseExpansionVisibilityController.changeVisibility();
                                },
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: const Color(0xffF2F2F2),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: oneTimeExpenseExpansionVisibilityController.oneTimeExpenseVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                    child: Icon(
                                      oneTimeExpenseExpansionVisibilityController.oneTimeExpenseVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    )
            ],
          );
        },
      ),
    );
  }

  monthlyIncomeEditModeRow({BoxConstraints? constraints}) {
    return GetBuilder<MonthlyIncomeEditModeController>(
      builder: (controller) {
        return Row(
          children: [
            Text(
              monthlyIncome,
              style: blackMontserrat13W600,
            ),
            monthlyIncomeEditMode.editMode == false
                ? Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.06),
                    child: InkWell(
                      onTap: () {
                        final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
                        monthlyIncomeEditMode.showEditMode();

                        // if (monthlyIncomeEditMode.editMode) {
                        //   tempMonthlyIncomeList = GetIncomeController.to.monthlyIncomeList;
                        //   print(List.generate(tempMonthlyIncomeList!.length, (index) {
                        //     print(tempMonthlyIncomeList?[index].name);
                        //   }));
                        // } else {
                        //   tempMonthlyIncomeList?.clear();
                        // }
                        // if (monthlyIncomeVisibilityController.visibility == false) {
                        //   monthlyIncomeVisibilityController.changeVisibility();
                        // }
                      },
                      child: Image.asset(
                        editPenImage,
                        height: Get.height * 0.02,
                        width: Get.width * 0.05,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () async {
                          final DownController = Get.put(SelectedDropDownItem());
                          monthlyIncomeEditMode.showEditMode();
                          var response = await CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempMonthlyIncomeList}).whenComplete(() {
                            GetIncomeController.to.monthlyIncomeList?.clear();
                            GetIncomeController.to.tempMonthlyIncomeList?.clear();
                            GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "2"});
                          });
                          // GetIncomeController.to.monthlyIncomeList?.clear();
                          // if (response["success"] == true) {
                          //   GetIncomeController.to.monthlyIncomeList?.add(DataModel(
                          //       name: _monthlyIncomeNameController.text,
                          //       amount: int.parse(_monthlyIncomeAmountController.text),
                          //       every: int.parse(DownController.selectedMonth!.replaceAll('mon', '').replaceAll(' ', '')),
                          //       paidOn: int.parse(DownController.selectedDate!.replaceAll('th', '').replaceAll('st', '').replaceAll('nd', '').replaceAll('rd', '')),
                          //       weekMonth: 2,
                          //       incomeOutgoing: 1,
                          //       date: currentDate.toString()));
                          //   GetIncomeController.to.monthlyIncomeList?.refresh();
                          // }
                        },
                        child: Text(
                          save,
                          style: greenMontserrat11W500,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          cancel,
                          style: redMontserrat11W500,
                        ),
                        onPressed: () {
                          monthlyIncomeEditMode.showEditMode();
                          // GetIncomeController.to.monthlyIncomeList?.clear();
                          // GetIncomeController.to.tempMonthlyIncomeList?.clear();
                          // GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "2"});
                        },
                      )
                    ],
                  ),
            const Spacer(),
            GetBuilder<MonthlyIncomeExpansionChange>(
              builder: (controller) {
                return Icon(
                  controller.expansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                  color: containerColor,
                );
              },
            )
          ],
        );
      },
    );
  }

  weeklyIncomeEditModeRow({BoxConstraints? constraints}) {
    return GetBuilder<WeeklyIncomeEditModeController>(
      builder: (controller) {
        return Row(
          children: [
            Text(
              weeklyIncome,
              style: blackMontserrat13W600,
            ),
            controller.weeklyIncomeEditMode == false
                ? Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.063),
                    child: InkWell(
                      onTap: () {
                        controller.showEditMode();
                      },
                      child: Image.asset(
                        editPenImage,
                        height: Get.height * 0.02,
                        width: Get.width * 0.05,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () async {
                          controller.showEditMode();
                          // CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempWeeklyIncomeList});
                          var response = await CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempWeeklyIncomeList}).whenComplete(() {
                            GetIncomeController.to.weeklyIncomesList?.clear();
                            GetIncomeController.to.tempWeeklyIncomeList?.clear();
                            GetIncomeController.to.callIncome(parameter: {"income_outgoing": "1", "week_month": "1"});
                          });
                        },
                        child: Text(
                          save,
                          style: greenMontserrat11W500,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          cancel,
                          style: redMontserrat11W500,
                        ),
                        onPressed: () {
                          controller.showEditMode();
                        },
                      )
                    ],
                  ),
            const Spacer(),
            GetBuilder<WeeklyIncomeExpansionChange>(
              builder: (controller) {
                return Icon(
                  controller.weeklyIncomeExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                  color: containerColor,
                );
              },
            )
          ],
        );
      },
    );
  }

  monthlyExpenseEditModeRow({BoxConstraints? constraints}) {
    return GetBuilder<MonthlyExpenseEditModeController>(
      builder: (controller) {
        return Row(
          children: [
            Text(
              monthlyExpense,
              style: blackMontserrat13W600,
            ),
            controller.monthlyExpenseEditMode == false
                ? Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.06),
                    child: InkWell(
                      onTap: () {
                        controller.showEditMode();
                      },
                      child: Image.asset(
                        editPenImage,
                        height: Get.height * 0.02,
                        width: Get.width * 0.05,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          controller.showEditMode();
                          // CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempMonthlyExpenseList});
                          CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempMonthlyExpenseList}).whenComplete(() {
                            GetIncomeController.to.monthlyExpenseList?.clear();
                            GetIncomeController.to.tempMonthlyExpenseList?.clear();
                            GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "week_month": "2"});
                          });
                        },
                        child: Text(
                          save,
                          style: greenMontserrat11W500,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          cancel,
                          style: redMontserrat11W500,
                        ),
                        onPressed: () {
                          controller.showEditMode();
                          GetIncomeController.to.monthlyExpenseList?.refresh();
                        },
                      )
                    ],
                  ),
            const Spacer(),
            GetBuilder<MonthlyExpenseExpansionChange>(
              builder: (controller) {
                return Icon(
                  controller.monthlyExpenseExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                  color: containerColor,
                );
              },
            )
          ],
        );
      },
    );
  }

  weeklyBudgetEditModeRow({BoxConstraints? constraints}) {
    return GetBuilder<WeeklyBudgetEditModeController>(
      builder: (weeklyBudgetController) {
        return Row(
          children: [
            Text(
              weeklyBudget,
              style: blackMontserrat13W600,
            ),
            weeklyBudgetController.weeklyBudgetEditMode == false
                ? Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.06),
                    child: InkWell(
                      onTap: () {
                        weeklyBudgetController.showEditMode();
                      },
                      child: Image.asset(
                        editPenImage,
                        height: Get.height * 0.02,
                        width: Get.width * 0.05,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          weeklyBudgetController.showEditMode();
                          // CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempWeeklyBudgetList});
                          CreateIncomeController.to.createIncome(parameter: {'income': GetIncomeController.to.tempWeeklyBudgetList}).whenComplete(() {
                            GetIncomeController.to.weeklyBudgetList?.clear();
                            GetIncomeController.to.tempWeeklyBudgetList?.clear();
                            GetIncomeController.to.callIncome(parameter: {"income_outgoing": "2", "week_month": "1"});
                          });
                        },
                        child: Text(
                          save,
                          style: greenMontserrat11W500,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          cancel,
                          style: redMontserrat11W500,
                        ),
                        onPressed: () {
                          weeklyBudgetController.showEditMode();
                        },
                      )
                    ],
                  ),
            const Spacer(),
            GetBuilder<WeeklyBudgetExpansionChange>(
              builder: (controller) {
                return Icon(
                  controller.weeklyBudgetExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                  color: containerColor,
                );
              },
            )
          ],
        );
      },
    );
  }

  oneTimeIncomeEditModeRow({BoxConstraints? constraints}) {
    return GetBuilder<OneTimeIncomeEditModeController>(
      builder: (controller) {
        return Row(
          children: [
            Text(
              oneTimeIncome,
              style: blackMontserrat13W600,
            ),
            controller.oneTimeIncomeEditMode == false
                ? Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.06),
                    child: InkWell(
                      onTap: () {
                        controller.showEditMode();
                      },
                      child: Image.asset(
                        editPenImage,
                        height: Get.height * 0.02,
                        width: Get.width * 0.05,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          controller.showEditMode();
                        },
                        child: Text(
                          save,
                          style: greenMontserrat11W500,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          cancel,
                          style: redMontserrat11W500,
                        ),
                        onPressed: () {
                          controller.showEditMode();
                        },
                      )
                    ],
                  ),
            const Spacer(),
            GetBuilder<OneTimeIncomeExpansionChange>(
              builder: (controller) {
                return Icon(
                  controller.oneTimeIncomeExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                  color: containerColor,
                );
              },
            )
          ],
        );
      },
    );
  }

  oneTimeExpenseEditModeRow({BoxConstraints? constraints}) {
    return GetBuilder<OneTimeExpenseEditModeController>(
      builder: (controller) {
        return Row(
          children: [
            Text(
              oneTimeIExpense,
              style: blackMontserrat13W600,
            ),
            controller.oneTimeExpenseEditMode == false
                ? Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.06),
                    child: InkWell(
                      onTap: () {
                        controller.showEditMode();
                      },
                      child: Image.asset(
                        editPenImage,
                        height: Get.height * 0.02,
                        width: Get.width * 0.05,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          controller.showEditMode();
                        },
                        child: Text(
                          save,
                          style: greenMontserrat11W500,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          cancel,
                          style: redMontserrat11W500,
                        ),
                        onPressed: () {
                          controller.showEditMode();
                        },
                      )
                    ],
                  ),
            const Spacer(),
            GetBuilder<OneTimeExpenseExpansionChange>(
              builder: (controller) {
                return Icon(
                  controller.oneTimeExpenseExpansionValue == true ? Icons.remove_circle_outline_sharp : Icons.add_circle_outline_sharp,
                  color: containerColor,
                );
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _selectDate({BuildContext? context, int? index}) async {
    final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      // setState(() {
      currentDate = pickedDate;
      // });
    }
  }

  countForCashPageViewBuilderWidget({PageController? pageController, Function? onPageChanged}) {
    return PageView.builder(
      onPageChanged: (value) {
        onPageChanged!(value);
      },
      controller: pageController,
      itemCount: incomes.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(
          incomes[index],
          style: greyIncomeTexStyle10W500,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
