import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class WebSelectMonthlyExpensePage extends StatefulWidget {
  const WebSelectMonthlyExpensePage({Key key}) : super(key: key);

  @override
  _WebSelectMonthlyExpensePageState createState() => _WebSelectMonthlyExpensePageState();
}

class _WebSelectMonthlyExpensePageState extends State<WebSelectMonthlyExpensePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Center(
        child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
          color: Colors.yellow,
          child: CommonText("WebSelectMonthlyExpensePage"),
          onPressed: (){
            stepIndexController.sink.add(5);
          }
        ),
      ),
    );
  }
}
