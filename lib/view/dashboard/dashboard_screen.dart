import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/common_widget/common_web_appbar.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/getx/checkbox_controller.dart';
import 'package:fore_cash/getx/dashboard_container_visibility.dart';
import 'package:fore_cash/getx/monthly_expansion_visibility_controller.dart';
import 'package:fore_cash/getx/monthlyincome_edit_mode_controller.dart';
import 'package:fore_cash/getx/pageview_pageindex_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/switch_controller.dart';
import 'package:fore_cash/getx/visibility_controller.dart';
import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/notifications/notifications_screen.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final monthlyIncomeEditMode = Get.put(MonthlyIncomeEditModeController());
  final switchController = Get.put(SwitchController());

  final pageIndexController = Get.put(PageViewPageIndex());
  final monthlyIncomeVisibilityController = Get.put(MonthlyIncomeVisibilityController());
  AnimationController? _animationController;
  bool iconValue = true;

  @override
  Widget build(BuildContext context) {
    List<String> dataDateList = [
      "Sep,1",
      "Dec,1",
      "Jun,15",
      "May,15",
      "Mar,6",
      "Jul,28",
      "Jun,7",
      "Dec,3",
      "Nov,20",
      "Oct,25",
      "Aug,18",
      "Sep,23",
      "Aug,29",
      "Jul,25",
      "Jun,11",
      "Mar,22",
      "Feb,12",
      "Aug,17",
      "Aug,21",
      "Aug,30",
      "Jan,25",
      "Sep,2",
      "Nov,15",
      "Nov,5",
      "Nov,12",
      "Oct,1",
      "Dec,1",
    ];
    List<String> incomes = [
      '\$1200',
      '-',
      '\$800',
      '-',
      '\$1000',
      '\$1800',
      '\$2000',
      '-',
      '\$200',
      '-',
      '\$300',
      '-',
      '200',
      '\$500',
      '-',
      '\$8000',
      '-',
      '-',
      '-',
      '\$400',
      '\$500',
      '-',
      '-',
      '\$3000',
      '\$5444',
      '-',
      '-',
    ];

    final visibilityController = Get.put(DashBoardVisibilityController());
    final dropDownController = Get.put(SelectedDropDownItem());
    ScrollController scrollController = ScrollController();
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        PageController _pageController = PageController(
            // keepPage: true,
            // initialPage: 5,
            // viewportFraction: 0.34,

            viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1);
        PageController _pageController2 = PageController(
          // keepPage: true,
          viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
        );

        List<PageController> pageControllerList = List.generate(
            MonthlyIncomeModel.monthlyIncomeList.length,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        return Scaffold(
          backgroundColor: const Color(0xffE5E5E5),
          appBar: maxWidth
              ? CommonWebAppbar.commonWebAppbar(scale: Get.mediaQuery.size.aspectRatio * 150, actions: [
            GestureDetector(
              onTap: (){
               showCommonDialog(context);
                // Get.to(() => const NotificationsScreen());
              },
              child: Padding(
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
                      child: Image.asset('assets/image/png/notificationIcon.png'),
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
            ),
            SizedBox(
              width: Get.width * 0.007,
            ),
            GestureDetector(
              onTap: (){
                _showPopupMenu();
              },
              child: Container(
                width: 160,
                margin: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01, right: Get.width * 0.015),
                padding: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(color: appBarActionColor, borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 17,
                      backgroundImage: AssetImage('assets/image/png/profilePhoto.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        userName,
                        style: userNameProfileStyle,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _showPopupMenu();
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
          ])
              : CommonMobileAppbar.commonMobileAppbar(
                  color: Colors.white,
                  title: Text(
                    'DashBoard',
                    style: mobileAppBarStyle,
                  ),
                  actions: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => const NotificationsScreen());
                        },
                        child: Padding(
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
                                child: Image.asset('assets/image/png/notificationIcon.png'),
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
                      ),
                      SizedBox(
                        width: Get.width * 0.007,
                      ),
                      GestureDetector(
                        onTap: (){
                          _showPopupMenu();
                        },
                        child: Container(
                          width: 86,
                          margin: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01, right: Get.width * 0.015),
                          padding: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(color: appBarActionColor, borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 17,
                                backgroundImage: AssetImage(
                                  'assets/image/png/profilePhoto.png',
                                ),
                              ),
                              IconButton(
                                  onPressed: () {

                                  },
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ]
                  // titleTextStyle: mobileAppBarStyle,
                  ),
          body: Column(
            children: [
              SizedBox(
                height: Get.height * 0.015,
              ),
              maxWidth ? webHeaderRow() : mobileHeaderColumn(),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    margin: EdgeInsets.only(top: maxWidth ? 9 : 14),
                    // height: 300,
                    width: double.infinity,
                    color: maxWidth ? Color(0xffE5E5E5) : Colors.white,
                    child: Column(
                      children: [
                        maxWidth ? Container() : _mobileSimulateModeRow(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: maxWidth ? 10 : 0),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: maxWidth ? 8 : 0),
                          decoration: BoxDecoration(color: maxWidth ? Colors.white : Color(0xffEDF2F6), borderRadius: BorderRadius.circular(5)),
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
                                        'assets/image/png/calendarImage.png',
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
                                          _pageController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          List.generate(
                                              pageControllerList.length, (index) => pageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));

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
                                              List.generate(pageControllerList.length, (index) => pageControllerList[index].jumpToPage(value));

                                              // _pageController2.jumpToPage(value);
                                              // print(value);
                                            },
                                          );
                                        },
                                      )),
                                      InkWell(
                                        onTap: () {
                                          print('>>>>>>>>>>${_pageController.position}');
                                          print(_pageController.page);
                                          // if (dataDateList.length == pageIndexController.pageIndex) {
                                          //   _pageController.animateTo(0, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // } else {
                                          _pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // _pageController2.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          List.generate(pageControllerList.length, (index) => pageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
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
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: maxWidth ? 8 : 0),
                          child: ListTileTheme(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                                          padding: EdgeInsets.only(
                                            left: maxWidth ? 17 : 10,
                                          ),
                                          decoration: const BoxDecoration(
                                              // color: Colors.red,
                                              border: Border(
                                            top: BorderSide(color: Color(0xffF2F2F2)),
                                          )),
                                          child: Column(
                                            children: [
                                              monthlyIncomeController.visibility == false && monthlyIncomeController.visibilityIncome == true
                                                  ? Column()
                                                  : Padding(
                                                      padding: EdgeInsets.only(right: 30.0),
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                                                        Text(
                                                          amount,
                                                          style: columnNameListStyle,
                                                        ),
                                                      ]),
                                                    ),
                                              Row(
                                                children: [
                                                  monthlyIncomeData(boolValue: monthlyIncomeController.visibilityIncome, constraints: constraints, visibilityValue: monthlyIncomeController.visibility),
                                                  Expanded(
                                                    flex: monthlyIncomeController.visibilityIncome == true
                                                        ? 2
                                                        : constraints.maxWidth < 1000
                                                            ? 0
                                                            : 2,
                                                    // flex: controller.visibility == true ? 0 : 2,

                                                    // child: ListView.builder(
                                                    //   physics: const NeverScrollableScrollPhysics(),
                                                    //   // controller: _scrollController,
                                                    //   shrinkWrap: true,
                                                    //   itemCount: 3,
                                                    //   itemBuilder: (context, index) {
                                                    //     return SizedBox(
                                                    //       height: 50,
                                                    //       child: PageView(
                                                    //         scrollDirection: Axis.horizontal,
                                                    //         onPageChanged: (value) {
                                                    //           _pageController.animateToPage(value, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                    //         },
                                                    //         // itemCount: incomes.length,
                                                    //         controller: _pageController2,
                                                    //
                                                    //         children: List.generate(
                                                    //             incomes.length,
                                                    //             (index) => Text(
                                                    //                   incomes[index],
                                                    //                   style: greyDateTexStyle10W300,
                                                    //                   textAlign: TextAlign.center,
                                                    //                 )),
                                                    //       ),
                                                    //     );
                                                    //     // return Padding(
                                                    //     //   padding: EdgeInsets.only(left: maxWidth ? 27 : Get.width * 0.045, right: maxWidth ? 5 : Get.width * 0.06),
                                                    //     //   child: PageView.builder(
                                                    //     //     controller: _pageController2,
                                                    //     //     itemCount: incomes.length,
                                                    //     //     onPageChanged: (value) {
                                                    //     //       // _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                    //     //     },
                                                    //     //     itemBuilder: (BuildContext context, int index1) {
                                                    //     //       return Text(
                                                    //     //         incomes[index1],
                                                    //     //         style: greyDateTexStyle10W300,
                                                    //     //         textAlign: TextAlign.center,
                                                    //     //       );
                                                    //     //     },
                                                    //     //   ),
                                                    //     // );
                                                    //   },
                                                    // ),
                                                    child: Visibility(
                                                      visible: constraints.maxWidth < 1000 ? monthlyIncomeController.visibilityIncome : true,
                                                      child: ListView.builder(
                                                        // scrollDirection: Axis.horizontal,
                                                        // physics: const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: pageControllerList.length,
                                                        itemBuilder: (context, index) {
                                                          return SizedBox(
                                                            height: Get.height * 0.04,
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                top: Get.height * 0.01,
                                                                // left: maxWidth ? 0 : Get.width * 0.045,
                                                                // right: maxWidth ? 5 : Get.width * 0.06
                                                              ),
                                                              child: PageView.builder(
                                                                // scrollDirection: Axis.horizontal,
                                                                onPageChanged: (value) {
                                                                  _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                                                },
                                                                controller: pageControllerList[index],
                                                                itemCount: incomes.length,
                                                                itemBuilder: (BuildContext context, int index1) {
                                                                  return Text(
                                                                    incomes[index1],
                                                                    style: greyTexStyle10W500,
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
                                            : Visibility(
                                                // visible: monthlyIncomeVisibilityController.editMode,
                                                child: Positioned(
                                                top: 0, bottom: 0,
                                                right: monthlyIncomeController.visibility == true ? 0 : Get.width * 0.45,
                                                // left: 0,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    monthlyIncomeVisibilityController.changeVisibility();
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor: Colors.grey.withOpacity(0.3),
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
                                              ))
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
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
        );
      },
    );
  }

  Widget webHeaderRow() {
    return Row(
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
                  '\$5,000',
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
                    '\$4.200',
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
                    '\$150',
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
                  'assets/image/png/Information.svg',
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
                  '\$5,000',
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
                          '\$4.200',
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
                          '\$150',
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
    final addMonthlyIncomeVisibility = Get.put(VisibilityController());
    TextEditingController _monthlyIncomeNameController = TextEditingController();
    // TextEditingController _monthlyAmountController = TextEditingController();
    TextEditingController _monthly = TextEditingController();
    return Expanded(
      flex: boolValue == true
          ? 2
          : constraints!.maxWidth > 1000
              ? 2
              : 4,
      child: GetBuilder<MonthlyIncomeEditModeController>(
        builder: (editModeController) {
          return Container(
            decoration: BoxDecoration(border: Border(right: monthlyIncomeVisibilityController.visibility == true && constraints!.maxWidth < 1000 ? BorderSide.none : BorderSide(color: Colors.black))),
            child: Column(
              children: [
                constraints!.maxWidth > 1000
                    ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                        Text(
                          amount,
                          style: columnNameListStyle,
                        ),
                      ])
                    : Column(),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MonthlyIncomeModel.monthlyIncomeList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: Get.height * 0.015, top: index == 0 ? Get.height * 0.01 : 0.0),
                      child: Slidable(
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
                                margin: EdgeInsets.all(5.0),
                                child: Image.asset(
                                  'assets/image/png/deleteImg.png',
                                  height: 34.0,
                                  width: 34.0,
                                )),
                          ),
                        ],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: editModeController.editMode == true
                                  ? constraints.maxWidth < 1000
                                      ? Get.width * 0.3
                                      : Get.width * 0.15
                                  : constraints.maxWidth < 1000
                                      ? Get.width * 0.33
                                      : Get.width * 0.15,
                              height: editModeController.editMode == true ? Get.height * 0.04 : null,

                              // height: Get.height * 0.044,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                              child: Text(
                                '${MonthlyIncomeModel.monthlyIncomeList[index].expenseName}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: greyMontserratW500,
                              ),
                              // child: const TextField(
                              //   style: textFieldStyle,
                              //   decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                              // ),
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
                                                  : Get.width * 0.08
                                              : null,
                                          height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: editModeController.editMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                                                    return DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                        value: controller1.selectedMonthlyIncomeDateList[index],
                                                        // value: controller.selectedItem,
                                                        style: dropDownStyle,

                                                        items: dateList.map((String items) {
                                                          return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(
                                                              items,
                                                              style: dropDownStyle2,
                                                            ),
                                                          );
                                                        }).toList(),
                                                        onChanged: (item) {
                                                          controller1.changeDate(item: item, index: index);
                                                        },
                                                        isExpanded: true,

                                                        icon: const Icon(
                                                          Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                          // color: AppTheme.colorGrey,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.selectedMonthlyIncomeDateList[index] as String,
                                                  style: greyMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
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
                                                  : Get.width * 0.08
                                              : null,
                                          height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.center,
                                          child: editModeController.editMode == true
                                              ? GetBuilder<SelectedDropDownItem>(
                                                  builder: (controller1) {
                                                    // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                                    return DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                        value: controller1.selectedMonthlyIncomeMonthList[index],
                                                        // value: controller.selectedItem,
                                                        style: dropDownStyle,
                                                        items: months.map((String items) {
                                                          return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(
                                                              items,
                                                              style: dropDownStyle2,
                                                            ),
                                                          );
                                                        }).toList(),
                                                        onChanged: (item) {
                                                          controller1.changeItem(item: item, index: index);
                                                        },
                                                        isExpanded: true,

                                                        icon: const Icon(
                                                          Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                                          // color: AppTheme.colorGrey,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Text(
                                                  dropDownController.selectedMonthlyIncomeMonthList[index] as String,
                                                  style: greyMontserrat10W500,
                                                ),
                                          margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                          decoration: BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
                                        ),
                                        Container(
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,

                                          // width: sequenceSize.width * 0.14,
                                          // height: Get.height * 0.04,
                                          // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          width: editModeController.editMode == true
                                              ? constraints.maxWidth < 1000
                                                  ? Get.width * 0.18
                                                  : Get.width * 0.08
                                              : null,
                                          height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            '\$500',
                                            style: greyMontserrat10W500,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // child: const TextField(
                                          //   style: textFieldStyle,
                                          //   decoration: InputDecoration(prefixStyle: prefixTextStyle, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                                          // ),
                                          // margin: EdgeInsets.only(right: Get.width * 0.04),
                                          decoration: BoxDecoration(color: editModeController.editMode == true ? backGroundColor : Colors.transparent, borderRadius: BorderRadius.circular(4)),
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
                  visible: editModeController.editMode,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: Get.height * 0.019,
                    ),
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              // width: constraints.maxWidth < 1000 ? Get.width * 0.3 : Get.width * 0.15,
                              // height: Get.height * 0.04,
                              width: editModeController.editMode == true
                                  ? constraints.maxWidth < 1000
                                      ? Get.width * 0.3
                                      : Get.width * 0.15
                                  : constraints.maxWidth < 1000
                                      ? Get.width * 0.33
                                      : Get.width * 0.15,
                              height: editModeController.editMode == true ? Get.height * 0.04 : null,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02
                                  // left: constraints.maxWidth < 1000
                                  //     ? constraints.maxWidth < 800
                                  //         ? Get.width * 0.04
                                  //         : Get.width * 0.03
                                  //     : 37
                                  ),
                              child: TextField(
                                controller: _monthlyIncomeNameController,
                                style: textFieldStyle,
                                decoration: InputDecoration(hintStyle: expenseNameStyle2, hintText: expenseName, contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
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
                                  width: editModeController.editMode == true
                                      ? constraints.maxWidth < 1000
                                          ? Get.width * 0.18
                                          : Get.width * 0.08
                                      : null,
                                  height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                  alignment: Alignment.center,
                                  child: GetBuilder<SelectedDropDownItem>(
                                    builder: (dropDownController) {
                                      return DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Text(
                                            chooseDate,
                                            style: chooseDateStyle,
                                          ),
                                          value: dropDownController.selectedSingleDate,
                                          // value: controller.selectedItem,
                                          style: dropDownStyle,
                                          items: dateList.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items,
                                                style: dropDownStyle2,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (item) {
                                            dropDownController.changeSingleDate(item: item);
                                          },
                                          isExpanded: true,

                                          icon: const Icon(
                                            Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                            // color: AppTheme.colorGrey,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // child: dropDownDayGetBuilder(dropDownList: dateList),
                                  margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                  decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 6),
                                  // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                  // height: Get.height * 0.04,
                                  width: editModeController.editMode == true
                                      ? constraints.maxWidth < 1000
                                          ? Get.width * 0.18
                                          : Get.width * 0.08
                                      : null,
                                  height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                  alignment: Alignment.center,
                                  child: GetBuilder<SelectedDropDownItem>(
                                    builder: (monthDropDownController) {
                                      // return commonDropDown(itemList: dropDownList, value: controller.selectedSingleWeek);
                                      return DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Text(
                                            chooseMonth,
                                            style: chooseDateStyle,
                                          ),
                                          value: monthDropDownController.selectedSingleMonth,
                                          // value: controller.selectedItem,
                                          style: dropDownStyle,
                                          items: months.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items,
                                                style: dropDownStyle2,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (item) {
                                            monthDropDownController.changeSingleMonth(item: item);
                                          },
                                          isExpanded: true,

                                          icon: const Icon(
                                            Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                            // color: AppTheme.colorGrey,
                                          ),
                                        ),
                                      );
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
                                  width: editModeController.editMode == true
                                      ? constraints.maxWidth < 1000
                                          ? Get.width * 0.18
                                          : Get.width * 0.08
                                      : null,
                                  height: editModeController.editMode == true ? Get.height * 0.04 : null,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 6),
                                  child: SizedBox(
                                    height: Get.height * 0.04,
                                    width: Get.width * 0.08,
                                    child: TextField(
                                      controller: _monthly,
                                      style: textFieldStyle,
                                      decoration: const InputDecoration(prefixStyle: prefixTextStyle, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                                    ),
                                  ),
                                  // margin: EdgeInsets.only(right: Get.width * 0.04),
                                  decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // MaterialButton(
                //   onPressed: () {
                //     print('jjjjjjjjjj');
                //     setState(() {
                //       final controller = Get.put(SelectedDropDownItem());
                //       final checkBoxController = Get.put(CheckBoxController());
                //
                //       setState(() {
                //         MonthlyIncomeModel.monthlyIncomeList.add(MonthlyIncomeModel(expenseName: _monthlyIncomeNameController.text, amount: _monthly.text));
                //         controller.selectedMonthlyIncomeDateList.add(controller.selectedDate2 as Object);
                //         controller.selectedMonthlyIncomeMonthList.add(controller.selectedMonth2 as Object);
                //         // checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
                //       });
                //     });
                //   },
                //   color: Colors.red,
                //   child: Text('add'),
                //   height: 50,
                //   minWidth: 100,
                // ),
                Visibility(
                  visible: editModeController.editMode,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.01),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          final controller = Get.put(SelectedDropDownItem());
                          final checkBoxController = Get.put(CheckBoxController());
                          MonthlyIncomeModel.monthlyIncomeList.add(MonthlyIncomeModel(expenseName: _monthlyIncomeNameController.text, amount: _monthly.text));
                          controller.selectedMonthlyIncomeDateList.add(controller.selectedSingleDate as Object);
                          controller.selectedMonthlyIncomeMonthList.add(controller.selectedSingleMonth as Object);
                          // checkBoxController.monthlyExpenseCheckBoxValueList.add(false);
                        });
                        // addMonthlyIncomeVisibility.changeVisibility();
                      },
                      child: Align(
                        alignment: const FractionalOffset(0.015, 0.0),
                        child: Text(
                          addWeeklyIncome,
                          style: addWeekIncomeStyle,
                        ),
                      ),
                    ),
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
              style: blackMontserrat15W600,
            ),
            monthlyIncomeEditMode.editMode == false
                ? IconButton(
                    onPressed: () {
                      monthlyIncomeEditMode.showEditMode();
                    },
                    icon: const Icon(Icons.ten_k_rounded))
                : Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () {},
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



  _showPopupMenu(){
    showMenu<String>(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(25.0, 0.0, 0.0, 0.0),      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_user.png',title: 'Profile'), value: '1',onTap: (){print("Profile====>");},),
        PopupMenuDivider(height: 0.0),
        PopupMenuItem<String>(
            child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_credit_card.png',title: 'Chase Bank #2345'), value: '2',onTap: (){print("Profile====>");}),
        PopupMenuDivider(height: 0.0),
        PopupMenuItem<String>(
            child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_credit_card.png',title: 'Chime Bank #1568'), value: '3',onTap: (){print("Profile====>");}),
        PopupMenuDivider(height: 0.0),
        PopupMenuItem<String>(child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_user_plus.png',title: 'Add Account'), value: '4',onTap: (){print("Add Account====>");}),
        const PopupMenuDivider(height: 0.0),
        PopupMenuItem<String>(
            child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_setting.png',title: 'Setting'), value: '5',onTap: (){print("Setting====>");}),
        const PopupMenuDivider(height: 0.0),
        PopupMenuItem<String>(child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_logout.png',title: 'Logout'), value: '5',onTap: (){print("Setting====>");}),
        //PopupMenuItem<String>(child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_logout.png',title: 'Logout',colors: Colors.red,stlyes: whiteMontserrat14w500), value: '5',onTap: (){print("Setting====>");}),
      ],
      elevation: 8.0,
    );
  }

  getOptionItem({String? imagePath,String? title,colors = Colors.transparent,TextStyle? stlyes = blackMontserrat14w500}) {
    return Container(
      height: 40,
      width: double.infinity,
      color: colors,
      child: Row(
        children: [
            Image.asset(imagePath ?? "",scale: 3.5,color: commonTextColor,),
            const SizedBox(width: 14),
            Text(title ?? "",style: stlyes)
        ],
      ),
    );
  }

}
