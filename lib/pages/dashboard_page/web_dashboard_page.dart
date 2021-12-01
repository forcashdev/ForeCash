import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_web_appbar.dart';
import 'package:for_cash/pages/dashboard_page/widgets/all_widget_dashboard.dart';

class WebDashboardPage extends StatefulWidget {
  const WebDashboardPage({Key key}) : super(key: key);

  @override
  _WebDashboardPageState createState() => _WebDashboardPageState();
}

class _WebDashboardPageState extends State<WebDashboardPage> {
  List<String> dateList = [
    "Sep,11",
    "Sep 17",
    "Sep 24",
    "1 Oct",
    "8 Oct",
    "15 Oct",
    "18 Oct",
  ];
  List<String> columnNameList = ['Income name', 'Paid on', 'Every', 'Amount'];
  List<String> item = [
    "Item A",
    "Item B",
  ];
  List<String> paidOnList = [
    "1st",
    "15th",
  ];

  List<String> everyList = ['1 Month', '1 Month'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: mainContent(),
      ),
    );
  }

  Widget mainContent() {
    return Column(
      children: [
        CommonWebAppBar(),
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            color: AppTheme.colorBackground,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                balanceSimulateWidget(),
                SizedBox(
                  height: 20.0,
                ),
                calenderListWidget(dateList),
                SizedBox(
                  height: 20.0,
                ),
                monthlyIncomeBox(columnNameList, item, everyList, paidOnList)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget balanceSimulateWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          weeklyBalanceBox(),
          SizedBox(
            width: 20.0,
          ),
          incomeExpenseWeekBox(),
          SizedBox(
            width: 20.0,
          ),
          currentWeekBox(),
        ],
      ),
      simulateTextSwitch(onChanged: simulateSwitch, switchControl: switchControl),
    ]);
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
}
