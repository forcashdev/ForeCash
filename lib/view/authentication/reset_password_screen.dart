import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/common_widget/common_textfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar.dart';
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
  bool isObscureNewPass = true;
  bool isObscureNewPassCon = true;
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
          backgroundColor: maxWidth ? backGroundColor : null,
          appBar: maxWidth
              ? CommonWebAppbar.commonWebAppbar(scale: Get.mediaQuery.size.aspectRatio * 150, actions: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.01),
                    child: Stack(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          padding: const EdgeInsets.all(7),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: appBarActionColor,
                          ),
                          child: Image.asset('assets/image/png/notificationIcon.png'),
                        ),
                        const Positioned(
                          right: 3,
                          top: 4,
                          child: CircleAvatar(
                            backgroundColor: cameraBackGroundColor,
                            radius: 6,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.007,
                  ),
                  Container(
                    width: 160,
                    margin: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01, right: Get.width * 0.015),
                    padding: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(color: appBarActionColor, borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 17,
                          backgroundImage: AssetImage('assets/image/png/profilePhoto.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            userName,
                            style: userNameProfileStyle,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ])
              : CommonMobileAppbar.commonMobileAppbar(
                  centerTitle: true,
                  color: Colors.white.withOpacity(0.9),
                  titleTextStyle: mobileAppBarStyle,
                  title: Text(resetPass),
                  leading: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
              width: constraints.maxWidth > 1000 ? 600 : null,
              height: constraints.maxWidth > 1000 ? 450 : null,
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
                          ? Text(
                              backButton,
                              style: backButtonStyle,
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
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
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
                            CommonTextField.commonTextField(
                              contentPadding: EdgeInsets.only(left: 13),
                              hint: password,
                              // controller: _newPassword,
                              suffixIcon: IconButton(
                                // splashRadius: 0.1,
                                icon: isObscureNewPass == true
                                    ? const Icon(
                                        Icons.visibility,
                                        color: commonTextColor2,
                                      )
                                    : const Icon(Icons.visibility_off, color: commonTextColor2),
                                onPressed: () {
                                  setState(() {
                                    isObscureNewPass = !isObscureNewPass;
                                  });
                                },
                              ),
                              obscureText: isObscureNewPass,
                              errorTextStyle: const TextStyle(color: commonTextColor),
                              validator: (value) {
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
                            CommonTextField.commonTextField(
                              contentPadding: const EdgeInsets.only(left: 13),
                              hint: password,
                              // controller: _newPasswordConfirm,
                              suffixIcon: IconButton(
                                splashRadius: 0.1,
                                icon: isObscureNewPassCon == true
                                    ? const Icon(
                                        Icons.visibility,
                                        color: commonTextColor2,
                                      )
                                    : const Icon(Icons.visibility_off, color: commonTextColor2),
                                onPressed: () {
                                  setState(() {
                                    isObscureNewPassCon = !isObscureNewPassCon;
                                  });
                                },
                              ),
                              obscureText: isObscureNewPassCon,
                              errorTextStyle: const TextStyle(color: commonTextColor),
                              validator: (value) {
                                // if (_password.text.length < 6) {
                                //   return minimumCharacter;
                                // }
                              },
                            ),
                          ],
                        ),
                      ),
                      CommonMaterialButton.commonButton(
                        onPress: () {},
                        text: send,
                        height: 50,
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
