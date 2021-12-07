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
  List<String> date1List = [
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
  ];
  List<String> columnNameList = ['Income name', 'Paid on', 'Every', 'Amount'];
  List<String> column1NameList = ['Expense name', 'Due on', 'Every', 'Amount'];
  List<String> item = [
    "Item A",
    "Item B",
  ];
  List<String> paidOnList = [
    "1st",
    "15th",
  ];
  List<String> dueOnList = [
    "1st",
    "15th",
  ];

  List<String> everyList = ['1 Month', '1 Month'];
  List<String> every1List = ['1 Month', '1 Month'];

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
            child: SingleChildScrollView(
              physics:AlwaysScrollableScrollPhysics(),
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
                  monthlyIncomeBox(context, columnNameList, item, everyList, paidOnList, date1List),
                  SizedBox(
                    height: 20.0,
                  ),
                  monthlyExpenseBox(context, column1NameList, item, every1List, dueOnList, date1List), SizedBox(
                    height: 20.0,
                  ),
                  weeklyBudgetBox(context,date1List),
                ],
              ),
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
