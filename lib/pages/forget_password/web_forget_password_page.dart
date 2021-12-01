import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_back_button.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_web_structure.dart';
import 'package:for_cash/pages/forget_password/widgets/forget_password_form.dart';

class WebForgetPasswordPage extends StatefulWidget {
  const WebForgetPasswordPage({Key key}) : super(key: key);

  @override
  _WebForgetPasswordPageState createState() => _WebForgetPasswordPageState();
}

class _WebForgetPasswordPageState extends State<WebForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return CommonWebStructure(
        childWidget: Container(
      width: 779.0,
      height: 474.0,
      padding: EdgeInsets.only(bottom: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      // margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  CommonBackButton(
                    onBackTap: () {},
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: CommonText(
                      "Forgot Password",
                      fontWeight: FontWeight.w700,
                      color: AppTheme.colorBlack,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: CommonText(
                      "We will Send you a Verification Link",
                      fontWeight: FontWeight.w400,
                      color: AppTheme.colorGrey,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    child: ForgetPasswordForm(
                      emailController: TextEditingController(),
                    ),
                  )
                ],
              ),
            ),
            saveButton()
          ],
        ),
      ),
    ));
  }

  Widget saveButton() => Container(
        padding: EdgeInsets.only(left: 70, right: 70, top: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 45,
              child: CommonButton(
                buttonType: ButtonType.ElevatedButton,
                onPressed: () {},
                color: AppTheme.colorAccent,
                elevation: 0,
                child: CommonText(
                  'Save',
                  color: AppTheme.colorWhite,
                  fontSize: 14.0,
                  maxline: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );
}
