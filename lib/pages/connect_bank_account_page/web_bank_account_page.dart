import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/connect_bank_account_page/widgets/bank_list.dart';
import 'package:for_cash/pages/connect_bank_account_page/widgets/bank_search_field.dart';

class WebBankAccountPage extends StatefulWidget {
  const WebBankAccountPage({Key key}) : super(key: key);

  @override
  WebBankAccountPageState createState() => WebBankAccountPageState();
}

class WebBankAccountPageState extends State<WebBankAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 750,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1100) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.red,
            );
          } else {
            return SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    Center(
                      child: CommonText(
                        "Connect Checking Account",
                        color: AppTheme.colorBlack,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    BankSearchField(),
                    SizedBox(
                      height: 40,
                    ),
                    BankList()
                  ],
                ),
              ),
            );
          }
        },
      ),
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
