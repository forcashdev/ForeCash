import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/common_widget/common_dropdown.dart';
import 'package:fore_cash/common_widget/common_income_scrollable_widget.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/getx/add_monthly_expense_showtext_controller.dart';
import 'package:fore_cash/getx/add_monthly_income_controller.dart';
import 'package:fore_cash/getx/add_weekly_budget_showtext_controller.dart';
import 'package:fore_cash/getx/add_weekly_income_showtext_controller.dart';
import 'package:fore_cash/getx/dashboard_container_visibility.dart';
import 'package:fore_cash/getx/monthly_expansion_visibility_controller.dart';
import 'package:fore_cash/getx/monthly_expense_edit_mode_controller.dart';
import 'package:fore_cash/getx/monthly_expense_expansiondata_visibility_controller.dart';
import 'package:fore_cash/getx/monthlyincome_edit_mode_controller.dart';
import 'package:fore_cash/getx/pageview_pageindex_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/switch_controller.dart';
import 'package:fore_cash/getx/weekly_budget_edit_mode_controller.dart';
import 'package:fore_cash/getx/weekly_budget_expansion_visibility_controller.dart';
import 'package:fore_cash/getx/weekly_income_edit_mode_controller.dart';
import 'package:fore_cash/getx/weekly_income_expansion_visibility_controller.dart';
import 'package:fore_cash/model/monthly_expenses_model.dart';
import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/model/weekly_budget_model.dart';
import 'package:fore_cash/model/weekly_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DateTime currentDate = DateTime.now();

  final monthlyIncomeEditMode = Get.put(MonthlyIncomeEditModeController());
  final weeklyIncomeEditMode = Get.put(WeeklyIncomeEditModeController());
  final editModeController = Get.put(MonthlyIncomeEditModeController());
  final monthlyExpenseEditModeController = Get.put(MonthlyExpenseEditModeController());
  final weeklyBudgetEditModeController = Get.put(WeeklyBudgetEditModeController());
  final weeklyIncomeDataVisibilityController = Get.put(WeeklyIncomeDataVisibilityController());
  final monthlyExpenseDataVisibilityController = Get.put(MonthlyExpenseDataVisibilityController());
  final showWeeklyIncomeSaveTextController = Get.put(ShowWeeklyIncomeSaveDataTextController());
  final showMonthlyExpenseSaveTextController = Get.put(ShowMonthlyExpenseSaveDataTextController());
  final showWeeklyBudgetSaveTextController = Get.put(ShowWeeklyBudgetSaveDataTextController());
  final switchController = Get.put(SwitchController());
  final showSaveTextController = Get.put(SaveDataTextController());

  final pageIndexController = Get.put(PageViewPageIndex());
  final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
  final weeklyBudgetVisibilityController = Get.put(WeeklyBudgetVisibilityController());

  bool iconValue = true;

  @override
  Widget build(BuildContext context) {
    final visibilityController = Get.put(DashBoardVisibilityController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        PageController _pageController = PageController(viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1);
        PageController _pageController2 = PageController(
          viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
        );

        List<PageController> monthlyIncomepageControllerList = List.generate(
            MonthlyIncomeModel.monthlyIncomeList.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        List<PageController> weeklyIncomePageControllerList = List.generate(
            WeeklyIncomeModel.weeklyIncomeList.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        List<PageController> monthlyExpensePageControllerList = List.generate(
            MonthlyExpensesModel.monthlyExpensesList.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        List<PageController> weeklyBudgetPageControllerList = List.generate(
            WeeklyBudgetModel.weeklyBudgetModel.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: maxWidth ? Color(0xffebf0f4) : Color(0xffE5E5E5),
          appBar: maxWidth
              ? AppBarWithUserName.appBarWithUserNAme()
              : CommonMobileAppbar.commonMobileAppbar(
                  color: Colors.white,
                  title: Text(
                    dashBoard,
                    style: mobileAppBarStyle,
                  ),
                  actions: [
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.01),
                        child: Stack(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              padding: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: appBarActionColor,
                              ),
                              child: Image.asset(notificationImage),
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
                      Container(
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
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                    ]
                  // titleTextStyle: mobileAppBarStyle,
                  ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.015,
                ),
                maxWidth ? webHeaderRow() : mobileHeaderColumn(),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: maxWidth ? 12 : 0, right: maxWidth ? 12 : 0),
                      margin: EdgeInsets.only(top: maxWidth ? 9 : 14),
                      // height: 300,
                      width: double.infinity,
                      color: maxWidth ? Color(0xffebf0f4) : Colors.white,
                      child: Column(
                        children: [
                          maxWidth ? Container() : _mobileSimulateModeRow(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: maxWidth ? 10 : 5),
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: maxWidth ? 8 : 0),
                            decoration: BoxDecoration(color: maxWidth ? Colors.white : Color(0xffEDF2F6), borderRadius: BorderRadius.circular(maxWidth ? 5 : 0)),
                            height: 45,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 50),
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
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            _pageController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                            List.generate(monthlyIncomepageControllerList.length,
                                                (index) => monthlyIncomepageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            List.generate(weeklyIncomePageControllerList.length,
                                                (index) => weeklyIncomePageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            List.generate(weeklyIncomePageControllerList.length,
                                                (index) => monthlyExpensePageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));

                                            // _pageController2.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          },
                                          child: Icon(
                                            // onPressed: () {
                                            //   _pageController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                                            // },

                                            Icons.arrow_back_ios, size: 12.sp, color: Colors.black,
                                            // size: 20,
                                          ),
                                        ),
                                        Flexible(child: GetBuilder<PageViewPageIndex>(
                                          builder: (controller) {
                                            return PageView.builder(
                                              itemCount: dataDateList.length,
                                              scrollDirection: Axis.horizontal,
                                              controller: _pageController,
                                              itemBuilder: (context, index) {
                                                return Align(
                                                  alignment: const FractionalOffset(0.0, 0.5),
                                                  child: Text(
                                                    dataDateList[index],
                                                    style: greyDateTexStyle10W400,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                );
                                              },
                                              onPageChanged: (value) {
                                                pageIndexController.updatePageIndex(index: value);
                                                List.generate(monthlyIncomepageControllerList.length, (index) => monthlyIncomepageControllerList[index].jumpToPage(value));
                                                List.generate(weeklyIncomePageControllerList.length, (index) => weeklyIncomePageControllerList[index].jumpToPage(value));

                                                List.generate(
                                                    weeklyIncomePageControllerList.length, (index) => monthlyExpensePageControllerList[index].jumpToPage(value)); // _pageController2.jumpToPage(value);
                                                // print(value);
                                              },
                                            );
                                          },
                                        )),
                                        InkWell(
                                          onTap: () {
                                            print('>>>>>>>>>>${_pageController.position}');
                                            print(_pageController.page);

                                            _pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                            // _pageController2.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                            List.generate(monthlyIncomepageControllerList.length,
                                                (index) => monthlyIncomepageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            List.generate(weeklyIncomePageControllerList.length,
                                                (index) => weeklyIncomePageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            List.generate(weeklyIncomePageControllerList.length,
                                                (index) => monthlyExpensePageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                            // }
                                            print(_pageController.viewportFraction);
                                          },
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
                                collapsedBackgroundColor: Colors.white,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                iconColor: containerColor,
                                // tilePadding: EdgeInsets.all(0.0),
                                title: monthlyIncomeEditModeRow(),
                                children: [
                                  GetBuilder<MonthlyIncomeVisibilityController>(
                                    builder: (monthlyIncomeController) {
                                      return Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 5),
                                            decoration: BoxDecoration(
                                                // color: Colors.red,
                                                border: Border(
                                              bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                              top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                            )),
                                            child: Column(
                                              children: [
                                                monthlyIncomeController.visibility == false && monthlyIncomeController.visibilityIncome == true
                                                    ? Column()
                                                    : GetBuilder<MonthlyIncomeEditModeController>(
                                                        builder: (monthlyIncomeEditModeController) {
                                                          return Row(mainAxisAlignment: monthlyIncomeEditModeController.editMode ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween, children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(left: 5, right: monthlyIncomeEditModeController.editMode ? Get.width * 0.09 : 0),
                                                              child: Text(
                                                                expenseName,
                                                                style: columnNameListStyle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: monthlyIncomeController.visibility == false ? 0 : 14, right: monthlyIncomeEditModeController.editMode ? Get.width * 0.13 : 0),
                                                              child: Text(
                                                                paidOn,
                                                                style: columnNameListStyle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(right: monthlyIncomeEditModeController.editMode ? Get.width * 0.14 : 0),
                                                              child: Text(
                                                                every,
                                                                style: columnNameListStyle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 0.0, left: 5),
                                                              child: Text(
                                                                amount,
                                                                style: columnNameListStyle,
                                                              ),
                                                            ),
                                                          ]);
                                                        },
                                                      ),
                                                Row(
                                                  children: [
                                                    monthlyIncomeData(
                                                        boolValue: monthlyIncomeController.visibilityIncome, constraints: constraints, visibilityValue: monthlyIncomeController.visibility),
                                                    Expanded(
                                                      flex: monthlyIncomeController.visibilityIncome == true
                                                          ? 2
                                                          : constraints.maxWidth < 1000
                                                              ? 0
                                                              : 2,
                                                      child: Visibility(
                                                        visible: constraints.maxWidth < 1000 ? monthlyIncomeController.visibilityIncome : true,
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: monthlyIncomepageControllerList.length,
                                                          itemBuilder: (context, index) {
                                                            return SizedBox(
                                                              height: Get.height * 0.04,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(top: index == 0 && constraints.maxWidth < 1000 ? Get.height * 0.01 : 0.05),
                                                                child: PageView.builder(
                                                                  // scrollDirection: Axis.horizontal,
                                                                  onPageChanged: (value) {
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
                                                                    // _pageController2.jumpToPage(value);
                                                                    _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                  },
                                                                  controller: monthlyIncomepageControllerList[index],
                                                                  itemCount: incomes.length,
                                                                  itemBuilder: (BuildContext context, int index1) {
                                                                    return Text(
                                                                      incomes[index1],
                                                                      style: greyIncomeTexStyle10W500,
                                                                      textAlign: TextAlign.center,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          maxWidth
                                              ? Container()
                                              : GetBuilder<MonthlyIncomeEditModeController>(
                                                  builder: (circleVisibilityController) {
                                                    return Visibility(
                                                        visible: circleVisibilityController.circleAvatarVisibility,
                                                        child: Positioned(
                                                          top: 0,
                                                          bottom: 0,
                                                          right: monthlyIncomeController.visibility == true ? 0 : Get.width * 0.45,
                                                          // left: 0,
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              monthlyIncomeVisibilityController.changeVisibility();
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 12,
                                                              backgroundColor: Colors.red.withOpacity(0.3),
                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: monthlyIncomeController.visibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                                                child: Icon(
                                                                  monthlyIncomeController.visibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
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
                                // tilePadding: EdgeInsets.all(0.0),
                                title: weeklyIncomeEditModeRow(),
                                children: [
                                  GetBuilder<WeeklyIncomeDataVisibilityController>(
                                    builder: (weeklyIncomeDataController) {
                                      return Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 2),
                                            decoration: BoxDecoration(
                                                // color: Colors.red,
                                                border: Border(
                                              bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                              top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                            )),
                                            child: Column(
                                              children: [
                                                weeklyIncomeDataController.weeklyDataVisibility == false && weeklyIncomeDataController.incomeListVisibility == true
                                                    ? Column()
                                                    : GetBuilder<WeeklyIncomeEditModeController>(
                                                        builder: (weeklyIncomeEditModeController) {
                                                          return Row(
                                                              mainAxisAlignment: weeklyIncomeEditModeController.weeklyIncomeEditMode ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 5, right: weeklyIncomeEditModeController.weeklyIncomeEditMode ? Get.width * 0.09 : 0),
                                                                  child: Text(
                                                                    expenseName,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: weeklyIncomeDataController.weeklyDataVisibility == false ? 0 : 14,
                                                                      right: weeklyIncomeEditModeController.weeklyIncomeEditMode ? Get.width * 0.13 : 0),
                                                                  child: Text(
                                                                    paidOn,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(right: weeklyIncomeEditModeController.weeklyIncomeEditMode ? Get.width * 0.14 : 0),
                                                                  child: Text(
                                                                    every,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(right: 0.0, left: 5),
                                                                  child: Text(
                                                                    amount,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                              ]);
                                                        },
                                                      ),
                                                Row(
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
                                                      child: Visibility(
                                                        visible: constraints.maxWidth < 1000 ? weeklyIncomeDataController.incomeListVisibility : true,
                                                        child: ListView.builder(
                                                          // scrollDirection: Axis.horizontal,
                                                          // physics: const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: weeklyIncomePageControllerList.length,
                                                          itemBuilder: (context, index) {
                                                            return SizedBox(
                                                              height: Get.height * 0.04,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(top: index == 0 ? Get.height * 0.01 : 0.0),
                                                                child: PageView.builder(
                                                                  // scrollDirection: Axis.horizontal,
                                                                  onPageChanged: (value) {
                                                                    List.generate(
                                                                        monthlyIncomepageControllerList.length,
                                                                        (index) => monthlyIncomepageControllerList[index].animateToPage(value,
                                                                            duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                                    List.generate(
                                                                        monthlyExpensePageControllerList.length,
                                                                        (index) => monthlyExpensePageControllerList[index]
                                                                            .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                    _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);

                                                                    List.generate(
                                                                        weeklyBudgetPageControllerList.length,
                                                                        (index) => weeklyBudgetPageControllerList[index]
                                                                            .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                                  },
                                                                  controller: weeklyIncomePageControllerList[index],
                                                                  itemCount: incomes.length,
                                                                  itemBuilder: (BuildContext context, int index1) {
                                                                    return Text(
                                                                      incomes[index1],
                                                                      style: greyIncomeTexStyle10W500,
                                                                      textAlign: TextAlign.center,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          maxWidth
                                              ? Container()
                                              : GetBuilder<WeeklyIncomeEditModeController>(
                                                  builder: (weeklyCircleVisibilityController) {
                                                    return Visibility(
                                                        visible: weeklyCircleVisibilityController.weeklyCircleAvatarVisibility,
                                                        child: Positioned(
                                                          top: 0,
                                                          bottom: 0,
                                                          right: weeklyIncomeDataController.weeklyDataVisibility == true ? 0 : Get.width * 0.45,
                                                          // left: 0,
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              weeklyIncomeDataVisibilityController.changeVisibility();
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 12,
                                                              backgroundColor: Colors.red.withOpacity(0.3),
                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: weeklyIncomeDataController.weeklyDataVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                                                child: Icon(
                                                                  weeklyIncomeDataController.weeklyDataVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
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
                                // tilePadding: EdgeInsets.all(0.0),
                                title: monthlyExpenseEditModeRow(),
                                children: [
                                  GetBuilder<MonthlyExpenseDataVisibilityController>(
                                    builder: (monthlyExpenseDataController) {
                                      return Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 2),
                                            decoration: BoxDecoration(
                                                // color: Colors.red,
                                                border: Border(
                                              bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                              top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                            )),
                                            child: Column(
                                              children: [
                                                monthlyExpenseDataController.monthlyExpenseDataVisibility == false && monthlyExpenseDataController.monthlyExpenseListVisibility == true
                                                    ? Column()
                                                    : GetBuilder<MonthlyExpenseEditModeController>(
                                                        builder: (monthlyExpenseEditModeController) {
                                                          return Row(
                                                              mainAxisAlignment: monthlyExpenseEditModeController.monthlyExpenseEditMode ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 5, right: monthlyExpenseEditModeController.monthlyExpenseEditMode ? Get.width * 0.09 : 0),
                                                                  child: Text(
                                                                    expenseName,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: monthlyExpenseDataController.monthlyExpenseDataVisibility == false ? 0 : 14,
                                                                      right: monthlyExpenseEditModeController.monthlyExpenseEditMode ? Get.width * 0.13 : 0),
                                                                  child: Text(
                                                                    paidOn,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode ? Get.width * 0.14 : 0),
                                                                  child: Text(
                                                                    every,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(right: 0.0, left: 5),
                                                                  child: Text(
                                                                    amount,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                              ]);
                                                        },
                                                      ),
                                                Row(
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
                                                      child: Visibility(
                                                        visible: constraints.maxWidth < 1000 ? monthlyExpenseDataController.monthlyExpenseListVisibility : true,
                                                        child: ListView.builder(
                                                          // scrollDirection: Axis.horizontal,
                                                          // physics: const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: monthlyExpensePageControllerList.length,
                                                          itemBuilder: (context, index) {
                                                            return SizedBox(
                                                              height: Get.height * 0.04,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(top: index == 0 ? Get.height * 0.01 : 0.0),
                                                                child: PageView.builder(
                                                                  // scrollDirection: Axis.horizontal,
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
                                                                  },
                                                                  controller: monthlyExpensePageControllerList[index],
                                                                  itemCount: incomes.length,
                                                                  itemBuilder: (BuildContext context, int index1) {
                                                                    return Text(
                                                                      incomes[index1],
                                                                      style: greyIncomeTexStyle10W500,
                                                                      textAlign: TextAlign.center,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          maxWidth
                                              ? Container()
                                              : GetBuilder<MonthlyExpenseEditModeController>(
                                                  builder: (monthlyExpenseCircleVisibilityController) {
                                                    return Visibility(
                                                        visible: monthlyExpenseCircleVisibilityController.monthlyExpenseCircleAvatarVisibility,
                                                        child: Positioned(
                                                          top: 0,
                                                          bottom: 0,
                                                          right: monthlyExpenseDataController.monthlyExpenseDataVisibility == true ? 0 : Get.width * 0.45,
                                                          // left: 0,
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              monthlyExpenseDataVisibilityController.changeVisibility();
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 12,
                                                              backgroundColor: Colors.red.withOpacity(0.3),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.only(left: monthlyExpenseDataController.monthlyExpenseDataVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                                                child: Icon(
                                                                  monthlyExpenseDataController.monthlyExpenseDataVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
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
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: maxWidth ? 8 : 0, right: maxWidth ? 8 : 0, bottom: maxWidth ? 13 : 0.0),
                            child: Theme(
                              data: ThemeData().copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                onExpansionChanged: (value) {
                                  print(_pageController.page);
                                },
                                collapsedBackgroundColor: Colors.white,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                iconColor: containerColor,
                                // tilePadding: EdgeInsets.all(0.0),
                                title: weeklyBudgetEditModeRow(),
                                children: [
                                  GetBuilder<WeeklyBudgetVisibilityController>(
                                    builder: (weeklyBudgetController) {
                                      return Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: maxWidth ? 14 : 10, right: maxWidth ? 0 : 5),
                                            decoration: BoxDecoration(
                                                // color: Colors.red,
                                                border: Border(
                                              bottom: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                              top: maxWidth ? BorderSide.none : const BorderSide(color: borderColor),
                                            )),
                                            child: Column(
                                              children: [
                                                weeklyBudgetController.weeklyBudgetVisibility == false && weeklyBudgetController.weeklyBudgetVisibilityIncome == true
                                                    ? Column()
                                                    : GetBuilder<WeeklyBudgetEditModeController>(
                                                        builder: (weeklyBudgetEditModeController) {
                                                          return Row(
                                                              mainAxisAlignment: weeklyBudgetEditModeController.weeklyBudgetEditMode ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 5, right: weeklyBudgetEditModeController.weeklyBudgetEditMode ? Get.width * 0.09 : 0),
                                                                  child: Text(
                                                                    expenseName,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: weeklyBudgetController.weeklyBudgetVisibility == false ? 0 : 14,
                                                                      right: weeklyBudgetEditModeController.weeklyBudgetEditMode ? Get.width * 0.13 : 0),
                                                                  child: Text(
                                                                    paidOn,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(right: weeklyBudgetEditModeController.weeklyBudgetEditMode ? Get.width * 0.14 : 0),
                                                                  child: Text(
                                                                    every,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(right: 0.0, left: 5),
                                                                  child: Text(
                                                                    amount,
                                                                    style: columnNameListStyle,
                                                                  ),
                                                                ),
                                                              ]);
                                                        },
                                                      ),
                                                Row(
                                                  children: [
                                                    weeklyBudgetData(
                                                        boolValue: weeklyBudgetController.weeklyBudgetVisibilityIncome,
                                                        constraints: constraints,
                                                        visibilityValue: weeklyBudgetController.weeklyBudgetVisibility),
                                                    Expanded(
                                                      flex: weeklyBudgetController.weeklyBudgetVisibilityIncome == true
                                                          ? 2
                                                          : constraints.maxWidth < 1000
                                                              ? 0
                                                              : 2,
                                                      child: Visibility(
                                                        visible: constraints.maxWidth < 1000 ? weeklyBudgetController.weeklyBudgetVisibilityIncome : true,
                                                        child: CommonIncomeScrollableWidget.scrollableWidget(
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
                                                                  (index) => monthlyExpensePageControllerList[index].animateToPage(value,
                                                                      duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                              _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                            }),

                                                        // child: ListView.builder(
                                                        //   shrinkWrap: true,
                                                        //   itemCount: weeklyBudgetPageControllerList.length,
                                                        //   itemBuilder: (context, index) {
                                                        //     return SizedBox(
                                                        //       height: Get.height * 0.04,
                                                        //       child: Padding(
                                                        //         padding: EdgeInsets.only(top: index == 0 && constraints.maxWidth < 1000 ? Get.height * 0.01 : 0.05),
                                                        //         child: PageView.builder(
                                                        //           // scrollDirection: Axis.horizontal,
                                                        //           onPageChanged: (value) {
                                                        //             List.generate(
                                                        //                 monthlyIncomepageControllerList.length,
                                                        //                 (index) => monthlyIncomepageControllerList[index]
                                                        //                     .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                                        //             List.generate(
                                                        //                 weeklyIncomePageControllerList.length,
                                                        //                 (index) => weeklyIncomePageControllerList[index].animateToPage(value,
                                                        //                     duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                        //             List.generate(
                                                        //                 monthlyExpensePageControllerList.length,
                                                        //                 (index) => monthlyExpensePageControllerList[index].animateToPage(value,
                                                        //                     duration: const Duration(milliseconds: 100), curve: Curves.easeInOut)); // _pageController2.jumpToPage(value);
                                                        //             _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                        //           },
                                                        //           controller: weeklyBudgetPageControllerList[index],
                                                        //           itemCount: incomes.length,
                                                        //           itemBuilder: (BuildContext context, int index1) {
                                                        //             return Text(
                                                        //               incomes[index1],
                                                        //               style: greyIncomeTexStyle10W500,
                                                        //               textAlign: TextAlign.center,
                                                        //             );
                                                        //           },
                                                        //         ),
                                                        //       ),
                                                        //     );
                                                        //   },
                                                        // ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          maxWidth
                                              ? Container()
                                              : GetBuilder<WeeklyBudgetEditModeController>(
                                                  builder: (circleVisibilityController) {
                                                    return Visibility(
                                                        visible: circleVisibilityController.weeklyBudgetCircleAvatarVisibility,
                                                        child: Positioned(
                                                          top: 0,
                                                          bottom: 0,
                                                          right: weeklyBudgetController.weeklyBudgetVisibility == true ? 0 : Get.width * 0.45,
                                                          // left: 0,
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              weeklyBudgetVisibilityController.changeVisibility();
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 12,
                                                              backgroundColor: Colors.red.withOpacity(0.3),
                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: weeklyBudgetController.weeklyBudgetVisibility == false ? Get.width * 0.004 : Get.width * 0.01),
                                                                child: Icon(
                                                                  weeklyBudgetController.weeklyBudgetVisibility == false ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
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
                                ],
                              ),
                            ),
                          ),
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
        );
      },
    );
  }

  Widget webHeaderRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 220,
              height: Get.height * 0.06,
              decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    endOfWeekBalance,
                    style: foreCashWeeklyBalanceStyleWeb,
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: Get.height * 0.06,
            // width: 250,
            decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(7)),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thisWeekBalance,
                      style: foreCashWeeklyBalanceStyleWeb,
                    ),
                    Text(
                      incomeThisWeek,
                      style: foreCashWeeklyBalanceTextStyleWeb,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: VerticalDivider(
                    color: Colors.white,
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
                    Text(
                      expenseThisWeek,
                      style: foreCashWeeklyBalanceTextStyleWeb,
                    )
                  ],
                ),
              ],
            ),
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
                  Text(
                    simulateMode,
                    style: TextStyle(fontFamily: AppTheme.fontName, color: switchController.switchValue == true ? commonButtonColor : Colors.black, fontWeight: FontWeight.w400, fontSize: 10.sp),
                  ),
                  Switch(
                    // onChanged: toggleSwitch,
                    // value: isSwitched,
                    activeColor: commonButtonColor,
                    activeTrackColor: Colors.white,
                    inactiveThumbColor: commonTextColor2,
                    // thumbColor: commonTextColor2,
                    inactiveTrackColor: Colors.white,
                    value: switchController.switchValue,
                    onChanged: (bool value) {
                      switchController.changeSwitchValue(value: value);
                    },
                  ),
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: Get.height * 0.06,
            decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(7)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    foreCashWeeklyBalance,
                    style: foreCashWeeklyBalanceTextStyle,
                  ),
                ),
                SvgPicture.asset(
                  informationSvg,
                  height: 17.sp,
                  width: 17.sp,
                  color: Colors.white,
                ),
                // Image.asset(
                //   'assets/image/png/vector2.png',
                //   // fit: BoxFit.contain,
                //   width: Get.width * 0.035,
                //   // height: Get.height * 0.06,
                // ),
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
          height: Get.height * 0.01,
        ),
        GetBuilder<DashBoardVisibilityController>(
          builder: (controller) {
            return Visibility(
              visible: controller.visibility,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    height: Get.height * 0.07,
                    decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          thisWeekBalance,
                          style: foreCashWeeklyBalanceStyle,
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
                    height: Get.height * 0.07,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          thisWeekExpense,
                          style: foreCashWeeklyBalanceStyle,
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

  _mobileSimulateModeRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(
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
        ),
        const Spacer(),
        GetBuilder<SwitchController>(
          builder: (controller) {
            return Row(
              children: [
                Text(
                  simulateMode,
                  style: TextStyle(fontFamily: AppTheme.fontName, color: switchController.switchValue == true ? commonButtonColor : Colors.black, fontWeight: FontWeight.w400, fontSize: 11.sp),
                ),
                Switch(
                  // onChanged: toggleSwitch,
                  // value: isSwitched,
                  activeColor: commonButtonColor,
                  activeTrackColor: Colors.grey.withOpacity(0.3),
                  inactiveThumbColor: commonTextColor2,
                  // thumbColor: commonTextColor2,
                  inactiveTrackColor: Colors.grey.withOpacity(0.3),
                  value: switchController.switchValue,
                  onChanged: (bool value) {
                    switchController.changeSwitchValue(value: value);
                  },
                ),
              ],
            );
          },
        )
      ],
    );
  }

  monthlyIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    final dropDownController = Get.put(SelectedDropDownItem());
    TextEditingController _monthlyIncomeNameController = TextEditingController();
    TextEditingController _monthlyAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: GetBuilder<MonthlyIncomeEditModeController>(
        builder: (editModeController) {
          return Container(
            padding: EdgeInsets.only(right: editModeController.editMode == false ? 0.0 : Get.width * 0.005),
            decoration: BoxDecoration(
                border: Border(
                    right: monthlyIncomeVisibilityController.visibility == true && constraints!.maxWidth < 1000 && editModeController.editMode == false
                        ? BorderSide.none
                        : const BorderSide(color: borderColor))),
            child: Column(
              children: [
                constraints!.maxWidth > 1000
                    ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Padding(
                          padding: EdgeInsets.only(right: editModeController.editMode == true ? Get.width * 0.01 : 20),
                          child: Text(
                            expenseName,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: editModeController.editMode == true ? Get.width * 0.009 : 15),
                          child: Text(
                            paidOn,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: editModeController.editMode == false ? 10 : 30),
                          child: Text(
                            every,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: editModeController.editMode == false ? 25 : 0),
                          child: Text(
                            amount,
                            style: columnNameListStyle,
                          ),
                        ),
                        if (editModeController.editMode && constraints.maxWidth > 1000)
                          Text(
                            effectiveDate,
                            style: columnNameListStyle,
                          ),
                        if (editModeController.editMode && constraints.maxWidth > 1000)
                          Text(
                            action,
                            style: columnNameListStyle,
                          )
                        // Text(editModeController.editMode && constraints.maxWidth > 1000 ? 'Effective date' : ''),
                        // Text(editModeController.editMode && constraints.maxWidth > 1000 ? 'Action' : ''),
                      ])
                    : Column(),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MonthlyIncomeModel.monthlyIncomeList.length,
                  itemBuilder: (context, index) {
                    // if (index < MonthlyIncomeModel.monthlyIncomeList.length) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: Get.height * 0.015,
                        top: index == 0 ? Get.height * 0.01 : 0.0,
                      ),
                      child: Slidable(
                        enabled: constraints.maxWidth > 1000 ? false : editModeController.editMode,
                        // closeOnScroll: false,
                        actionPane: const SlidableDrawerActionPane(),
                        actionExtentRatio: 0.13,
                        secondaryActions: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                MonthlyIncomeModel.monthlyIncomeList.removeAt(index);
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(color: Color(0xffFFEBEB), borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.symmetric(horizontal: 7.0),
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  deleteImage,
                                  height: Get.height * 0.04,
                                  // width: 30.0,
                                )),
                          ),
                        ],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: editModeController.editMode == true
                                      ? 10
                                      : constraints.maxWidth < 1000
                                          ? 7.0
                                          : 0.0),
                              width: editModeController.editMode == true
                                  ? constraints.maxWidth < 1000
                                      ? Get.width * 0.3
                                      : Get.width * 0.10
                                  : constraints.maxWidth < 1000
                                      ? Get.width * 0.33
                                      : Get.width * 0.15,
                              height: editModeController.editMode == true ? Get.height * 0.04 : null,

                              // height: Get.height * 0.044,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                              child: editModeController.editMode == false
                                  ? Text(
                                      '${MonthlyIncomeModel.monthlyIncomeList[index].expenseName}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: blackMontserrat10W500,
                                    )
                                  : TextField(
                                      // controller: _updateMonthlyIncomeNameControllerList[index],
                                      style: textFieldStyle,
                                      decoration: InputDecoration(
                                          hintStyle: blackMontserrat10W500,
                                          hintText: MonthlyIncomeModel.monthlyIncomeList[index].expenseName,
                                          contentPadding: EdgeInsets.only(bottom: 19),
                                          border: InputBorder.none),
                                    ),
                              decoration: BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                            ),
                            Expanded(
                              child: Visibility(
                                  visible: constraints.maxWidth < 1000 ? visibilityValue as bool : true,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: editModeController.editMode == true ? 0.0 : 30.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 6),
                                          width: editModeController.editMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: editModeController.editMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    return
                                                        // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                                                        //     DropdownButtonHideUnderline(
                                                        //   child: DropdownButton(
                                                        //     value: controller1.selectedMonthlyIncomeDateList[index],
                                                        //     // value: controller.selectedItem,
                                                        //     style: blackMontserrat10W500,
                                                        //
                                                        //     items: dateList.map((String items) {
                                                        //       return DropdownMenuItem(
                                                        //         value: items,
                                                        //         child: Text(
                                                        //           items,
                                                        //           style: blackMontserrat10W500,
                                                        //         ),
                                                        //       );
                                                        //     }).toList(),
                                                        //     onChanged: (item) {
                                                        //       print(item);
                                                        //       controller1.changeDate(item: item, index: index);
                                                        //     },
                                                        //     isExpanded: true,
                                                        //
                                                        //     icon: const Icon(
                                                        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                        //       // color: AppTheme.colorGrey,
                                                        //     ),
                                                        //   ),
                                                        // );

                                                        CommonDropDown.commonDropDown(
                                                            valueTextStyle: blackMontserrat10W500,
                                                            selectedItemTextStyle: blackMontserrat10W500,
                                                            value: controller1.selectedMonthlyIncomeDateList[index],
                                                            itemList: dateList,
                                                            onChanged: (item) {
                                                              controller1.changeDate(item: item, index: index);
                                                            });
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.selectedMonthlyIncomeDateList[index] as String,
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000
                                                  ? Get.width * 0.04
                                                  : editModeController.editMode == true
                                                      ? Get.width * 0.02
                                                      : Get.width * 0.045),
                                          decoration: BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          // height: Get.height * 0.04,
                                          width: editModeController.editMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: editModeController.editMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                                    return
                                                        //   DropdownButtonHideUnderline(
                                                        //   child: DropdownButton(
                                                        //     value: controller1.selectedMonthlyIncomeMonthList[index],
                                                        //     // value: controller.selectedItem,
                                                        //     style: blackMontserrat10W500,
                                                        //     items: months.map((String items) {
                                                        //       return DropdownMenuItem(
                                                        //         value: items,
                                                        //         child: Text(
                                                        //           items,
                                                        //           style: blackMontserrat10W500,
                                                        //         ),
                                                        //       );
                                                        //     }).toList(),
                                                        //     onChanged: (item) {
                                                        //       controller1.changeItem(item: item, index: index);
                                                        //     },
                                                        //     isExpanded: true,
                                                        //
                                                        //     icon: const Icon(
                                                        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                        //       // color: AppTheme.colorGrey,
                                                        //     ),
                                                        //   ),
                                                        // );
                                                        CommonDropDown.commonDropDown(
                                                            selectedItemTextStyle: blackMontserrat10W500,
                                                            valueTextStyle: blackMontserrat10W500,
                                                            value: controller1.selectedMonthlyIncomeMonthList[index],
                                                            itemList: months,
                                                            onChanged: (item) {
                                                              controller1.changeItem(item: item, index: index);
                                                            });
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.selectedMonthlyIncomeMonthList[index] as String,
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000
                                                  ? editModeController.editMode == false
                                                      ? Get.width * 0.0
                                                      : Get.width * 0.04
                                                  : Get.width * 0.02),
                                          decoration: BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          padding: EdgeInsets.only(left: editModeController.editMode == false && constraints.maxWidth > 1000 ? 7 : 0),

                                          // width: sequenceSize.width * 0.14,
                                          // height: Get.height * 0.04,
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          width: editModeController.editMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.15
                                                  : Get.width * 0.06
                                              : constraints.maxWidth < 1000
                                                  ? Get.width * 0.06
                                                  : Get.width * 0.025,
                                          height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          // padding: EdgeInsets.only(left: editModeController.editMode == true ? 0 : 0.0),
                                          child: editModeController.editMode == false
                                              ? Text(
                                                  '${MonthlyIncomeModel.monthlyIncomeList[index].amount}',
                                                  style: blackMontserrat10W500,
                                                  maxLines: 1,
                                                  // overflow: TextOverflow.ellipsis,
                                                )
                                              : TextField(
                                                  // controller: _updateMonthlyAmountControllerList[index],
                                                  style: textFieldStyle,
                                                  decoration: InputDecoration(
                                                      hintStyle: blackMontserrat10W500,
                                                      hintText: MonthlyIncomeModel.monthlyIncomeList[index].amount,
                                                      prefixStyle: blackMontserrat10W500,
                                                      prefixText: '\$',
                                                      contentPadding: const EdgeInsets.only(bottom: 17),
                                                      border: InputBorder.none),
                                                ),
                                          margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.01 : Get.width * 0.0),
                                          decoration: BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        if (editModeController.editMode == true && constraints.maxWidth > 1000)
                                          InkWell(
                                            onTap: () {
                                              _selectDate(context: context);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(5)),
                                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                padding: EdgeInsets.all(5.0),
                                                width: Get.width * 0.080,
                                                height: Get.height * 0.04,
                                                child: Text(
                                                  '$currentDate',
                                                  style: TextStyle(fontSize: 10.sp),
                                                  overflow: TextOverflow.ellipsis,
                                                )),
                                          ),

                                        if (editModeController.editMode && constraints.maxWidth > 1000)
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                MonthlyIncomeModel.monthlyIncomeList.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                margin: EdgeInsets.only(left: 10.0),
                                                width: Get.width * 0.015,
                                                height: Get.height * 0.03,
                                                child: Image.asset(
                                                  deleteImage,
                                                  height: Get.height * 0.02,
                                                  // width: 30.0,
                                                )),
                                          ),
                                        // Visibility(
                                        //   visible: editModeController.editMode,
                                        //   child: InkWell(
                                        //     onTap: () {
                                        //       _selectDate(context: context);
                                        //     },
                                        //     child: Container(
                                        //         decoration: BoxDecoration(color: Color(0xffFFEBEB), borderRadius: BorderRadius.circular(5)),
                                        //         margin: EdgeInsets.symmetric(horizontal: 7.0),
                                        //         padding: EdgeInsets.all(5.0),
                                        //         width: 30,
                                        //         child: Image.asset(
                                        //           'assets/image/png/deleteImg.png',
                                        //           height: Get.height * 0.02,
                                        //           // width: 30.0,
                                        //         )),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Visibility(
                  visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : editModeController.editMode,
                  child: GetBuilder<SaveDataTextController>(
                    builder: (showSaveTextController) {
                      return Column(
                        children: [
                          showSaveTextController.showTextWeb == false || showSaveTextController.showText == false
                              ? Padding(
                                  padding: EdgeInsets.only(right: editModeController.editMode == true ? 0.0 : 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        // width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.15,
                                        // height: Get.height * 0.04,

                                        width:
                                            // editModeController.editMode == true
                                            //     ?
                                            constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                        // : constraints.maxWidth < 1000
                                        //     ? Get.width * 0.33
                                        //     : Get.width * 0.15,
                                        height:
                                            // editModeController.editMode == true ?
                                            Get.height * 0.04,
                                        // : null,
                                        // alignment: Alignment.center,
                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.073
                                            // left: constraints.maxWidth < 1000
                                            //     ? constraints.maxWidth < 800
                                            //         ? Get.width * 0.04
                                            //         : Get.width * 0.03
                                            //     : 37
                                            ),
                                        child: TextField(
                                          controller: _monthlyIncomeNameController,
                                          style: blackMontserrat10W500,
                                          decoration: InputDecoration(hintStyle: blackMontserrat10W500, hintText: expenseName, contentPadding: EdgeInsets.only(bottom: 15), border: InputBorder.none),
                                        ),
                                        decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                      ),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 6,
                                            ),
                                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            child: GetBuilder<SelectedDropDownItem>(
                                              builder: (dropDownController) {
                                                return
                                                    //   DropdownButtonHideUnderline(
                                                    //   child: DropdownButton(
                                                    //     hint: Text(
                                                    //       chooseDate,
                                                    //       style: blackMontserrat10W500,
                                                    //     ),
                                                    //     value: dropDownController.selectedSingleDate,
                                                    //     // value: controller.selectedItem,
                                                    //     style: dropDownStyle,
                                                    //     items: dateList.map((String items) {
                                                    //       return DropdownMenuItem(
                                                    //         value: items,
                                                    //         child: Text(
                                                    //           items,
                                                    //           style: blackMontserrat10W500,
                                                    //         ),
                                                    //       );
                                                    //     }).toList(),
                                                    //     onChanged: (item) {
                                                    //       dropDownController.changeSingleDate(item: item);
                                                    //     },
                                                    //     isExpanded: true,
                                                    //
                                                    //     icon: const Icon(
                                                    //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                    //       // color: AppTheme.colorGrey,
                                                    //     ),
                                                    //   ),
                                                    // );
                                                    CommonDropDown.commonDropDown(
                                                        valueTextStyle: blackMontserrat10W500,
                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                        hintTextStyle: blackMontserrat10W500,
                                                        hintText: chooseDate,
                                                        value: dropDownController.selectedSingleDate,
                                                        itemList: dateList,
                                                        onChanged: (item) {
                                                          dropDownController.changeSingleDate(item: item);
                                                        });
                                              },
                                            ),
                                            // child: dropDownDayGetBuilder(dropDownList: dateList),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.05),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 6),
                                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            child: GetBuilder<SelectedDropDownItem>(
                                              builder: (monthDropDownController) {
                                                // return commonDropDown(itemList: dropDownList, value: controller.selectedSingleWeek);
                                                // return DropdownButtonHideUnderline(
                                                //   child: DropdownButton(
                                                //     hint: Text(
                                                //       chooseMonth,
                                                //       style: blackMontserrat10W500,
                                                //     ),
                                                //     value: monthDropDownController.selectedSingleMonth,
                                                //     // value: controller.selectedItem,
                                                //     style: dropDownStyle,
                                                //     items: months.map((String items) {
                                                //       return DropdownMenuItem(
                                                //         value: items,
                                                //         child: Text(
                                                //           items,
                                                //           style: blackMontserrat10W500,
                                                //         ),
                                                //       );
                                                //     }).toList(),
                                                //     onChanged: (item) {
                                                //       monthDropDownController.changeSingleMonth(item: item);
                                                //     },
                                                //     isExpanded: true,
                                                //
                                                //     icon: const Icon(
                                                //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                //       // color: AppTheme.colorGrey,
                                                //     ),
                                                //   ),
                                                // );
                                                return CommonDropDown.commonDropDown(
                                                    selectedItemTextStyle: blackMontserrat10W500,
                                                    valueTextStyle: blackMontserrat10W500,
                                                    hintText: chooseMonth,
                                                    hintTextStyle: blackMontserrat10W500,
                                                    value: monthDropDownController.selectedSingleMonth,
                                                    itemList: months,
                                                    onChanged: (item) {
                                                      monthDropDownController.changeSingleMonth(item: item);
                                                    });
                                              },
                                            ),
                                            // child: dropDownWeekGetBuilder(dropDownList: months),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            // width: editModeController.editMode == true
                                            //     ? constraints.maxWidth < 1000
                                            //         ? Get.width * 0.18
                                            //         : 80
                                            //     : null,
                                            // // width: sequenceSize.width * 0.14,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.15 : Get.width * 0.065,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(left: Get.width * 0.005, bottom: Get.height * 0.015),
                                            child: TextField(
                                              controller: _monthlyAmountController,
                                              style: blackMontserrat10W500,
                                              decoration: InputDecoration(prefixStyle: blackMontserrat10W500, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                                            ),
                                            // margin: EdgeInsets.only(right: Get.width * 0.04),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                              : Container(),
                          Visibility(
                            visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : showSaveTextController.showText,
                            replacement: Row(
                              children: [
                                // SizedBox(
                                //   width: Get.width * 0.01,
                                // ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      final controller = Get.put(SelectedDropDownItem());
                                      MonthlyIncomeModel.monthlyIncomeList.add(MonthlyIncomeModel(expenseName: _monthlyIncomeNameController.text, amount: _monthlyAmountController.text));
                                      controller.selectedMonthlyIncomeDateList.add(controller.selectedSingleDate as Object);
                                      controller.selectedMonthlyIncomeMonthList.add(controller.selectedSingleMonth as Object);
                                      // checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
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
                            child: constraints.maxWidth > 1000 && monthlyIncomeEditMode.editMode == true
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                    child: GestureDetector(
                                      onTap: () {
                                        constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                      },
                                      child: Align(
                                        alignment: FractionalOffset(0.0, 0.0),
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
          );
        },
      ),
    );
  }

  weeklyIncomeData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    final dropDownController = Get.put(SelectedDropDownItem());
    TextEditingController _weeklyIncomeNameController = TextEditingController();
    TextEditingController _weeklyAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: GetBuilder<WeeklyIncomeEditModeController>(
        builder: (weeklyEditModeController) {
          return Container(
            padding: EdgeInsets.only(right: weeklyEditModeController.weeklyIncomeEditMode == false ? 0.0 : Get.width * 0.01),
            decoration: BoxDecoration(
                border: Border(
                    right: weeklyIncomeDataVisibilityController.weeklyDataVisibility == true && constraints!.maxWidth < 1000 && weeklyEditModeController.weeklyIncomeEditMode == false
                        ? BorderSide.none
                        : const BorderSide(color: borderColor))),
            child: Column(
              children: [
                constraints!.maxWidth > 1000
                    ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Padding(
                          padding: EdgeInsets.only(right: weeklyEditModeController.weeklyIncomeEditMode == true ? Get.width * 0.012 : 20),
                          child: Text(
                            expenseName,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: weeklyEditModeController.weeklyIncomeEditMode == true ? Get.width * 0.01 : 15),
                          child: Text(
                            paidOn,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: weeklyEditModeController.weeklyIncomeEditMode == false ? 10 : 36),
                          child: Text(
                            every,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: weeklyEditModeController.weeklyIncomeEditMode == false ? 25 : 0),
                          child: Text(
                            amount,
                            style: columnNameListStyle,
                          ),
                        ),
                        if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
                          Text(
                            effectiveDate,
                            style: columnNameListStyle,
                          ),
                        if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
                          Text(
                            action,
                            style: columnNameListStyle,
                          )
                        // Text(editModeController.editMode && constraints.maxWidth > 1000 ? 'Effective date' : ''),
                        // Text(editModeController.editMode && constraints.maxWidth > 1000 ? 'Action' : ''),
                      ])
                    : Column(),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: WeeklyIncomeModel.weeklyIncomeList.length,
                  itemBuilder: (context, index) {
                    // if (index < WeeklyIncomeModel.weeklyIncomeList.length) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: Get.height * 0.015, top: index == 0 ? Get.height * 0.01 : 0.0),
                      child: Slidable(
                        enabled: constraints.maxWidth > 1000 ? false : weeklyEditModeController.weeklyIncomeEditMode,
                        // closeOnScroll: false,
                        actionPane: const SlidableDrawerActionPane(),
                        actionExtentRatio: 0.13,
                        secondaryActions: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                WeeklyIncomeModel.weeklyIncomeList.removeAt(index);
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(color: Color(0xffFFEBEB), borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.symmetric(horizontal: 7.0),
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  deleteImage,
                                  height: Get.height * 0.04,
                                  // width: 30.0,
                                )),
                          ),
                        ],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: weeklyEditModeController.weeklyIncomeEditMode == true
                                    ? 10
                                    : constraints.maxWidth < 1000
                                        ? 7.0
                                        : 0.0,
                              ),
                              width: weeklyEditModeController.weeklyIncomeEditMode == true
                                  ? constraints.maxWidth < 1000
                                      ? Get.width * 0.3
                                      : Get.width * 0.10
                                  : constraints.maxWidth < 1000
                                      ? Get.width * 0.33
                                      : Get.width * 0.15,
                              height: weeklyEditModeController.weeklyIncomeEditMode == true ? Get.height * 0.04 : null,

                              // height: Get.height * 0.044,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                              child: weeklyEditModeController.weeklyIncomeEditMode == false
                                  ? Text(
                                      '${WeeklyIncomeModel.weeklyIncomeList[index].expenseName}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: blackMontserrat10W500,
                                      textAlign: TextAlign.center,
                                    )
                                  : TextField(
                                      // controller: _updateMonthlyIncomeNameControllerList[index],
                                      style: textFieldStyle,
                                      decoration: InputDecoration(
                                          hintStyle: blackMontserrat10W500,
                                          hintText: WeeklyIncomeModel.weeklyIncomeList[index].expenseName,
                                          contentPadding: const EdgeInsets.only(bottom: 19),
                                          border: InputBorder.none),
                                    ),
                              decoration: BoxDecoration(color: weeklyEditModeController.weeklyIncomeEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                            ),
                            Expanded(
                              child: Visibility(
                                  visible: constraints.maxWidth < 1000 ? visibilityValue as bool : true,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: weeklyEditModeController.weeklyIncomeEditMode == true ? 0.0 : 30.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 6),
                                          width: weeklyEditModeController.weeklyIncomeEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: weeklyEditModeController.weeklyIncomeEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: weeklyEditModeController.weeklyIncomeEditMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                                                    // return DropdownButtonHideUnderline(
                                                    //   child: DropdownButton(
                                                    //     value: controller1.selectedMonthlyIncomeDateList[index],
                                                    //     // value: controller.selectedItem,
                                                    //     style: blackMontserrat10W500,
                                                    //
                                                    //     items: dateList.map((String items) {
                                                    //       return DropdownMenuItem(
                                                    //         value: items,
                                                    //         child: Text(
                                                    //           items,
                                                    //           style: blackMontserrat10W500,
                                                    //         ),
                                                    //       );
                                                    //     }).toList(),
                                                    //     onChanged: (item) {
                                                    //       controller1.changeDate(item: item, index: index);
                                                    //     },
                                                    //     isExpanded: true,
                                                    //
                                                    //     icon: const Icon(
                                                    //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                    //       // color: AppTheme.colorGrey,
                                                    //     ),
                                                    //   ),
                                                    // );
                                                    return CommonDropDown.commonDropDown(
                                                        valueTextStyle: blackMontserrat10W500,
                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                        value: controller1.selectedMonthlyIncomeDateList[index],
                                                        itemList: dateList,
                                                        onChanged: (item) {
                                                          controller1.changeDate(item: item, index: index);
                                                        });
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.selectedMonthlyIncomeDateList[index] as String,
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000
                                                  ? Get.width * 0.04
                                                  : weeklyEditModeController.weeklyIncomeEditMode == true
                                                      ? Get.width * 0.02
                                                      : Get.width * 0.045),
                                          decoration: BoxDecoration(
                                              color: weeklyEditModeController.weeklyIncomeEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          // height: Get.height * 0.04,
                                          width: weeklyEditModeController.weeklyIncomeEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: weeklyEditModeController.weeklyIncomeEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: weeklyEditModeController.weeklyIncomeEditMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                                    return
                                                        //   DropdownButtonHideUnderline(
                                                        //   child: DropdownButton(
                                                        //     value: controller1.selectedMonthlyIncomeMonthList[index],
                                                        //     // value: controller.selectedItem,
                                                        //     style: blackMontserrat10W500,
                                                        //     items: months.map((String items) {
                                                        //       return DropdownMenuItem(
                                                        //         value: items,
                                                        //         child: Text(
                                                        //           items,
                                                        //           style: blackMontserrat10W500,
                                                        //         ),
                                                        //       );
                                                        //     }).toList(),
                                                        //     onChanged: (item) {
                                                        //       controller1.changeItem(item: item, index: index);
                                                        //     },
                                                        //     isExpanded: true,
                                                        //
                                                        //     icon: const Icon(
                                                        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                        //       // color: AppTheme.colorGrey,
                                                        //     ),
                                                        //   ),
                                                        // );
                                                        CommonDropDown.commonDropDown(
                                                            selectedItemTextStyle: blackMontserrat10W500,
                                                            valueTextStyle: blackMontserrat10W500,
                                                            value: controller1.selectedMonthlyIncomeMonthList[index],
                                                            itemList: months,
                                                            onChanged: (item) {
                                                              controller1.changeItem(item: item, index: index);
                                                            });
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.selectedMonthlyIncomeMonthList[index] as String,
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000
                                                  ? weeklyEditModeController.weeklyIncomeEditMode == false
                                                      ? Get.width * 0.0
                                                      : Get.width * 0.04
                                                  : Get.width * 0.02),
                                          decoration: BoxDecoration(
                                              color: weeklyEditModeController.weeklyIncomeEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          padding: EdgeInsets.only(left: weeklyEditModeController.weeklyIncomeEditMode == false && constraints.maxWidth > 1000 ? 7 : 0),
                                          // width: sequenceSize.width * 0.14,
                                          // height: Get.height * 0.04,
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          width: weeklyEditModeController.weeklyIncomeEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.15
                                                  : Get.width * 0.06
                                              : constraints.maxWidth < 1000
                                                  ? Get.width * 0.06
                                                  : Get.width * 0.025,
                                          height: weeklyEditModeController.weeklyIncomeEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          // padding: const EdgeInsets.only(left: 10),
                                          child: weeklyEditModeController.weeklyIncomeEditMode == false
                                              ? Text(
                                                  '${WeeklyIncomeModel.weeklyIncomeList[index].amount}',
                                                  style: blackMontserrat10W500,
                                                  maxLines: 1,
                                                )
                                              : TextField(
                                                  // controller: _updateMonthlyAmountControllerList[index],
                                                  style: textFieldStyle,
                                                  decoration: InputDecoration(
                                                      hintStyle: blackMontserrat10W500,
                                                      hintText: MonthlyIncomeModel.monthlyIncomeList[index].amount,
                                                      prefixStyle: blackMontserrat10W500,
                                                      prefixText: '\$',
                                                      contentPadding: const EdgeInsets.only(bottom: 16),
                                                      border: InputBorder.none),
                                                ),
                                          margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.01 : Get.width * 0.0),
                                          decoration: BoxDecoration(
                                              color: weeklyEditModeController.weeklyIncomeEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        if (weeklyEditModeController.weeklyIncomeEditMode == true && constraints.maxWidth > 1000)
                                          InkWell(
                                            onTap: () {
                                              _selectDate(context: context);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(5)),
                                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                                padding: EdgeInsets.all(5.0),
                                                width: Get.width * 0.080,
                                                height: Get.height * 0.04,
                                                child: Text(
                                                  '$currentDate',
                                                  style: TextStyle(fontSize: 10.sp),
                                                  overflow: TextOverflow.ellipsis,
                                                )),
                                          ),
                                        if (weeklyEditModeController.weeklyIncomeEditMode && constraints.maxWidth > 1000)
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                MonthlyIncomeModel.monthlyIncomeList.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                margin: EdgeInsets.only(left: 10.0),
                                                width: Get.width * 0.015,
                                                height: Get.height * 0.03,
                                                child: Image.asset(
                                                  deleteImage,
                                                  height: Get.height * 0.02,
                                                  // width: 30.0,
                                                )),
                                          ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                    // } else {
                    //   return ;
                    // }
                  },
                ),
                Visibility(
                  visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : weeklyEditModeController.weeklyIncomeEditMode,
                  child: GetBuilder<ShowWeeklyIncomeSaveDataTextController>(
                    builder: (showWeeklyIncomeSaveTextController) {
                      return Column(
                        children: [
                          showWeeklyIncomeSaveTextController.weeklyIncomeShowTextWeb == false || showWeeklyIncomeSaveTextController.weeklyIncomeShowText == false
                              ? Padding(
                                  padding: EdgeInsets.only(right: editModeController.editMode == false && constraints.maxWidth < 1000 ? 0.0 : 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        // width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.15,
                                        // height: Get.height * 0.04,

                                        width:
                                            // editModeController.editMode == true
                                            //     ?
                                            constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                        // : constraints.maxWidth < 1000
                                        //     ? Get.width * 0.33
                                        //     : Get.width * 0.15,
                                        height:
                                            // editModeController.editMode == true ?
                                            Get.height * 0.04,
                                        // : null,
                                        // alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            right: constraints.maxWidth < 1000
                                                ? Get.width * 0.04
                                                // : weeklyEditModeController.weeklyIncomeEditMode == false
                                                //     ? Get.width * 0.06
                                                : Get.width * 0.073
                                            // left: constraints.maxWidth < 1000
                                            //     ? constraints.maxWidth < 800
                                            //         ? Get.width * 0.04
                                            //         : Get.width * 0.03
                                            //     : 37
                                            ),
                                        child: TextField(
                                          controller: _weeklyIncomeNameController,
                                          style: blackMontserrat10W500,
                                          decoration:
                                              InputDecoration(hintStyle: blackMontserrat10W500, hintText: expenseName, contentPadding: const EdgeInsets.only(bottom: 10), border: InputBorder.none),
                                        ),
                                        decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                      ),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 6,
                                            ),
                                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            child: GetBuilder<SelectedDropDownItem>(
                                              builder: (dropDownController) {
                                                return
                                                    //   DropdownButtonHideUnderline(
                                                    //   child: DropdownButton(
                                                    //     hint: Text(
                                                    //       chooseDate,
                                                    //       style: blackMontserrat10W500,
                                                    //     ),
                                                    //     value: dropDownController.selectedSingleDate,
                                                    //     // value: controller.selectedItem,
                                                    //     style: dropDownStyle,
                                                    //     items: dateList.map((String items) {
                                                    //       return DropdownMenuItem(
                                                    //         value: items,
                                                    //         child: Text(
                                                    //           items,
                                                    //           style: blackMontserrat10W500,
                                                    //         ),
                                                    //       );
                                                    //     }).toList(),
                                                    //     onChanged: (item) {
                                                    //       dropDownController.changeSingleDate(item: item);
                                                    //     },
                                                    //     isExpanded: true,
                                                    //
                                                    //     icon: const Icon(
                                                    //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                    //       // color: AppTheme.colorGrey,
                                                    //     ),
                                                    //   ),
                                                    // );
                                                    CommonDropDown.commonDropDown(
                                                        valueTextStyle: blackMontserrat10W500,
                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                        hintTextStyle: blackMontserrat10W500,
                                                        hintText: chooseDate,
                                                        value: dropDownController.selectedSingleDate,
                                                        itemList: dateList,
                                                        onChanged: (item) {
                                                          dropDownController.changeSingleDate(item: item);
                                                        });
                                              },
                                            ),
                                            // child: dropDownDayGetBuilder(dropDownList: dateList),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.05),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 6),
                                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            child: GetBuilder<SelectedDropDownItem>(
                                              builder: (monthDropDownController) {
                                                // return commonDropDown(itemList: dropDownList, value: controller.selectedSingleWeek);
                                                return CommonDropDown.commonDropDown(
                                                    selectedItemTextStyle: blackMontserrat10W500,
                                                    valueTextStyle: blackMontserrat10W500,
                                                    hintText: chooseMonth,
                                                    hintTextStyle: blackMontserrat10W500,
                                                    value: monthDropDownController.selectedSingleMonth,
                                                    itemList: months,
                                                    onChanged: (item) {
                                                      monthDropDownController.changeSingleMonth(item: item);
                                                    });
                                                //   DropdownButtonHideUnderline(
                                                //   child: DropdownButton(
                                                //     hint: Text(
                                                //       chooseMonth,
                                                //       style: blackMontserrat10W500,
                                                //     ),
                                                //     value: monthDropDownController.selectedSingleMonth,
                                                //     // value: controller.selectedItem,
                                                //     style: dropDownStyle,
                                                //     items: months.map((String items) {
                                                //       return DropdownMenuItem(
                                                //         value: items,
                                                //         child: Text(
                                                //           items,
                                                //           style: blackMontserrat10W500,
                                                //         ),
                                                //       );
                                                //     }).toList(),
                                                //     onChanged: (item) {
                                                //       monthDropDownController.changeSingleMonth(item: item);
                                                //     },
                                                //     isExpanded: true,
                                                //
                                                //     icon: const Icon(
                                                //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                //       // color: AppTheme.colorGrey,
                                                //     ),
                                                //   ),
                                                // );
                                              },
                                            ),
                                            // child: dropDownWeekGetBuilder(dropDownList: months),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            // width: editModeController.editMode == true
                                            //     ? constraints.maxWidth < 1000
                                            //         ? Get.width * 0.18
                                            //         : 80
                                            //     : null,
                                            // // width: sequenceSize.width * 0.14,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.15 : Get.width * 0.06,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,

                                            padding: EdgeInsets.only(left: Get.width * 0.005, bottom: Get.height * 0.015),
                                            child: TextField(
                                              controller: _weeklyAmountController,
                                              style: blackMontserrat10W500,
                                              decoration: InputDecoration(prefixStyle: blackMontserrat10W500, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 15), border: InputBorder.none),
                                            ),
                                            // margin: EdgeInsets.only(right: Get.width * 0.04),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                              : Container(),
                          Visibility(
                            visible: constraints.maxWidth > 1000 ? showWeeklyIncomeSaveTextController.weeklyIncomeShowTextWeb : showWeeklyIncomeSaveTextController.weeklyIncomeShowText,
                            replacement: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      final controller = Get.put(SelectedDropDownItem());
                                      WeeklyIncomeModel.weeklyIncomeList.add(WeeklyIncomeModel(expenseName: _weeklyIncomeNameController.text, amount: _weeklyAmountController.text));
                                      controller.selectedMonthlyIncomeDateList.add(controller.selectedSingleDate as Object);
                                      controller.selectedMonthlyIncomeMonthList.add(controller.selectedSingleMonth as Object);
                                      // checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
                                    });
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
          );
        },
      ),
    );
  }

  monthlyExpenseData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    final dropDownController = Get.put(SelectedDropDownItem());
    TextEditingController _weeklyIncomeNameController = TextEditingController();
    TextEditingController _weeklyAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: GetBuilder<MonthlyExpenseEditModeController>(
        builder: (monthlyExpenseEditModeController) {
          return Container(
            padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == false ? 0.0 : Get.width * 0.01),
            decoration: BoxDecoration(
                border: Border(
                    right: weeklyIncomeDataVisibilityController.weeklyDataVisibility == true && constraints!.maxWidth < 1000 && monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                        ? BorderSide.none
                        : const BorderSide(color: borderColor))),
            child: Column(
              children: [
                constraints!.maxWidth > 1000
                    ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Padding(
                          padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? Get.width * 0.012 : 20),
                          child: Text(
                            expenseName,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? Get.width * 0.009 : 15),
                          child: Text(
                            dueOn,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == false ? 10 : 30),
                          child: Text(
                            every,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == false ? 25 : 0),
                          child: Text(
                            amount,
                            style: columnNameListStyle,
                          ),
                        ),
                        if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                          Text(
                            effectiveDate,
                            style: columnNameListStyle,
                          ),
                        if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                          Text(
                            action,
                            style: columnNameListStyle,
                          )
                        // Text(editModeController.editMode && constraints.maxWidth > 1000 ? 'Effective date' : ''),
                        // Text(editModeController.editMode && constraints.maxWidth > 1000 ? 'Action' : ''),
                      ])
                    : Column(),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MonthlyExpensesModel.monthlyExpensesList.length,
                  itemBuilder: (context, index) {
                    // if (index < WeeklyIncomeModel.weeklyIncomeList.length) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: Get.height * 0.015, top: index == 0 ? Get.height * 0.01 : 0.0),
                      child: Slidable(
                        enabled: constraints.maxWidth > 1000 ? false : monthlyExpenseEditModeController.monthlyExpenseEditMode,
                        // closeOnScroll: false,
                        actionPane: const SlidableDrawerActionPane(),
                        actionExtentRatio: 0.13,
                        secondaryActions: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                MonthlyExpensesModel.monthlyExpensesList.removeAt(index);
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(color: Color(0xffFFEBEB), borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.symmetric(horizontal: 7.0),
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  deleteImage,
                                  height: Get.height * 0.04,
                                  // width: 30.0,
                                )),
                          ),
                        ],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                    ? 10
                                    : constraints.maxWidth < 1000
                                        ? 7.0
                                        : 0.0,
                              ),
                              width: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                  ? constraints.maxWidth < 1000
                                      ? Get.width * 0.3
                                      : Get.width * 0.10
                                  : constraints.maxWidth < 1000
                                      ? Get.width * 0.33
                                      : Get.width * 0.15,
                              height: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? Get.height * 0.04 : null,

                              // height: Get.height * 0.044,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                              child: monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                  ? Text(
                                      '${MonthlyExpensesModel.monthlyExpensesList[index].expenseName}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: blackMontserrat10W500,
                                      textAlign: TextAlign.center,
                                    )
                                  : TextField(
                                      // controller: _updateMonthlyIncomeNameControllerList[index],
                                      style: textFieldStyle,
                                      decoration: InputDecoration(
                                          hintStyle: blackMontserrat10W500,
                                          hintText: MonthlyExpensesModel.monthlyExpensesList[index].expenseName,
                                          contentPadding: const EdgeInsets.only(bottom: 19),
                                          border: InputBorder.none),
                                    ),
                              decoration:
                                  BoxDecoration(color: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                            ),
                            Expanded(
                              child: Visibility(
                                  visible: constraints.maxWidth < 1000 ? visibilityValue as bool : true,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? 0.0 : 30.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 6),
                                          width: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                                                    // return DropdownButtonHideUnderline(
                                                    //   child: DropdownButton(
                                                    //     value: controller1.selectedMonthlyIncomeDateList[index],
                                                    //     // value: controller.selectedItem,
                                                    //     style: blackMontserrat10W500,
                                                    //
                                                    //     items: dateList.map((String items) {
                                                    //       return DropdownMenuItem(
                                                    //         value: items,
                                                    //         child: Text(
                                                    //           items,
                                                    //           style: blackMontserrat10W500,
                                                    //         ),
                                                    //       );
                                                    //     }).toList(),
                                                    //     onChanged: (item) {
                                                    //       controller1.changeDate(item: item, index: index);
                                                    //     },
                                                    //     isExpanded: true,
                                                    //
                                                    //     icon: const Icon(
                                                    //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                    //       // color: AppTheme.colorGrey,
                                                    //     ),
                                                    //   ),
                                                    // );
                                                    return CommonDropDown.commonDropDown(
                                                        valueTextStyle: blackMontserrat10W500,
                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                        value: controller1.selectedMonthlyExpenseDate[index],
                                                        itemList: dateList,
                                                        onChanged: (item) {
                                                          controller1.changeDate(item: item, index: index);
                                                        });
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.selectedMonthlyExpenseDate[index] as String,
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000
                                                  ? Get.width * 0.04
                                                  : monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                                      ? Get.width * 0.02
                                                      : Get.width * 0.045),
                                          decoration: BoxDecoration(
                                              color: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          // height: Get.height * 0.04,
                                          width: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                                    return
                                                        //   DropdownButtonHideUnderline(
                                                        //   child: DropdownButton(
                                                        //     value: controller1.selectedMonthlyIncomeMonthList[index],
                                                        //     // value: controller.selectedItem,
                                                        //     style: blackMontserrat10W500,
                                                        //     items: months.map((String items) {
                                                        //       return DropdownMenuItem(
                                                        //         value: items,
                                                        //         child: Text(
                                                        //           items,
                                                        //           style: blackMontserrat10W500,
                                                        //         ),
                                                        //       );
                                                        //     }).toList(),
                                                        //     onChanged: (item) {
                                                        //       controller1.changeItem(item: item, index: index);
                                                        //     },
                                                        //     isExpanded: true,
                                                        //
                                                        //     icon: const Icon(
                                                        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                        //       // color: AppTheme.colorGrey,
                                                        //     ),
                                                        //   ),
                                                        // );
                                                        CommonDropDown.commonDropDown(
                                                            selectedItemTextStyle: blackMontserrat10W500,
                                                            valueTextStyle: blackMontserrat10W500,
                                                            value: controller1.selectedMonthlyExpenseMonth[index],
                                                            itemList: months,
                                                            onChanged: (item) {
                                                              controller1.changeItem(item: item, index: index);
                                                            });
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.selectedMonthlyExpenseMonth[index] as String,
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000
                                                  ? monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                                      ? Get.width * 0.0
                                                      : Get.width * 0.04
                                                  : Get.width * 0.02),
                                          decoration: BoxDecoration(
                                              color: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          padding: EdgeInsets.only(left: monthlyExpenseEditModeController.monthlyExpenseEditMode == false && constraints.maxWidth > 1000 ? 7 : 0),

                                          // width: sequenceSize.width * 0.14,
                                          // height: Get.height * 0.04,
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          width: monthlyExpenseEditModeController.monthlyExpenseEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.15
                                                  : Get.width * 0.06
                                              : constraints.maxWidth < 1000
                                                  ? Get.width * 0.06
                                                  : Get.width * 0.025,
                                          height: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          // padding: const EdgeInsets.only(left: 10),
                                          child: monthlyExpenseEditModeController.monthlyExpenseEditMode == false
                                              ? Text(
                                                  '${MonthlyExpensesModel.monthlyExpensesList[index].amount}',
                                                  style: blackMontserrat10W500,
                                                  maxLines: 1,
                                                )
                                              : TextField(
                                                  // controller: _updateMonthlyAmountControllerList[index],
                                                  style: textFieldStyle,
                                                  decoration: InputDecoration(
                                                      hintStyle: blackMontserrat10W500,
                                                      hintText: MonthlyExpensesModel.monthlyExpensesList[index].amount,
                                                      prefixStyle: blackMontserrat10W500,
                                                      prefixText: '\$',
                                                      contentPadding: const EdgeInsets.only(bottom: 16),
                                                      border: InputBorder.none),
                                                ),
                                          margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.01 : Get.width * 0.0),
                                          decoration: BoxDecoration(
                                              color: monthlyExpenseEditModeController.monthlyExpenseEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        if (monthlyExpenseEditModeController.monthlyExpenseEditMode == true && constraints.maxWidth > 1000)
                                          InkWell(
                                            onTap: () {
                                              _selectDate(context: context);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(5)),
                                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                                padding: EdgeInsets.all(5.0),
                                                width: Get.width * 0.081,
                                                height: Get.height * 0.04,
                                                child: Text(
                                                  '$currentDate',
                                                  style: TextStyle(fontSize: 10.sp),
                                                  overflow: TextOverflow.ellipsis,
                                                )),
                                          ),
                                        if (monthlyExpenseEditModeController.monthlyExpenseEditMode && constraints.maxWidth > 1000)
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                MonthlyExpensesModel.monthlyExpensesList.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                margin: EdgeInsets.only(left: 10.0),
                                                width: Get.width * 0.015,
                                                height: Get.height * 0.03,
                                                child: Image.asset(
                                                  deleteImage,
                                                  height: Get.height * 0.02,
                                                  // width: 30.0,
                                                )),
                                          ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                    // } else {
                    //   return ;
                    // }
                  },
                ),
                Visibility(
                  visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : monthlyExpenseEditModeController.monthlyExpenseEditMode,
                  child: GetBuilder<ShowMonthlyExpenseSaveDataTextController>(
                    builder: (showMonthlyExpenseSaveTextController) {
                      return Column(
                        children: [
                          showMonthlyExpenseSaveTextController.monthlyExpenseShowTextWeb == false || showMonthlyExpenseSaveTextController.monthlyExpenseShowText == false
                              ? Padding(
                                  padding: EdgeInsets.only(right: monthlyExpenseEditModeController.monthlyExpenseEditMode == false && constraints.maxWidth < 1000 ? 0.0 : 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        // width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.15,
                                        // height: Get.height * 0.04,

                                        width:
                                            // editModeController.editMode == true
                                            //     ?
                                            constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                        // : constraints.maxWidth < 1000
                                        //     ? Get.width * 0.33
                                        //     : Get.width * 0.15,
                                        height:
                                            // editModeController.editMode == true ?
                                            Get.height * 0.04,
                                        // : null,
                                        // alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            right: constraints.maxWidth < 1000
                                                ? Get.width * 0.04
                                                // : weeklyEditModeController.weeklyIncomeEditMode == false
                                                //     ? Get.width * 0.06
                                                : Get.width * 0.073
                                            // left: constraints.maxWidth < 1000
                                            //     ? constraints.maxWidth < 800
                                            //         ? Get.width * 0.04
                                            //         : Get.width * 0.03
                                            //     : 37
                                            ),
                                        child: TextField(
                                          controller: _weeklyIncomeNameController,
                                          style: blackMontserrat10W500,
                                          decoration:
                                              InputDecoration(hintStyle: blackMontserrat10W500, hintText: expenseName, contentPadding: const EdgeInsets.only(bottom: 10), border: InputBorder.none),
                                        ),
                                        decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                      ),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 6,
                                            ),
                                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            child: GetBuilder<SelectedDropDownItem>(
                                              builder: (dropDownController) {
                                                return
                                                    //   DropdownButtonHideUnderline(
                                                    //   child: DropdownButton(
                                                    //     hint: Text(
                                                    //       chooseDate,
                                                    //       style: blackMontserrat10W500,
                                                    //     ),
                                                    //     value: dropDownController.selectedSingleDate,
                                                    //     // value: controller.selectedItem,
                                                    //     style: dropDownStyle,
                                                    //     items: dateList.map((String items) {
                                                    //       return DropdownMenuItem(
                                                    //         value: items,
                                                    //         child: Text(
                                                    //           items,
                                                    //           style: blackMontserrat10W500,
                                                    //         ),
                                                    //       );
                                                    //     }).toList(),
                                                    //     onChanged: (item) {
                                                    //       dropDownController.changeSingleDate(item: item);
                                                    //     },
                                                    //     isExpanded: true,
                                                    //
                                                    //     icon: const Icon(
                                                    //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                    //       // color: AppTheme.colorGrey,
                                                    //     ),
                                                    //   ),
                                                    // );
                                                    CommonDropDown.commonDropDown(
                                                        valueTextStyle: blackMontserrat10W500,
                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                        hintTextStyle: blackMontserrat10W500,
                                                        hintText: chooseDate,
                                                        value: dropDownController.selectedSingleDate,
                                                        itemList: dateList,
                                                        onChanged: (item) {
                                                          dropDownController.changeSingleDate(item: item);
                                                        });
                                              },
                                            ),
                                            // child: dropDownDayGetBuilder(dropDownList: dateList),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.05 : Get.width * 0.05),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 6),
                                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            child: GetBuilder<SelectedDropDownItem>(
                                              builder: (monthDropDownController) {
                                                // return commonDropDown(itemList: dropDownList, value: controller.selectedSingleWeek);
                                                return CommonDropDown.commonDropDown(
                                                    selectedItemTextStyle: blackMontserrat10W500,
                                                    valueTextStyle: blackMontserrat10W500,
                                                    hintText: chooseMonth,
                                                    hintTextStyle: blackMontserrat10W500,
                                                    value: monthDropDownController.selectedSingleMonth,
                                                    itemList: months,
                                                    onChanged: (item) {
                                                      monthDropDownController.changeSingleMonth(item: item);
                                                    });
                                                //   DropdownButtonHideUnderline(
                                                //   child: DropdownButton(
                                                //     hint: Text(
                                                //       chooseMonth,
                                                //       style: blackMontserrat10W500,
                                                //     ),
                                                //     value: monthDropDownController.selectedSingleMonth,
                                                //     // value: controller.selectedItem,
                                                //     style: dropDownStyle,
                                                //     items: months.map((String items) {
                                                //       return DropdownMenuItem(
                                                //         value: items,
                                                //         child: Text(
                                                //           items,
                                                //           style: blackMontserrat10W500,
                                                //         ),
                                                //       );
                                                //     }).toList(),
                                                //     onChanged: (item) {
                                                //       monthDropDownController.changeSingleMonth(item: item);
                                                //     },
                                                //     isExpanded: true,
                                                //
                                                //     icon: const Icon(
                                                //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                //       // color: AppTheme.colorGrey,
                                                //     ),
                                                //   ),
                                                // );
                                              },
                                            ),
                                            // child: dropDownWeekGetBuilder(dropDownList: months),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            // width: editModeController.editMode == true
                                            //     ? constraints.maxWidth < 1000
                                            //         ? Get.width * 0.18
                                            //         : 80
                                            //     : null,
                                            // // width: sequenceSize.width * 0.14,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.15 : Get.width * 0.065,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,

                                            padding: EdgeInsets.only(left: Get.width * 0.005, bottom: Get.height * 0.015),
                                            child: TextField(
                                              controller: _weeklyAmountController,
                                              style: blackMontserrat10W500,
                                              decoration: InputDecoration(prefixStyle: blackMontserrat10W500, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 15), border: InputBorder.none),
                                            ),
                                            // margin: EdgeInsets.only(right: Get.width * 0.04),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                              : Container(),
                          Visibility(
                            visible: constraints.maxWidth > 1000 ? showMonthlyExpenseSaveTextController.monthlyExpenseShowTextWeb : showMonthlyExpenseSaveTextController.monthlyExpenseShowText,
                            replacement: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      final controller = Get.put(SelectedDropDownItem());
                                      MonthlyExpensesModel.monthlyExpensesList.add(MonthlyExpensesModel(expenseName: _weeklyIncomeNameController.text, amount: _weeklyAmountController.text));
                                      controller.selectedMonthlyExpenseDate.add(controller.selectedSingleDate as Object);
                                      controller.selectedMonthlyExpenseMonth.add(controller.selectedSingleMonth as Object);
                                      // checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
                                    });
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
                                    _weeklyAmountController.clear();
                                    _weeklyIncomeNameController.clear();
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
          );
        },
      ),
    );
  }

  weeklyBudgetData({bool? boolValue, BoxConstraints? constraints, bool? visibilityValue}) {
    final dropDownController = Get.put(SelectedDropDownItem());
    TextEditingController _monthlyIncomeNameController = TextEditingController();
    TextEditingController _monthlyAmountController = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: GetBuilder<WeeklyBudgetEditModeController>(
        builder: (editModeController) {
          return Container(
            padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == false ? 0.0 : Get.width * 0.005),
            decoration: BoxDecoration(
                border: Border(
                    right: monthlyIncomeVisibilityController.visibility == true && constraints!.maxWidth < 1000 && editModeController.weeklyBudgetEditMode == false
                        ? BorderSide.none
                        : const BorderSide(color: borderColor))),
            child: Column(
              children: [
                constraints!.maxWidth > 1000
                    ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Padding(
                          padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == true ? Get.width * 0.01 : 20),
                          child: Text(
                            expenseName,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == true ? Get.width * 0.009 : 15),
                          child: Text(
                            paidOn,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == false ? 10 : 30),
                          child: Text(
                            every,
                            style: columnNameListStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == false ? 25 : 0),
                          child: Text(
                            amount,
                            style: columnNameListStyle,
                          ),
                        ),
                        if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
                          Text(
                            effectiveDate,
                            style: columnNameListStyle,
                          ),
                        if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
                          Text(
                            action,
                            style: columnNameListStyle,
                          )
                      ])
                    : Column(),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: WeeklyBudgetModel.weeklyBudgetModel.length,
                  itemBuilder: (context, index) {
                    // if (index < MonthlyIncomeModel.monthlyIncomeList.length) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: Get.height * 0.015,
                        top: index == 0 ? Get.height * 0.01 : 0.0,
                      ),
                      child: Slidable(
                        enabled: constraints.maxWidth > 1000 ? false : editModeController.weeklyBudgetEditMode,
                        // closeOnScroll: false,
                        actionPane: const SlidableDrawerActionPane(),
                        actionExtentRatio: 0.13,
                        secondaryActions: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                WeeklyBudgetModel.weeklyBudgetModel.removeAt(index);
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(color: Color(0xffFFEBEB), borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.symmetric(horizontal: 7.0),
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  deleteImage,
                                  height: Get.height * 0.04,
                                  // width: 30.0,
                                )),
                          ),
                        ],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: editModeController.weeklyBudgetEditMode == true
                                      ? 10
                                      : constraints.maxWidth < 1000
                                          ? 7.0
                                          : 0.0),
                              width: editModeController.weeklyBudgetEditMode == true
                                  ? constraints.maxWidth < 1000
                                      ? Get.width * 0.3
                                      : Get.width * 0.10
                                  : constraints.maxWidth < 1000
                                      ? Get.width * 0.33
                                      : Get.width * 0.15,
                              height: editModeController.weeklyBudgetEditMode == true ? Get.height * 0.04 : null,

                              // height: Get.height * 0.044,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                              child: editModeController.weeklyBudgetEditMode == false
                                  ? Text(
                                      '${WeeklyBudgetModel.weeklyBudgetModel[index].expenseName}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: blackMontserrat10W500,
                                    )
                                  : TextField(
                                      // controller: _updateMonthlyIncomeNameControllerList[index],
                                      style: textFieldStyle,
                                      decoration: InputDecoration(
                                          hintStyle: blackMontserrat10W500,
                                          hintText: WeeklyBudgetModel.weeklyBudgetModel[index].expenseName,
                                          contentPadding: EdgeInsets.only(bottom: 19),
                                          border: InputBorder.none),
                                    ),
                              decoration: BoxDecoration(color: editModeController.weeklyBudgetEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                            ),
                            Expanded(
                              child: Visibility(
                                  visible: constraints.maxWidth < 1000 ? visibilityValue as bool : true,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == true ? 0.0 : 30.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 6),
                                          width: editModeController.weeklyBudgetEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: editModeController.weeklyBudgetEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: editModeController.weeklyBudgetEditMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    return
                                                        // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                                                        //     DropdownButtonHideUnderline(
                                                        //   child: DropdownButton(
                                                        //     value: controller1.selectedMonthlyIncomeDateList[index],
                                                        //     // value: controller.selectedItem,
                                                        //     style: blackMontserrat10W500,
                                                        //
                                                        //     items: dateList.map((String items) {
                                                        //       return DropdownMenuItem(
                                                        //         value: items,
                                                        //         child: Text(
                                                        //           items,
                                                        //           style: blackMontserrat10W500,
                                                        //         ),
                                                        //       );
                                                        //     }).toList(),
                                                        //     onChanged: (item) {
                                                        //       print(item);
                                                        //       controller1.changeDate(item: item, index: index);
                                                        //     },
                                                        //     isExpanded: true,
                                                        //
                                                        //     icon: const Icon(
                                                        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                        //       // color: AppTheme.colorGrey,
                                                        //     ),
                                                        //   ),
                                                        // );

                                                        CommonDropDown.commonDropDown(
                                                            valueTextStyle: blackMontserrat10W500,
                                                            selectedItemTextStyle: blackMontserrat10W500,
                                                            value: controller1.weeklyBudgetDayDropDownList[index],
                                                            itemList: days,
                                                            onChanged: (item) {
                                                              controller1.changeWeeklyBudgetDayList(item: item, index: index);
                                                            });
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.weeklyBudgetDayDropDownList[index] as String,
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000
                                                  ? Get.width * 0.04
                                                  : editModeController.weeklyBudgetEditMode == true
                                                      ? Get.width * 0.02
                                                      : Get.width * 0.045),
                                          decoration:
                                              BoxDecoration(color: editModeController.weeklyBudgetEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          // height: Get.height * 0.04,
                                          width: editModeController.weeklyBudgetEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.06
                                              : null,
                                          height: editModeController.weeklyBudgetEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: editModeController.weeklyBudgetEditMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                                    return
                                                        //   DropdownButtonHideUnderline(
                                                        //   child: DropdownButton(
                                                        //     value: controller1.selectedMonthlyIncomeMonthList[index],
                                                        //     // value: controller.selectedItem,
                                                        //     style: blackMontserrat10W500,
                                                        //     items: months.map((String items) {
                                                        //       return DropdownMenuItem(
                                                        //         value: items,
                                                        //         child: Text(
                                                        //           items,
                                                        //           style: blackMontserrat10W500,
                                                        //         ),
                                                        //       );
                                                        //     }).toList(),
                                                        //     onChanged: (item) {
                                                        //       controller1.changeItem(item: item, index: index);
                                                        //     },
                                                        //     isExpanded: true,
                                                        //
                                                        //     icon: const Icon(
                                                        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                        //       // color: AppTheme.colorGrey,
                                                        //     ),
                                                        //   ),
                                                        // );
                                                        CommonDropDown.commonDropDown(
                                                            selectedItemTextStyle: blackMontserrat10W500,
                                                            valueTextStyle: blackMontserrat10W500,
                                                            value: controller1.weeklyBudgetWeekDropDownList[index],
                                                            itemList: weeks,
                                                            onChanged: (item) {
                                                              controller1.changeWeeklyBudgetWeekList(item: item, index: index);
                                                            });
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.weeklyBudgetWeekDropDownList[index] as String,
                                                  style: blackMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(
                                              right: constraints.maxWidth < 1000
                                                  ? editModeController.weeklyBudgetEditMode == false
                                                      ? Get.width * 0.0
                                                      : Get.width * 0.04
                                                  : Get.width * 0.02),
                                          decoration:
                                              BoxDecoration(color: editModeController.weeklyBudgetEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          padding: EdgeInsets.only(left: editModeController.weeklyBudgetEditMode == false && constraints.maxWidth > 1000 ? 7 : 0),

                                          // width: sequenceSize.width * 0.14,
                                          // height: Get.height * 0.04,
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          width: editModeController.weeklyBudgetEditMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.15
                                                  : Get.width * 0.06
                                              : constraints.maxWidth < 1000
                                                  ? Get.width * 0.06
                                                  : Get.width * 0.025,
                                          height: editModeController.weeklyBudgetEditMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          // padding: EdgeInsets.only(left: editModeController.editMode == true ? 0 : 0.0),
                                          child: editModeController.weeklyBudgetEditMode == false
                                              ? Text(
                                                  '${WeeklyBudgetModel.weeklyBudgetModel[index].amount}',
                                                  style: blackMontserrat10W500,
                                                  maxLines: 1,
                                                  // overflow: TextOverflow.ellipsis,
                                                )
                                              : TextField(
                                                  // controller: _updateMonthlyAmountControllerList[index],
                                                  style: textFieldStyle,
                                                  decoration: InputDecoration(
                                                      hintStyle: blackMontserrat10W500,
                                                      hintText: WeeklyBudgetModel.weeklyBudgetModel[index].amount,
                                                      prefixStyle: blackMontserrat10W500,
                                                      prefixText: '\$',
                                                      contentPadding: const EdgeInsets.only(bottom: 17),
                                                      border: InputBorder.none),
                                                ),
                                          margin: EdgeInsets.only(right: constraints.maxWidth > 1000 ? Get.width * 0.01 : Get.width * 0.0),
                                          decoration:
                                              BoxDecoration(color: editModeController.weeklyBudgetEditMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        if (editModeController.weeklyBudgetEditMode == true && constraints.maxWidth > 1000)
                                          InkWell(
                                            onTap: () {
                                              _selectDate(context: context);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(5)),
                                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                padding: EdgeInsets.all(5.0),
                                                width: Get.width * 0.080,
                                                height: Get.height * 0.04,
                                                child: Text(
                                                  '$currentDate',
                                                  style: TextStyle(fontSize: 10.sp),
                                                  overflow: TextOverflow.ellipsis,
                                                )),
                                          ),
                                        if (editModeController.weeklyBudgetEditMode && constraints.maxWidth > 1000)
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                WeeklyBudgetModel.weeklyBudgetModel.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                                margin: EdgeInsets.only(left: 10.0),
                                                width: Get.width * 0.015,
                                                height: Get.height * 0.03,
                                                child: Image.asset(
                                                  deleteImage,
                                                  height: Get.height * 0.02,
                                                  // width: 30.0,
                                                )),
                                          ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Visibility(
                  visible: constraints.maxWidth > 1000 ? showSaveTextController.showTextWeb : editModeController.weeklyBudgetEditMode,
                  child: GetBuilder<ShowWeeklyBudgetSaveDataTextController>(
                    builder: (showSaveTextController) {
                      return Column(
                        children: [
                          showSaveTextController.weeklyBudgetShowTextWeb == false || showSaveTextController.weeklyBudgetShowText == false
                              ? Padding(
                                  padding: EdgeInsets.only(right: editModeController.weeklyBudgetEditMode == true ? 0.0 : 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        // width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.15,
                                        // height: Get.height * 0.04,

                                        width:
                                            // editModeController.editMode == true
                                            //     ?
                                            constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.10,
                                        // : constraints.maxWidth < 1000
                                        //     ? Get.width * 0.33
                                        //     : Get.width * 0.15,
                                        height:
                                            // editModeController.editMode == true ?
                                            Get.height * 0.04,
                                        // : null,
                                        // alignment: Alignment.center,
                                        margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.073
                                            // left: constraints.maxWidth < 1000
                                            //     ? constraints.maxWidth < 800
                                            //         ? Get.width * 0.04
                                            //         : Get.width * 0.03
                                            //     : 37
                                            ),
                                        child: TextField(
                                          controller: _monthlyIncomeNameController,
                                          style: blackMontserrat10W500,
                                          decoration: InputDecoration(hintStyle: blackMontserrat10W500, hintText: expenseName, contentPadding: EdgeInsets.only(bottom: 15), border: InputBorder.none),
                                        ),
                                        decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                      ),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 6,
                                            ),
                                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            child: GetBuilder<SelectedDropDownItem>(
                                              builder: (dropDownController) {
                                                return
                                                    //   DropdownButtonHideUnderline(
                                                    //   child: DropdownButton(
                                                    //     hint: Text(
                                                    //       chooseDate,
                                                    //       style: blackMontserrat10W500,
                                                    //     ),
                                                    //     value: dropDownController.selectedSingleDate,
                                                    //     // value: controller.selectedItem,
                                                    //     style: dropDownStyle,
                                                    //     items: dateList.map((String items) {
                                                    //       return DropdownMenuItem(
                                                    //         value: items,
                                                    //         child: Text(
                                                    //           items,
                                                    //           style: blackMontserrat10W500,
                                                    //         ),
                                                    //       );
                                                    //     }).toList(),
                                                    //     onChanged: (item) {
                                                    //       dropDownController.changeSingleDate(item: item);
                                                    //     },
                                                    //     isExpanded: true,
                                                    //
                                                    //     icon: const Icon(
                                                    //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                    //       // color: AppTheme.colorGrey,
                                                    //     ),
                                                    //   ),
                                                    // );
                                                    CommonDropDown.commonDropDown(
                                                        valueTextStyle: blackMontserrat10W500,
                                                        selectedItemTextStyle: blackMontserrat10W500,
                                                        hintTextStyle: blackMontserrat10W500,
                                                        hintText: chooseDate,
                                                        value: dropDownController.weeklyBudgetDay,
                                                        itemList: days,
                                                        onChanged: (item) {
                                                          dropDownController.changeWeeklyBudgetSingleDay(item: item);
                                                        });
                                              },
                                            ),
                                            // child: dropDownDayGetBuilder(dropDownList: dateList),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.05),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 6),
                                            // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.08,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            child: GetBuilder<SelectedDropDownItem>(
                                              builder: (monthDropDownController) {
                                                // return commonDropDown(itemList: dropDownList, value: controller.selectedSingleWeek);
                                                // return DropdownButtonHideUnderline(
                                                //   child: DropdownButton(
                                                //     hint: Text(
                                                //       chooseMonth,
                                                //       style: blackMontserrat10W500,
                                                //     ),
                                                //     value: monthDropDownController.selectedSingleMonth,
                                                //     // value: controller.selectedItem,
                                                //     style: dropDownStyle,
                                                //     items: months.map((String items) {
                                                //       return DropdownMenuItem(
                                                //         value: items,
                                                //         child: Text(
                                                //           items,
                                                //           style: blackMontserrat10W500,
                                                //         ),
                                                //       );
                                                //     }).toList(),
                                                //     onChanged: (item) {
                                                //       monthDropDownController.changeSingleMonth(item: item);
                                                //     },
                                                //     isExpanded: true,
                                                //
                                                //     icon: const Icon(
                                                //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                //       // color: AppTheme.colorGrey,
                                                //     ),
                                                //   ),
                                                // );
                                                return CommonDropDown.commonDropDown(
                                                    selectedItemTextStyle: blackMontserrat10W500,
                                                    valueTextStyle: blackMontserrat10W500,
                                                    hintText: chooseMonth,
                                                    hintTextStyle: blackMontserrat10W500,
                                                    value: monthDropDownController.weeklyBudgetWeek,
                                                    itemList: weeks,
                                                    onChanged: (item) {
                                                      monthDropDownController.changeWeeklyBudgetSingleWeek(item: item);
                                                    });
                                              },
                                            ),
                                            // child: dropDownWeekGetBuilder(dropDownList: months),
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            // width: editModeController.editMode == true
                                            //     ? constraints.maxWidth < 1000
                                            //         ? Get.width * 0.18
                                            //         : 80
                                            //     : null,
                                            // // width: sequenceSize.width * 0.14,
                                            // height: Get.height * 0.04,
                                            width:
                                                // editModeController.editMode == true
                                                //     ?
                                                constraints.maxWidth < 1000 ? Get.width * 0.15 : Get.width * 0.065,
                                            // : null,
                                            height:
                                                // editModeController.editMode == true ?
                                                Get.height * 0.04,
                                            // : null,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(left: Get.width * 0.005, bottom: Get.height * 0.015),
                                            child: TextField(
                                              controller: _monthlyAmountController,
                                              style: blackMontserrat10W500,
                                              decoration: InputDecoration(prefixStyle: blackMontserrat10W500, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                                            ),
                                            // margin: EdgeInsets.only(right: Get.width * 0.04),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ))
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
                                  onTap: () {
                                    setState(() {
                                      final controller = Get.put(SelectedDropDownItem());
                                      WeeklyBudgetModel.weeklyBudgetModel.add(WeeklyBudgetModel(expenseName: _monthlyIncomeNameController.text, amount: _monthlyAmountController.text));
                                      controller.weeklyBudgetDayDropDownList.add(controller.weeklyBudgetDay as Object);
                                      controller.weeklyBudgetWeekDropDownList.add(controller.weeklyBudgetWeek as Object);
                                      // checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
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
                            child: constraints.maxWidth > 1000 && monthlyIncomeEditMode.editMode == true
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.only(bottom: Get.height * 0.01, top: Get.height * 0.01),
                                    child: GestureDetector(
                                      onTap: () {
                                        constraints.maxWidth > 1000 ? showSaveTextController.changeVisibilityForWeb() : showSaveTextController.changeVisibility();
                                      },
                                      child: Align(
                                        alignment: FractionalOffset(0.0, 0.0),
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
          );
        },
      ),
    );
  }

  monthlyIncomeEditModeRow() {
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
                        monthlyIncomeEditMode.showEditMode();
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
                          monthlyIncomeEditMode.showEditMode();
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
                        },
                      )
                    ],
                  )
          ],
        );
      },
    );
  }

  weeklyIncomeEditModeRow() {
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
                  )
          ],
        );
      },
    );
  }

  monthlyExpenseEditModeRow() {
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
                  )
          ],
        );
      },
    );
  }

  weeklyBudgetEditModeRow() {
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
                  )
          ],
        );
      },
    );
  }

  Future<void> _selectDate({BuildContext? context}) async {
    final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }
}
