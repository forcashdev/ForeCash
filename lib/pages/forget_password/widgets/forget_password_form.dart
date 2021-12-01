import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  ForgetPasswordForm({@required this.emailController});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          'Email',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppTheme.colorGrey,
        ),
        SizedBox(
          height: 10,
        ),
        CommonTextField(
          text:"Email address",
          hintText: 'Email address',
          controller: emailController,
          inputType: TextInputType.emailAddress,
          isFill: true,
        ),
      ],
    );
  }
}
