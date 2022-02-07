import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_textfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/common_widget/email_validation.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

import 'forgot_password_screen.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  bool isObscurePass = true;
  bool isObscureNewPass = true;
  bool isObscureNewPassCon = true;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _newPassword = TextEditingController();
    final TextEditingController _userName = TextEditingController();
    final TextEditingController _newPasswordConfirm = TextEditingController();
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        return Scaffold(
          appBar: maxWidth ? appBarWithUserNAme(context: context) : null,
          backgroundColor: maxWidth ? backGroundColor : null,
          // resizeToAvoidBottomInset: false,
          body: Align(
            alignment: maxWidth ? Alignment.center : Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
              width: constraints.maxWidth > 1000 ? 600 : null,
              // height: constraints.maxWidth > 1000 ? 780 : null,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
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
                                    profileSetting,
                                    style: mobileAppBarStyle,
                                  ),
                            SizedBox(
                              width: context.isTablet ? Get.width * 0.0 : Get.width * 0.1,
                            )
                          ],
                        ),
                        SizedBox(
                          height: maxWidth ? Get.height * 0.03 : 0.0,
                        ),

                        // SizedBox(
                        //   height: maxWidth ? 0.0 : Get.height * 0.0,
                        // ),
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
                        Align(
                          alignment: const FractionalOffset(0.5, 0.0),
                          child: Stack(
                            children: [
                              const CircleAvatar(
                                foregroundColor: Colors.white,
                                radius: 45,
                                backgroundImage: AssetImage('assets/image/png/profilePhoto.png'),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/png/cameraPng.png')), shape: BoxShape.circle, color: cameraBackGroundColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        Align(
                          alignment: const FractionalOffset(0.5, 0.0),
                          child: Text(
                            userName,
                            style: userNameStyle,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(fullName, style: fullNameHintStyle),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        commonTextField(
                          controller: _userName,
                          hint: userName,
                          contentPadding: const EdgeInsets.only(left: 13),
                          validator: (value) {
                            if (_userName.text.isEmpty) {
                              return enterName;
                            }
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(emailAdd, style: fullNameHintStyle),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        commonTextField(
                          contentPadding: const EdgeInsets.only(left: 13),
                          hint: emailAddress,
                          controller: _email,
                          validator: (value) {
                            if (_email.text.isValidEmail()) {
                              return null;
                            } else {
                              return notValidEmail;
                            }
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              password,
                              style: fullNameHintStyle,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(ForgotPassword());
                              },
                              child: Text(
                                forgotPass,
                                style: forgotPassStyle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        commonTextField(
                          contentPadding: const EdgeInsets.only(left: 13),
                          hint: password,
                          controller: _password,
                          suffixIcon: IconButton(
                            splashRadius: 0.1,
                            icon: isObscurePass == true
                                ? const Icon(
                                    Icons.visibility,
                                    color: commonTextColor2,
                                  )
                                : const Icon(Icons.visibility_off, color: commonTextColor2),
                            onPressed: () {
                              setState(() {
                                isObscurePass = !isObscurePass;
                              });
                              print(isObscurePass);
                            },
                          ),
                          obscureText: isObscurePass,
                          validator: (value) {
                            if (_password.text.length < 6) {
                              return minimumCharacter;
                            }
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(newPassword, style: fullNameHintStyle),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        commonTextField(
                          contentPadding: const EdgeInsets.only(left: 13),
                          hint: password,
                          controller: _newPassword,
                          suffixIcon: IconButton(
                            splashRadius: 0.1,
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
                          validator: (value) {
                            if (_password.text.length < 6) {
                              return minimumCharacter;
                            }
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(confirmNewPass, style: fullNameHintStyle),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        commonTextField(
                          contentPadding: const EdgeInsets.only(left: 13),
                          hint: password,
                          controller: _newPasswordConfirm,
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
                          validator: (value) {
                            if (_password.text.length < 6) {
                              return minimumCharacter;
                            }
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: Get.height * 0.035),
                          child: CommonMaterialButton.commonButton(
                            onPress: () {
                              _formKey.currentState!.validate();
                              if (_formKey.currentState!.validate()) {}
                            },
                            text: save,
                            height: 50,
                          ),
                        )
                      ],
                    ),
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
