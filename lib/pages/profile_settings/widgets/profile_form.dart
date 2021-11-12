import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';

class ProfileForm extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  ProfileForm(
      {@required this.nameController,
      @required this.emailController,
      @required this.passwordController,
      @required this.confirmNewPasswordController,
      @required this.newPasswordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          'Full Name',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppTheme.colorGrey,
        ),
        SizedBox(
          height: 10,
        ),
        CommonTextField(
          text: 'Name',
          controller: nameController,
          inputType: TextInputType.name,
          isFill: true,
        ),
        SizedBox(
          height: 30,
        ),
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
          text: 'Email address',
          controller: emailController,
          inputType: TextInputType.emailAddress,
          isFill: true,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              'Password',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.colorGrey,
            ),
            CommonText(
              'Forgot password?',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppTheme.colorGrey,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        CommonTextField(
          text: 'Password',
          controller: passwordController,
          inputType: TextInputType.name,
          isFill: true,
          iconSuffix: CommonImageAsset(
            image: Constants.ic_pass_hide,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        CommonText(
          'New Password',
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
          inputType: TextInputType.name,
          isFill: true,
          iconSuffix: CommonImageAsset(
            image: Constants.ic_pass_hide,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CommonText(
          'Minimum 6 Character required*',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppTheme.colorGrey,
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
          controller: passwordController,
          inputType: TextInputType.name,
          isFill: true,
          iconSuffix: CommonImageAsset(
            image: Constants.ic_pass_hide,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
