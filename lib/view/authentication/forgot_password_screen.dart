import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
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
          appBar: maxWidth ? appBarWithUserNAme(context: context) : null,
          body: Center(
            child: Container(
              decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
              width: constraints.maxWidth > 1000 ? 600 : null,
              height: constraints.maxWidth > 1000 ? 450 : null,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: maxWidth ? 0.0 : Get.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        maxWidth
                            ? const SizedBox()
                            : IconButton(
                                splashRadius: 0.1,
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.chevron_left,
                                )),
                        maxWidth
                            ? Container()
                            : Text(
                                forgotPass2,
                                style: mobileAppBarStyle,
                              ),
                        SizedBox(
                          width: context.isTablet ? Get.width * 0.0 : Get.width * 0.1,
                        )
                      ],
                    ),
                    maxWidth ? Container() : commonDivider(),
                    SizedBox(
                      height: maxWidth ? Get.height * 0.03 : 0.0,
                    ),
                    maxWidth
                        ? InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.03),
                              child: Text(
                                backButton,
                                style: backButtonStyle,
                              ),
                            ),
                          )
                        : Container(),
                    maxWidth
                        ? Align(
                            alignment: const FractionalOffset(0.5, 0.0),
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
                      alignment: const FractionalOffset(0.5, 0.0),
                      child: Text(
                        forgotPassSubTitle,
                        style: textSpanStyle1,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.045,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: maxWidth ? Get.width * 0.03 : Get.width * 0.04),
                      child: Text(emailAdd, style: fullNameHintStyle),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: maxWidth ? Get.width * 0.03 : Get.width * 0.04,
                          right: maxWidth ? Get.width * 0.03 : Get.width * 0.04,
                          bottom: _keyboardVisible == 0
                              ? maxWidth
                                  ? Get.height * 0.17
                                  : Get.height * 0.5
                              : Get.height * 0.2),
                      child: commonTextFormField(
                        onFieldSubmit: (String value) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        inputAction: TextInputAction.done,
                        hintText: emailAddress,
                        textStyle: textFieldStyle,
                        hintStyle: textFieldHintStyle,
                        textEditingController: _email,
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                        validationFunction: (value) {
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : Get.width * 0.04),
                      child: commonButton(
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(const ResetPasswordScreen());
                          }
                        },
                        text: send,
                        height: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
