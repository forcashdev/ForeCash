import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class DoNotHaveAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CommonText(
        'Don’t have an account?',
        fontSize: 16,
        color: AppTheme.colorGrey,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(
        width: 10,
      ),
      InkWell(
        onTap: Navigator.of(context).pop,
        child: CommonText(
          'Sign up ',
          fontWeight: FontWeight.w700,
          color: AppTheme.colorAccent,
          fontSize: 16,
        ),
      ),
    ],
  );
}
