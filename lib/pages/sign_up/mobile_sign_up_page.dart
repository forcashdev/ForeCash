import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_app_bar.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/sign_up/sign_up_page_view_model.dart';

import 'widgets/already_have_account_text.dart';
import 'widgets/get_started_text.dart';
import 'widgets/sign_up_form.dart';

class MobileSignUpPage extends StatefulWidget {
  @override
  MobileSignUpPageState createState() => MobileSignUpPageState();
}

class MobileSignUpPageState extends State<MobileSignUpPage> {
  SignUpPageViewModel model;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    model ?? (model = SignUpPageViewModel(this));
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
              Center(child: GetStartedText()),
              SizedBox(
                height: 40,
              ),
              accountForm(size),
            ],
          ),
        ),
      ),
      bottomNavigationBar: signUpButton(),
    );
  }

  Widget accountForm(Size size) =>
      Form(
        key: model.formKey,
        child: SignUpForm(
          nameController: model.nameController,
          emailController: model.emailController,
          passwordController: model.passwordController,
        ),
      );

  Widget signUpButton() =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 60,
              child: CommonButton(
                buttonType: ButtonType.ElevatedButton,
                onPressed: model.validateSignUp,
                color: AppTheme.colorAccent,
                elevation: 0,
                child:CommonText(
                  'Sign up',
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
            AlreadyHaveAccountText()
          ],
        ),
      );
}
