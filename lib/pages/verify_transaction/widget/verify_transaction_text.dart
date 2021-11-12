import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class VerifyTransactionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          'Verify Transaction',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textAlign: TextAlign.center,
          maxline: 2,
        ),
        SizedBox(
          height: 10,
        ),
        CommonText(
          'Did these transactions happen? Mark them as recieved/paid or skip or move to next week.',
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          maxline: 4,
          color: AppTheme.colorGrey,
        )
      ],
    );
  }
}
