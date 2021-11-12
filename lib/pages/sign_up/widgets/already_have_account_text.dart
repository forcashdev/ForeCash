import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/login/mobile_login_page.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonText(
            'Already have an account?',
            fontSize: 16,
            color: AppTheme.colorGrey,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MobileLoginPage())),
            child: CommonText(
              'Login ',
              fontWeight: FontWeight.w700,
              color: AppTheme.colorAccent,
              fontSize: 16,
            ),
          ),
        ],
      );
}
