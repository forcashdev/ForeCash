import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class SelectWeeklyIncomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          'Select Weekly Incomes',
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
                    text: 'weekly or bi-weekly paychecks, alimony, child support, etc ',
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
