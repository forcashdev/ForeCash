import 'package:flutter/material.dart';
import 'package:for_cash/app/widgets/common_app_bar.dart';

import 'widgets/bank_list.dart';
import 'widgets/bank_search_field.dart';
import 'widgets/connect_bank_account_text.dart';

class MobileBankAccountPage extends StatefulWidget {
  @override
  _MobileBankAccountPageState createState() => _MobileBankAccountPageState();
}

class _MobileBankAccountPageState extends State<MobileBankAccountPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar(context, false),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Center(child: ConnectBankAccountText()),
              SizedBox(
                height: 40,
              ),
              BankSearchField(),
              SizedBox(
                height: 40,
              ),
              BankList(),
              SizedBox(height: 50.0,)
            ],
          ),
        ),
      ),
      // bottomNavigationBar: signUpButton(),
    );
  }
}
