import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/common_widget/email_validation.dart';
import 'package:fore_cash/common_widget/mix_panel.dart';
import 'package:fore_cash/controller/verify_otp_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class Otpverification extends StatefulWidget {
  const Otpverification({Key? key}) : super(key: key);

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {
  late final Mixpanel _mixpanel;
  Future<void> _initMixpanel() async {
    _mixpanel = await MixpanelManager.init();
    _mixpanel.track('$otpVerify' '$screen');
  }

  @override
  void initState() {
    super.initState();
    _initMixpanel();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _otp = TextEditingController();
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        var _keyboardVisible = MediaQuery.of(context).viewInsets.bottom;
        final maxWidth = constraints.maxWidth > 1000;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: maxWidth ? colorEDF2F6 : null,
          appBar: maxWidth ? appBarWithUserNAme(context: context) : null,
          body: Center(
            child: Container(
              decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
              width: constraints.maxWidth > 1000 ? 600 : null,
              height: constraints.maxWidth > 1000 ? 490 : null,
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
                                verification,
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
                    SizedBox(
                      height: maxWidth ? Get.height * 0.03 : 0.0,
                    ),
                    maxWidth
                        ? Align(
                            alignment: const FractionalOffset(0.5, 0.0),
                            child: Text(
                              verification,
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
                      padding: EdgeInsets.only(left: maxWidth ? Get.width * 0.03 : Get.width * 0.04, right: maxWidth ? Get.width * 0.03 : Get.width * 0.04, bottom: maxWidth ? Get.height * 0.03 : 15),
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
                      padding: EdgeInsets.only(left: maxWidth ? Get.width * 0.03 : Get.width * 0.04),
                      child: Text(otp, style: fullNameHintStyle),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      // maxWidth ? Get.height * 0.03 : 15
                      padding: EdgeInsets.only(
                          left: maxWidth ? Get.width * 0.03 : Get.width * 0.04,
                          right: maxWidth ? Get.width * 0.03 : Get.width * 0.04,
                          bottom: _keyboardVisible == 0
                              ? maxWidth
                                  ? Get.height * 0.045
                                  : 0.0
                              : Get.height * 0.1),
                      child: commonTextFormField(
                        onFieldSubmit: (String value) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        inputAction: TextInputAction.done,
                        hintText: otp,
                        textStyle: textFieldStyle,
                        hintStyle: textFieldHintStyle,
                        textEditingController: _otp,
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                        validationFunction: (value) {
                          if (_otp.text.isEmpty) {
                            return 'Enter otp';
                          }
                        },
                      ),
                    ),
                    maxWidth
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : Get.width * 0.04),
                            child: commonButton(
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  VerifyOtpController.to.callForgotOtp(email: _email.text, otp: int.parse(_otp.text));
                                }
                              },
                              text: send,
                              height: 50,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: maxWidth ? false : true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: maxWidth ? Get.width * 0.03 : Get.width * 0.04, vertical: 15),
              child: commonButton(
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    VerifyOtpController.to.callForgotOtp(email: _email.text, otp: int.parse(_otp.text));
                  }
                },
                text: send,
                height: 50,
              ),
            ),
          ),
        );
      },
    ));
  }
}
