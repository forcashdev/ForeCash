
import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_app_bar.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/verify_transaction/verify_transaction_view_model.dart';
import 'package:for_cash/pages/verify_transaction/widget/get_table_data.dart';
import 'package:for_cash/pages/verify_transaction/widget/verify_transaction_text.dart';

class MobileVerifyTransactionPage extends StatefulWidget {
  @override
  _MobileVerifyTransactionPageState createState() =>
      _MobileVerifyTransactionPageState();
}

class _MobileVerifyTransactionPageState
    extends State<MobileVerifyTransactionPage> {

  VerifyTransactionViewModel model;

  List<String> paidOnList = ['1st', '2nd', '3rd', '4th', '5th', '6th'];
  List<String> everyList = ['1 Mon', '2 Mon', '3 Mon', '4 Mon'];
  String paidOnSelectedValue = '1st';
  String everySelectedValue = '1 Mon';
  List<String> expenseList = ['Rent', 'Insurance', 'Car Payment', 'AMEX CC'];

  @override
  Widget build(BuildContext context) {
    model ?? (model = VerifyTransactionViewModel(this));
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar(context, false),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: VerifyTransactionText())),
            SizedBox(
              height: 40,
            ),
            GetTableDataWidget(
              expenseList: expenseList,
              totalRowLength: 5,
              everyList: everyList,
              paidOnList: paidOnList,
              everySelectedValue: everySelectedValue,
              paidOnSelectedValue: paidOnSelectedValue,
            ),
            // customTable(size),
          ],
        ),
      ),
      bottomNavigationBar: nextButton(),
    );
  }

  Widget nextButton() => Container(
    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
            color: AppTheme.colorAccent,
            elevation: 0,
            child:CommonText(
              'Next',
              color: AppTheme.colorGrey,
              fontSize: 14.0,
              maxline: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );

}