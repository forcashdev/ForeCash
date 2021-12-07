import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class WebWeeklyBudgetNoneBorder extends StatefulWidget {
  const WebWeeklyBudgetNoneBorder({Key key}) : super(key: key);

  @override
  _WebWeeklyBudgetNoneBorderState createState() => _WebWeeklyBudgetNoneBorderState();
}

class _WebWeeklyBudgetNoneBorderState extends State<WebWeeklyBudgetNoneBorder> {
  List<int> datalist = [0, 1, 2, 3,4];
  List expenseNameList = [
    "Grocery",
    "Gas",
    "Free Spend / Entertainment",
    "Saving Contribution",
    "Childcare",
  ];
  List incomeTextList = [];
  List amountTextList = [];
  List apiEveryList = [
    "15th",
    "16th",
    "17th",
    "18th",
    "17th",
    "18th",
    "17th",
  ];
  List apiPaidList = [
    "2 Weeks",
    "2 Weeks",
    "2 Weeks",
    "2 Weeks",
    "2 Weeks",
    "2 Weeks",
    "2 Weeks",
  ];

  List selectedPaid = [];
  List selectedEvery = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 500, maxWidth: 1600),
      decoration: BoxDecoration(
        border: Border.all(
          width: .5,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
        },
        // border: TableBorder.symmetric(
        //     outside: BorderSide(
        //         color: AppTheme.colorGrey.withOpacity(.5), width: 1)),
        children: [
          //Header
          TableRow(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white, width: 0.5)),
              ),
              children: [
                CommonText(
                  'Expense Name',
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  fontSize: 16.0,
                ),
                CommonText(
                  'Reset On',
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  fontSize: 16.0,
                ),
                CommonText(
                  'Every',
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  fontSize: 16.0,
                ),
                CommonText(
                  'Amount',
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  fontSize: 16.0,
                ),
              ]),

          //Rows
          ...datalist.map((item) {
            incomeTextList.add(TextEditingController());
            amountTextList.add(TextEditingController());
            selectedPaid.add('1 Month');
            selectedEvery.add('15th');
            return TableRow(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
                        color: Colors.white,
                        child: CommonText(
                          expenseNameList[item],
                          color: AppTheme.colorBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
                    // color: Colors.yellow,
                    child: CommonText(
                      "Fri",
                      color: AppTheme.colorBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
                    // color: Colors.yellow,
                    child: CommonText(
                      "1 Month",
                      color: AppTheme.colorBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
                    // color: Colors.yellow,
                    child: CommonText(
                      "\$500",
                      color: AppTheme.colorBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            );
          }).toList()
        ],
      ),
    );
  }
}
