import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class WebSelectWeeklyBudgetPage extends StatefulWidget {
  const WebSelectWeeklyBudgetPage({Key key}) : super(key: key);

  @override
  _WebSelectWeeklyBudgetPageState createState() => _WebSelectWeeklyBudgetPageState();
}

class _WebSelectWeeklyBudgetPageState extends State<WebSelectWeeklyBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Center(
        child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
            color: Colors.yellow,
            child: CommonText("WebSelectWeeklyBudgetPage"),
            onPressed: (){
              stepIndexController.sink.add(6);
            }
        ),
      ),
    );
  }
}
