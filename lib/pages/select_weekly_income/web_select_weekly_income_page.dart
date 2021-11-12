import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class WebSelectWeeklyIncomePage extends StatefulWidget {
  const WebSelectWeeklyIncomePage({Key key}) : super(key: key);

  @override
  _WebSelectWeeklyIncomePageState createState() => _WebSelectWeeklyIncomePageState();
}

class _WebSelectWeeklyIncomePageState extends State<WebSelectWeeklyIncomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Center(
        child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
          color: Colors.yellow,
          child: CommonText("WebSelectWeeklyIncomePage"),
          onPressed: (){
            stepIndexController.sink.add(4);
          }
        ),
      ),
    );
  }
}
