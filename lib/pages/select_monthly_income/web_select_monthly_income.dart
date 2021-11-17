import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_dropdown.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_insert_table.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';
import 'package:for_cash/pages/select_monthly_income/widgets/select_monthly_income_text.dart';

class WebSelectMonthlyIncomePage extends StatefulWidget {
  const WebSelectMonthlyIncomePage({Key key}) : super(key: key);

  @override
  _WebSelectMonthlyIncomePageState createState() =>
      _WebSelectMonthlyIncomePageState();
}

class _WebSelectMonthlyIncomePageState
    extends State<WebSelectMonthlyIncomePage> {
  bool isCheckboxChecked = false;

  List<int> datalist = [0, 1, 2];
  List incomeTextList = [];
  List amountTextList = [];
  List apiEveryList = ["15th", "16th", "17th", "18th"];
  List apiPaidList = ["1 Month", "2 Month", "3 Month", "4 Month"];

  List selectedPaid = [];
  List selectedEvery = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 750,
      constraints: BoxConstraints(minWidth: 500, maxWidth: 750),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      // margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Column(
        children: [
          SelectMonthlyIncomeText(),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
