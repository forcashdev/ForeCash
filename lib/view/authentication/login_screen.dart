import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_textfield.dart';
import 'package:fore_cash/common_widget/common_web_appbar.dart';
import 'package:fore_cash/common_widget/email_validation.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
              backgroundColor: backGroundColor,
              appBar: constraints.maxWidth > 1000 ? CommonWebAppbar.commonWebAppbar(scale: Get.size.aspectRatio * 150) : null,
              resizeToAvoidBottomInset: false,
              body: Center(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  width: constraints.maxWidth > 1000 ? 600 : null,
                  height: constraints.maxWidth > 1000 ? 600 : null,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: constraints.maxWidth < 1000 ? 20 : 120),
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.04, right: Get.width * 0.04, bottom: constraints.maxWidth < 1000 ? Get.width * 0.02 : 0.1),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: constraints.maxWidth < 1000 ? Get.height * 0.02 : Get.height * 0.05,
                          ),
                          Align(
                            alignment: FractionalOffset(0.5, 0.0),
                            child: constraints.maxWidth < 1000
                                ? Image.asset(
                                    foreCashLogo2,
                                    scale: 3,
                                  )
                                : null,
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          Align(
                            alignment: const FractionalOffset(0.5, 0.0),
                            child: Text(
                              loginForeCash,
                              style: headTitleTheme,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          Align(
                            alignment: const FractionalOffset(0.5, 0.0),
                            child: Text(
                              enterPassEmail,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: AppTheme.fontName,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          Text(
                            email,
                            style: const TextStyle(
                              color: commonTextColor2,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppTheme.fontName,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          CommonTextField.commonTextField(
                            hint: email,
                            controller: _email,
                            validator: (value) {
                              if (_email.text.isValidEmail()) {
                                return null;
                              } else {
                                return notValidEmail;
                              }
                            },
                            context: context,
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                password,
                                style: const TextStyle(fontWeight: FontWeight.w700, fontFamily: AppTheme.fontName, color: commonTextColor2),
                              ),
                              Text(
                                forgotPass,
                                style: const TextStyle(fontWeight: FontWeight.w700, fontFamily: AppTheme.fontName, color: commonTextColor2),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          CommonTextField.commonTextField(
                            hint: password,
                            controller: _password,
                            context: context,
                            suffixIcon: IconButton(
                              splashRadius: 0.1,
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: isObscure == true
                                  ? const Icon(
                                      Icons.visibility,
                                      color: commonTextColor2,
                                    )
                                  : const Icon(Icons.visibility_off, color: commonTextColor2),
                            ),
                            obscureText: isObscure,
                            errorTextStyle: const TextStyle(color: commonTextColor),
                            validator: (value) {
                              if (_password.text.length < 6) {
                                return minimumCharacter;
                              }
                            },
                          ),
                          Spacer(),
                          CommonMaterialButton.commonButton(
                              onPress: () {
                                _formKey.currentState!.validate();
                              },
                              text: logIn,
                              height: 50,
                              context: context),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dontAccount,
                                style: const TextStyle(color: commonTextColor),
                              ),
                              SizedBox(
                                width: Get.width * 0.005,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ));
                                },
                                child: Text(
                                  signUp,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: commonButtonColor),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
