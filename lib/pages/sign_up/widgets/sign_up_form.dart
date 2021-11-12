import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';

class SignUpForm extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpForm({@required this.nameController,@required this.emailController,@required this.passwordController});

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
        CommonText(
          'Password',
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
        )
      ],
    );
  }
}
