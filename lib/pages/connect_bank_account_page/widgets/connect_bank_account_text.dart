import 'package:flutter/material.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class ConnectBankAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CommonText(
        'Connect Bank Account',
        fontWeight: FontWeight.bold,
        fontSize: 20,
        textAlign: TextAlign.center,
        maxline: 2,
      );
}
