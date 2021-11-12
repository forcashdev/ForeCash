import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class WebBankAccountPage extends StatefulWidget {
  const WebBankAccountPage({Key key}) : super(key: key);

  @override
  WebBankAccountPageState createState() => WebBankAccountPageState();
}

class WebBankAccountPageState extends State<WebBankAccountPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          );
        } else {
          return Container(
            width: 50.0,
            height: 50.0,
            color: Colors.pink,
            child: Center(
              child: InkWell(
                child: CommonText("Next"),
                onTap: () {
                  stepIndexController.sink.add(2);
                },
              ),
            ),
          );
        }
      },
    );
  }
}

// // IsMobile
// if (constraints.maxWidth < 850) {
// return Container(
// height: double.infinity,
// width: double.infinity,
// color: Colors.red,
// );
// }
// // IsTablet
// else if (constraints.maxWidth < 1100 &&
// constraints.maxWidth >= 850) {
// return Container(
// height: double.infinity,
// width: double.infinity,
// color: Colors.yellow,
// );
// }
// // IsWeb
// else {
// return Container(
// height: double.infinity,
// width: double.infinity,
// color: Colors.purple,
// );
// }
