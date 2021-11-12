import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class LoginForeCashText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          'Log In to Forecash',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textAlign: TextAlign.center,
          maxline: 2,
        ),
        SizedBox(
          height: 10,
        ),
        CommonText(
          'Enter your email and password below',
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          maxline: 2,
          color: AppTheme.colorGrey,
        )
      ],
    );
  }
}
