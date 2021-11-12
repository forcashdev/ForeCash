import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class WebSelectCalanderPage extends StatefulWidget {
  const WebSelectCalanderPage({Key key}) : super(key: key);

  @override
  _WebSelectCalanderPageState createState() => _WebSelectCalanderPageState();
}

class _WebSelectCalanderPageState extends State<WebSelectCalanderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Center(
        child: CommonButton(
          buttonType: ButtonType.ElevatedButton,
          color: Colors.yellow,
          child: CommonText("WebSelectCalanderPage"),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
