import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class SelectMonthlyExpenseText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          'Select Monthly Expenses',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textAlign: TextAlign.center,
          maxline: 2,
        ),
        SizedBox(
          height: 10,
        ),
        CommonText(
          'We’ve identified reoccuring Monthly Expenses. Select which monthly expenses, such as bills, debt payments, or even monthly budgets towards savings.',
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
