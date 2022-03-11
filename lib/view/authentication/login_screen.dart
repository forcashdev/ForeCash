import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_textformfield.dart';
import 'package:fore_cash/common_widget/email_validation.dart';
import 'package:fore_cash/controller/login_controller.dart';
import 'package:fore_cash/controller/screen_index_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/forgot_password_screen.dart';
import 'package:fore_cash/view/authentication/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController(text: 'navtan@gmail.com');
  final TextEditingController _password = TextEditingController(text: '123456');

  final screenIndexController = Get.put(ScreenIndexController());
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
              backgroundColor: constraints.maxWidth > 1000 ? colorEDF2F6 : Colors.white,
              body: Align(
                alignment: constraints.maxWidth > 1000 ? Alignment.center : Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                    width: constraints.maxWidth > 1000 ? 600 : null,
                    // height: constraints.maxWidth > 1000 ? 600 : null,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: constraints.maxWidth < 1000 ? 20 : 60),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: constraints.maxWidth > 1000 ? Get.width * 0.03 : Get.width * 0.04,
                          right: constraints.maxWidth > 1000 ? Get.width * 0.03 : Get.width * 0.04,
                          bottom: constraints.maxWidth < 1000 ? Get.width * 0.02 : 0.1),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: constraints.maxWidth < 1000 ? Get.height * 0.02 : Get.height * 0.04,
                            ),
                            Align(
                              alignment: const FractionalOffset(0.5, 0.0),
                              child: constraints.maxWidth < 1000
                                  ? Image.asset(
                                      foreCashLogo2,
                                      height: Get.height * 0.055,
                                      width: Get.height * 0.25,
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
                                style: emailStyle,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                            Text(
                              emailAddress,
                              style: fullNameHintStyle,
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            commonTextFormField(
                              onFieldSubmit: (String value) {
                                FocusScope.of(context).requestFocus(_focusNode);
                              },
                              inputAction: TextInputAction.next,
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
                                if (_email.text.isValidEmail()) {
                                  return null;
                                } else {
                                  return notValidEmail;
                                }
                              },
                            ),
                            // commonTextField(
                            //   textInputAction: TextInputAction.next,
                            //   hint: emailAddress,
                            //   controller: _email,
                            //   validator: (value) {
                            //     if (_email.text.isValidEmail()) {
                            //       return null;
                            //     } else {
                            //       return notValidEmail;
                            //     }
                            //   },
                            // ),
                            SizedBox(
                              height: Get.height * 0.04,
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
                                    Get.to(const ForgotPassword());
                                  },
                                  child: Text(
                                    forgotPass,
                                    style: fullNameHintStyle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: constraints.maxWidth > 1000 ? Get.height * 0.05 : Get.height * 0.36),
                              child: commonTextFormField(
                                textFocusNode: _focusNode,
                                onFieldSubmit: (String value) {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                                inputAction: TextInputAction.done,
                                hintText: password,
                                textStyle: textFieldStyle,
                                hintStyle: textFieldHintStyle,
                                isPassword: true,
                                textEditingController: _password,
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                                focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                                validationFunction: (value) {
                                  if (_password.text.length < 6) {
                                    return minimumCharacter;
                                  }
                                },
                              ),
                            ),
                            // Spacer(),
                            // SizedBox(
                            //   height: constraints.maxWidth > 1000 ? Get.height * 0.02 : 0.0,
                            // ),
                            // SizedBox(
                            //   height: Get.height * 0.04,
                            // ),
                            commonButton(
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  LoginInController().callLogin(email: _email.text, password: _password.text);
                                }
                              },
                              text: logIn,
                              height: 50,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: constraints.maxWidth > 1000 ? Get.height * 0.02 : 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dontAccount,
                                    style: dontHaveAccountStyle,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.005,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const SignUpScreen(),
                                          ));
                                    },
                                    child: Text(
                                      signUp,
                                      style: signupButtonStyle,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
