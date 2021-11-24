import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_dashboard_appbar.dart';
import 'package:for_cash/app/widgets/common_divider_line.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_switch.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/dashboard_page/widgets/common_one_time_income_row.dart';
import 'package:for_cash/pages/dashboard_page/widgets/common_week_box.dart';
import 'package:for_cash/pages/forget_password/mobile_forget_password_page.dart';
import 'package:for_cash/pages/notification/mobile_notification_page.dart';
import 'package:for_cash/pages/profile_settings/mobile_profile_settings_page.dart';

import 'dashboard_page_view_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  DashboardPageViewModel model;

  @override
  Widget build(BuildContext context) {
    model ?? (model = DashboardPageViewModel(this));
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackground,
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                CommonDashboardAppbar(
                  onTapNotification: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MobileNotificationPage()));
                  },
                  onTapProfile: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MobileProfileSettingsPage()));
                  },
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              // color: AppTheme.colorBGWhite,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  weeklyBalanceBox(size),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  incomeThisWeekBox(size),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        currentWeekBox(size),
                        calenderWidget(size),
                        monthlyIncomeBox(size, "Monthly Income"),
                        itemAndIncomeList(size),
                        CommonDividerLine(
                          width: size.width,
                          height: 1.0,
                          color: AppTheme.colorWhite,
                        ),
                        monthlyIncomeBox(size, "Weekly Income", topPadding: 25.0),
                        itemAndIncomeList(size),
                        CommonDividerLine(
                          width: size.width,
                          height: 1.0,
                          color: AppTheme.colorWhite,
                        ),
                        monthlyIncomeBox(size, "Monthly Expense", topPadding: 25.0),
                        itemAndIncomeList(size),
                        CommonDividerLine(
                          width: size.width,
                          height: 1.0,
                          color: AppTheme.colorWhite,
                        ),
                        monthlyIncomeBox(size, "Weekly Expense", topPadding: 25.0),
                        itemAndIncomeList(size),
                        CommonDividerLine(
                          width: size.width,
                          height: 1.0,
                          color: AppTheme.colorWhite,
                        ),
                        addButtonIncomeExpenseBox(size),
                        previousWeekbalance(size),
                        totalWeeklyIncomBox(size),
                        totalWeeklyExpenseBox(size),
                        Container(
                          height: 10.0,
                          color: Colors.white,
                        ),
                        Container(
                            width: size.width,
                            height: 3.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF).withOpacity(0.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[50],
                                  offset: Offset(1.0, 0.0), //(x,y)
                                  blurRadius: 8.0,
                                ),
                              ],
                            )),
                        endOfBalance(size),
                        SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.19),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 27.0,
                          width: 27.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: AppTheme.colorBGWhite,
                              border: Border.all(width: 1.5, color: AppTheme.colorBGWhite)),
                          child: Stack(
                            children: [
                              Center(
                                child: CommonImageAsset(
                                  image: Constants.ic_up_arrow,
                                  height: 9.0,
                                  width: 7.0,
                                  color: AppTheme.colorBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget weeklyBalanceBox(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.075,
      decoration: BoxDecoration(
        color: AppTheme.colorAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.only(left: 17.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CommonText(
                "Forecash Weekly Balance",
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                width: 10.0,
              ),
              CommonImageAsset(
                image: Constants.ic_warning,
                height: 14.0,
                width: 14.0,
              )
            ],
          ),
          CommonText(
            "\$5,000",
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            maxline: 1,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget incomeThisWeekBox(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.075,
      child: Row(
        children: [
          CommonWeekBox(
            title: "Income This Week",
            total: "\$4,200",
          ),
          SizedBox(
            width: 10.0,
          ),
          CommonWeekBox(
            title: "Expenses This Week",
            total: "\$150",
          )
        ],
      ),
    );
  }

  bool switchControl = false;

  void simulateSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
      });
      print('Switch is ON');
      // Put your code here which you want to execute on Switch ON event.

    } else {
      setState(() {
        switchControl = false;
      });
      print('Switch is OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  Widget currentWeekBox(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.08,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  "Current Week",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  maxline: 1,
                  color: AppTheme.colorGreyDark,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.0,
                ),
                CommonText(
                  "Sep 11 - Sep 16",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  maxline: 1,
                  color: AppTheme.colorGreyDark,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: CommonText(
                    "Simulate Mode OFF",
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    maxline: 1,
                    color: AppTheme.colorGreyDark,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Center(
                  child: CustomSwitch(
                    onChanged: simulateSwitch,
                    value: switchControl,
                    enableColor: AppTheme.colorAccent,
                    disableColor: AppTheme.colorBackground,
                    width: 37.0,
                    height: 19.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> dateList = ["Feb,23", "Feb 25", "Feb 28", "31 Feb"];

  Widget calenderWidget(size) {
    return Container(
      width: size.width,
      height: size.height * 0.08,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CommonImageAsset(
                image: Constants.ic_calender_primary,
                height: 30.0,
                width: 30.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              CommonText(
                "Calender",
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                maxline: 1,
                color: AppTheme.colorBlack,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonImageAsset(
                  image: Constants.ic_arrow_left,
                  width: 15.0,
                  height: 15.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  width: size.width * 0.43,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CommonText(
                            dateList[index],
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            maxline: 1,
                            color: AppTheme.colorGreyDark,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 25.0,
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                CommonImageAsset(
                  image: Constants.ic_arrow_right,
                  width: 15.0,
                  height: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget monthlyIncomeBox(Size size, title, {topPadding}) {
    return Container(
      width: size.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          topPadding != null
              ? SizedBox(
                  height: 20.0,
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonText(
                    title,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    maxline: 1,
                    color: AppTheme.colorBlack,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CommonImageAsset(
                    image: Constants.ic_edit,
                    height: 20.0,
                    width: 20.0,
                  )
                ],
              ),
              CommonImageAsset(
                image: Constants.ic_minimize,
                height: 20.0,
                width: 20.0,
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          CommonDividerLine(
            width: size.width,
            height: 2.0,
            color: AppTheme.colorWhite,
          )
        ],
      ),
    );
  }

  List<String> item = [
    "Item A",
    "Item B",
    "ItemC",
    "Item D",
    "Item E",
    "Item F",
    "Item G",
  ];

  itemAndIncomeList(Size size) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 14.0),
                      child: Center(
                        child: CommonText(
                          item[i].toString(),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600,
                          maxline: 1,
                          color: AppTheme.colorBlack,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            CommonDividerLine(
              width: 1.0,
              color: AppTheme.colorWhite,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  height: 240,
                  color: Colors.white,
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.5,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                    crossAxisCount: 3,
                    children: List.generate(18, (index) {
                      return Center(
                        child: CommonText(
                          "-",
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          maxline: 1,
                          color: AppTheme.colorBlack,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }),
                  ),
                )),
          ],
        ),
        Container(
          height: 25.0,
          width: 25.0,
          margin: EdgeInsets.only(left: size.width * 0.365),
          decoration: BoxDecoration(color: AppTheme.colorWhite, borderRadius: BorderRadius.circular(50.0)),
          child: Center(
            child: CommonImageAsset(
              image: Constants.ic_arrow_right,
              height: 15.0,
              width: 15.0,
              color: AppTheme.colorGreyDark,
            ),
          ),
        ),
      ],
    );
  }

  addButtonIncomeExpense(Size size, title, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height * 0.065,
        decoration: BoxDecoration(color: AppTheme.colorPrimaryLight1, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: CommonText(
            title,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            maxline: 1,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  bool isAddTimeIncome = false;
  List<String> columnNameList = ['Income name', 'Due on', 'Every', 'Amount'];
  List<String> dueOnList = ['1st', '2nd', '3rd', '4th', '5th', '6th'];
  List<String> everyList = ['1 Mon', '2 Mon', '3 Mon', '4 Mon'];
  String dueOnSelectedValue = '1st';
  String everySelectedValue = '1 Mon';
  double _animatedHeight = 165.0;

  Widget addButtonIncomeExpenseBox(size) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          if (isAddTimeIncome)
            InkWell(
                onTap: () {
                  setState(() {
                    isAddTimeIncome = false;
                    _animatedHeight != 0.0 ? _animatedHeight = 0.0 : _animatedHeight = 100.0;
                  });
                },
                child: AnimatedContainer(
                  height: _animatedHeight,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      Container(
                        height: 30.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonText(
                              "One Time Income",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              maxline: 1,
                              color: AppTheme.colorBlack,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: CommonText(
                                "Save",
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                maxline: 1,
                                color: AppTheme.colorAccent,
                                overflow: TextOverflow.ellipsis,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isAddTimeIncome = false;
                                });
                              },
                              child: CommonText(
                                "Cancel",
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                maxline: 1,
                                color: AppTheme.colorRed,
                                decoration: TextDecoration.underline,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CommonDividerLine(
                        height: 1.0,
                        color: AppTheme.colorWhite,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CommonOneTimeIncomeRow(
                        columnNameList: columnNameList,
                        dueOnList: dueOnList,
                        totalRowLength: 4,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CommonDividerLine(
                        height: 1.0,
                        color: AppTheme.colorWhite,
                      ),
                    ],
                  ),
                ))
          else
            addButtonIncomeExpense(size, "Add One Time Income", () {
              print("Click -> ");
              setState(() {
                isAddTimeIncome = true;
              });
            }),
          SizedBox(
            height: 10.0,
          ),
          addButtonIncomeExpense(size, "Add One Time Expense", () {}),
        ],
      ),
    );
  }

  previousWeekbalance(Size size) {
    return Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: CommonText(
                "Previous Week Balance",
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                maxline: 1,
                color: AppTheme.colorBlack,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            CommonDividerLine(
              height: 1.0,
              width: size.width,
              color: AppTheme.colorWhite,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                CommonDividerLine(
                  width: 1.0,
                  color: AppTheme.colorWhite,
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      height: size.height * 0.05,
                      color: Colors.white,
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.5,
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                        crossAxisCount: 3,
                        children: List.generate(3, (index) {
                          return Center(
                            child: CommonText(
                              "-",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              maxline: 1,
                              color: AppTheme.colorBlack,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ));
  }

  totalWeeklyIncomBox(size) {
    return Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonDividerLine(
              height: 1.0,
              color: AppTheme.colorWhite,
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CommonText(
                "Total Weekly Income",
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                maxline: 1,
                color: AppTheme.colorBlack,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            CommonDividerLine(
              height: 1.0,
              width: size.width,
              color: AppTheme.colorWhite,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                CommonDividerLine(
                  width: 1.0,
                  color: AppTheme.colorWhite,
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      height: size.height * 0.05,
                      color: Colors.white,
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.5,
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                        crossAxisCount: 3,
                        children: List.generate(3, (index) {
                          return Center(
                            child: CommonText(
                              "-",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              maxline: 1,
                              color: AppTheme.colorBlack,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ));
  }

  totalWeeklyExpenseBox(Size size) {
    return Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonDividerLine(
              height: 1.0,
              color: AppTheme.colorWhite,
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CommonText(
                "Total Weekly Expense",
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                maxline: 1,
                color: AppTheme.colorBlack,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            CommonDividerLine(
              height: 1.0,
              width: size.width,
              color: AppTheme.colorWhite,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                CommonDividerLine(
                  width: 1.0,
                  color: AppTheme.colorWhite,
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      height: size.height * 0.05,
                      color: Colors.white,
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.5,
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                        crossAxisCount: 3,
                        children: List.generate(3, (index) {
                          return Center(
                            child: CommonText(
                              "-",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              maxline: 1,
                              color: AppTheme.colorBlack,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            CommonDividerLine(
              height: 1.0,
              color: AppTheme.colorWhite,
            )
          ],
        ));
  }

  List<int> totalList = [
    6050,
    9500,
    5900,
  ];

  endOfBalance(Size size) {
    return Container(
      width: size.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            "End of Week Balance",
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            maxline: 1,
            color: AppTheme.colorPrimaryLight,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                ),
              ),
              CommonDividerLine(
                width: 1.0,
                color: AppTheme.colorWhite,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: size.height * 0.05,
                    alignment: Alignment.center,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.5,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                      crossAxisCount: 3,
                      children: List.generate(totalList.length, (index) {
                        return Center(
                          child: CommonText(
                            "\$${totalList[index]}",
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            maxline: 1,
                            color: index != 2 ? AppTheme.colorAccent : AppTheme.colorOrange,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
