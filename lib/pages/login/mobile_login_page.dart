import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_app_bar.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/login/login_page_view_model.dart';

import 'widgets/dont_have_account_text.dart';
import 'widgets/login_forecash_text.dart';
import 'widgets/login_form.dart';

class MobileLoginPage extends StatefulWidget {
  @override
  _MobileLoginPageState createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {

  LoginPageViewModel model;

  @override
  Widget build(BuildContext context) {
    model ?? (model = LoginPageViewModel(this));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar(context, false),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
               Center(child: LoginForeCashText()),
              SizedBox(
                height: 40,
              ),
              accountLoginForm(size)
            ],
          ),
        ),
      ),
      bottomNavigationBar: loginButton(),
    );
  }

  Widget accountLoginForm(Size size) => Form(
    key: model.formKey,
    child: LoginForm(
      emailController: model.emailController,
      passwordController: model.passwordController,
    ),
  );

  Widget loginButton() => Container(
    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 60,
          child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
            onPressed: model.validateLogin,
            color: AppTheme.colorAccent,
            elevation: 0,
            child: CommonText(
              'Log in',
              color: AppTheme.colorWhite,
              fontSize: 14.0,
              maxline: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DoNotHaveAccountText()
      ],
    ),
  );

}
