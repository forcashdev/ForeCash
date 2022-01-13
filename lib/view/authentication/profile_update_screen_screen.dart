import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_divider.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/common_widget/common_textfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar.dart';
import 'package:fore_cash/common_widget/email_validation.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

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
    final TextEditingController _newPasswordConfirm = TextEditingController();
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        return Scaffold(
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
                  title: Text(profileSetting),
                  titleTextStyle: mobileAppBarStyle,
                  leading: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                ),
          backgroundColor: maxWidth ? backGroundColor : null,
          // resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
              width: constraints.maxWidth > 1000 ? 600 : null,
              height: constraints.maxWidth > 1000 ? 780 : null,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: maxWidth ? Get.height * 0.01 : Get.height * 0.0,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     maxWidth
                        //         ? const SizedBox()
                        //         : const Icon(
                        //             Icons.chevron_left,
                        //           ),
                        //     maxWidth
                        //         ? Container()
                        //         : Text(
                        //             profileSetting,
                        //             style: headTitleTheme,
                        //           ),
                        //     Container()
                        //   ],
                        // ),
                        SizedBox(
                          height: maxWidth ? Get.height * 0.03 : 0.0,
                        ),
                        maxWidth ? Container() : commonDivider(),
                        // SizedBox(
                        //   height: maxWidth ? 0.0 : Get.height * 0.0,
                        // ),
                        maxWidth
                            ? Text(
                                backButton,
                                style: backButtonStyle,
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
                        CommonTextField.commonTextField(hint: userName, contentPadding: const EdgeInsets.only(left: 13)),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(emailAdd, style: fullNameHintStyle),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        CommonTextField.commonTextField(
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
                            Text(
                              forgotPass,
                              style: forgotPassStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        CommonTextField.commonTextField(
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
                          errorTextStyle: const TextStyle(color: commonTextColor),
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
                        CommonTextField.commonTextField(
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
                          errorTextStyle: const TextStyle(color: commonTextColor),
                          validator: (value) {
                            if (_password.text.length < 6) {
                              return minimumCharacter;
                            }
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(confirmNewPass, style: fullNameHintStyle),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        CommonTextField.commonTextField(
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
                          errorTextStyle: const TextStyle(color: commonTextColor),
                          validator: (value) {
                            if (_password.text.length < 6) {
                              return minimumCharacter;
                            }
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        CommonMaterialButton.commonButton(
                          onPress: () {
                            _formKey.currentState!.validate();
                            if (_formKey.currentState!.validate()) {}
                          },
                          text: save,
                          height: 50,
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
