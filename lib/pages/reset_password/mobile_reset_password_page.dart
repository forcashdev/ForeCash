import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_name_app_bar.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/reset_password/reset_password_view_model.dart';
import 'package:for_cash/pages/reset_password/widgets/reset_password_form.dart';

class MobileResetPasswordPage extends StatefulWidget {
  @override
  _MobileResetPasswordPageState createState() =>
      _MobileResetPasswordPageState();
}

class _MobileResetPasswordPageState extends State<MobileResetPasswordPage> {
  ResetPasswordViewModel model;

  @override
  Widget build(BuildContext context) {
    model ?? (model = ResetPasswordViewModel(this));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonNameAppBar(context, 'Reset Password'),
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
              Center(child: CommonText('Create New Password',
              fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppTheme.colorGrey,
              )),
              SizedBox(
                height: 40.0,
              ),
              passwordForm()
            ],
          ),
        ),
      ),
      bottomNavigationBar: saveButton(),
    );
  }

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

  Widget passwordForm() => Form(
    key: model.formKey,
    child: ResetPasswordForm(
      passwordController: model.passwordController,
      confirmPasswordController: model.confirmPasswordController,
    ),
  );


}
