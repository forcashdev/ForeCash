import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/common_widget/common_textfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/common_widget/email_validation.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/reset_password_screen.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _email = TextEditingController();
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        var _keyboardVisible = MediaQuery.of(context).viewInsets.bottom;
        final maxWidth = constraints.maxWidth > 1000;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: maxWidth ? backGroundColor : null,
          appBar: maxWidth
              ? AppBarWithUserName.appBarWithUserNAme()
              : CommonMobileAppbar.commonMobileAppbar(
                  centerTitle: true,
                  color: Colors.white.withOpacity(0.9),
                  titleTextStyle: mobileAppBarStyle,
                  title: Text(forgotPass2),
                  leading: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
              width: constraints.maxWidth > 1000 ? 600 : null,
              // height: constraints.maxWidth > 1000 ? 450 : null,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : Get.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      maxWidth ? Container() : commonDivider(),
                      SizedBox(
                        height: maxWidth ? Get.height * 0.03 : 0.0,
                      ),
                      maxWidth
                          ? InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                backButton,
                                style: backButtonStyle,
                              ),
                            )
                          : Container(),
                      maxWidth
                          ? Align(
                              alignment: FractionalOffset(0.5, 0.0),
                              child: Text(
                                forgotPass2,
                                style: mobileAppBarStyle,
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: maxWidth ? Get.height * 0.015 : Get.height * 0.03,
                      ),
                      Align(
                        alignment: FractionalOffset(0.5, 0.0),
                        child: Text(
                          forgotPassSubTitle,
                          style: textSpanStyle1,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.045,
                      ),
                      Text(emailAdd, style: fullNameHintStyle),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: _keyboardVisible == 0
                                ? maxWidth
                                    ? Get.height * 0.17
                                    : Get.height * 0.5
                                : Get.height * 0.2),
                        child: commonTextField(
                          contentPadding: const EdgeInsets.only(left: 13),
                          hint: emailAddress,
                          controller: _email,
                          validator: (value) {
                            if (_email.text.isEmpty) {
                              return 'Enter email';
                            }
                            if (_email.text.isValidEmail()) {
                              return null;
                            } else {
                              return notValidEmail;
                            }
                          },
                        ),
                      ),
                      Align(
                        child: CommonMaterialButton.commonButton(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              Get.to(ResetPasswordScreen());
                            }
                          },
                          text: send,
                          height: 50,
                        ),
                        alignment: Alignment.bottomCenter,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
