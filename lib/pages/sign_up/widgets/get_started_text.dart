import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class GetStartedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          'Get Started with Forecash',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textAlign: TextAlign.center,
          maxline: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        CommonText(
          'Create your New Account',
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppTheme.colorGrey,
        )
      ],
    );
  }
}
