import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final FocusNode _confirmPasswordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _newPassword = TextEditingController();
    final TextEditingController _newPasswordConfirm = TextEditingController();

    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        final _keyboardVisibility = MediaQuery.of(context).viewInsets.bottom;
        final maxWidth = constraints.maxWidth > 1000;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: maxWidth ? colorEDF2F6 : null,
          appBar: maxWidth ? appBarWithUserNAme(context: context) : null,
          body: Center(
            child: Container(
              decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
              width: constraints.maxWidth > 1000 ? 600 : null,
              height: constraints.maxWidth > 1000 ? 450 : null,
              child: SingleChildScrollView(
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
                              ? SizedBox()
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
                                  resetPass,
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
                          ? Padding(
                              padding: EdgeInsets.only(
                                left: Get.width * 0.03,
                              ),
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
                          createNewPass,
                          style: textSpanStyle1,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.045,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: maxWidth ? Get.width * 0.03 : Get.width * 0.04,
                            right: maxWidth ? Get.width * 0.03 : Get.width * 0.04,
                            bottom: _keyboardVisibility == 0
                                ? maxWidth
                                    ? Get.height * 0.05
                                    : Get.height * 0.44
                                : Get.height * 0.12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(newPassword, style: fullNameHintStyle),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            commonTextFormField(
                              onFieldSubmit: (String value) {
                                FocusScope.of(context).requestFocus(_confirmPasswordFocus);
                              },
                              inputAction: TextInputAction.next,
                              hintText: password,
                              textStyle: textFieldStyle,
                              hintStyle: textFieldHintStyle,
                              textEditingController: _newPassword,
                              isPassword: true,
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                              validationFunction: (value) {
                                if (_newPassword.text.length < 6) {
                                  return minimumCharacter;
                                }
                              },
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(confirmNewPass, style: fullNameHintStyle),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            commonTextFormField(
                              textFocusNode: _confirmPasswordFocus,
                              onFieldSubmit: (String value) {
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              inputAction: TextInputAction.next,
                              hintText: password,
                              textStyle: textFieldStyle,
                              hintStyle: textFieldHintStyle,
                              textEditingController: _newPasswordConfirm,
                              isPassword: true,
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                              validationFunction: (value) {
                                if (_newPassword.text.length < 6) {
                                  return minimumCharacter;
                                }
                              },
                            ),
                            // commonTextField(
                            //   contentPadding: const EdgeInsets.only(left: 13),
                            //   hint: password,
                            //   // controller: _newPasswordConfirm,
                            //   suffixIcon: IconButton(
                            //     splashRadius: 0.1,
                            //     icon: isObscureNewPassCon == true
                            //         ? const Icon(
                            //             Icons.visibility,
                            //             color: color777C90,
                            //           )
                            //         : const Icon(Icons.visibility_off, color: color777C90),
                            //     onPressed: () {
                            //       setState(() {
                            //         isObscureNewPassCon = !isObscureNewPassCon;
                            //       });
                            //     },
                            //   ),
                            //   obscureText: isObscureNewPassCon,
                            //   errorTextStyle: const TextStyle(color: color777C90),
                            //   validator: (value) {
                            //     // if (_password.text.length < 6) {
                            //     //   return minimumCharacter;
                            //     // }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: maxWidth ? Get.width * 0.03 : Get.width * 0.04,
                        ),
                        child: commonButton(
                          onPress: () {},
                          text: send,
                          height: 50,
                        ),
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
