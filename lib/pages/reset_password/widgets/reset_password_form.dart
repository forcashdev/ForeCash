import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';

class ResetPasswordForm extends StatelessWidget {

  ResetPasswordForm({@required this.passwordController, @required this.confirmPasswordController});
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          'New password',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppTheme.colorGrey,
        ),
        SizedBox(
          height: 10,
        ),
        CommonTextField(
          text: 'Password',
          controller: passwordController,
          inputType: TextInputType.visiblePassword,
          isFill: true,
          iconSuffix: CommonImageAsset(
            image: Constants.ic_pass_hide,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        CommonText(
          'Confirm New password',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppTheme.colorGrey,
        ),
        SizedBox(
          height: 10,
        ),
        CommonTextField(
          text: 'Password',
          controller: confirmPasswordController,
          inputType: TextInputType.visiblePassword,
          isFill: true,
          iconSuffix: CommonImageAsset(
            image: Constants.ic_pass_hide,
          ),
        ),
      ],
    );
  }
}
