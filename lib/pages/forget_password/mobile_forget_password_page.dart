import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_name_app_bar.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/forget_password/widgets/forget_password_form.dart';
import 'package:for_cash/pages/forget_password/forget_password_view_model.dart';

class MobileForgetPasswordPage extends StatefulWidget {
  @override
  _MobileForgetPasswordPageState createState() => _MobileForgetPasswordPageState();
}

class _MobileForgetPasswordPageState extends State<MobileForgetPasswordPage> {

  ForgetPasswordViewModel model;

  @override
  Widget build(BuildContext context) {
    model ?? (model = ForgetPasswordViewModel(this));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonNameAppBar(context, 'Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Center(child: CommonText('We will Send you a Verification Link',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppTheme.colorGrey,
                maxline: 2,
              )),
              SizedBox(
                height: 40.0,
              ),
              emailForm()
            ],
          ),
        ),
      ),
      bottomNavigationBar: saveButton(),
    );
  }

  Widget emailForm() => Form(
    key: model.formKey,
    child: ForgetPasswordForm(
      emailController: model.emailController,
    ),
  );

  Widget saveButton() => Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
            onPressed: model.onTapSave,
              color: AppTheme.colorAccent,
            elevation: 0,
            child: CommonText(
              'Save',
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    ),
  );

}
