import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class SetupWeeklyBudgetText extends StatelessWidget {
  const SetupWeeklyBudgetText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          'Setup Weekly Budgets',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textAlign: TextAlign.center,
          maxline: 2,
        ),
        SizedBox(
          height: 10,
        ),
        CommonText(
          'We’ve identified reoccuring Weekly Budgets. Select which weekly Budgets, such as bills, childcare, or even weekly savings contributions. ',
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
