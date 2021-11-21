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
        RichText(
            textAlign: TextAlign.center,
            maxLines: 4,
            text: TextSpan(
                text: 'We’ve identified reoccuring Monthly Incomes. Select which monthly incomes, such as ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppTheme.colorGrey,
                  fontFamily: AppTheme.fontName,
                ),
                children: [
                  TextSpan(
                    text: 'bills, childcare, or even weekly savings contributions. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      fontFamily: AppTheme.fontName,
                      color: AppTheme.colorGrey,
                    ),
                  )
                ])),

      ],
    );
  }
}
