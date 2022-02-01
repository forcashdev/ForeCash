import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_textfield.dart';
import 'package:fore_cash/common_widget/email_validation.dart';
import 'package:fore_cash/getx/login_password_obscure_controller.dart';
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
  // bool isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final obscureTextController = Get.put(LogInPasswordObscureController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
              backgroundColor: constraints.maxWidth > 1000 ? backGroundColor : Colors.white,
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                    width: constraints.maxWidth > 1000 ? 600 : null,
                    height: constraints.maxWidth > 1000 ? 600 : null,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: constraints.maxWidth < 1000 ? 20 : 60),
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
                            CommonTextField.commonTextField(
                              errorTextStyle: const TextStyle(color: commonTextColor),
                              textInputAction: TextInputAction.next,
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
                              height: Get.height * 0.04,
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
                                  style: fullNameHintStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            GetBuilder<LogInPasswordObscureController>(
                              builder: (controller) {
                                return CommonTextField.commonTextField(
                                  textInputAction: TextInputAction.done,
                                  hint: password,
                                  controller: _password,
                                  suffixIcon: IconButton(
                                    splashRadius: 0.1,
                                    onPressed: () {
                                      controller.changeObscure();
                                      // setState(() {
                                      //   isObscure = !isObscure;
                                      // });
                                    },
                                    icon: controller.obscure == true
                                        ? const Icon(
                                            Icons.visibility,
                                            color: commonTextColor2,
                                          )
                                        : const Icon(Icons.visibility_off, color: commonTextColor2),
                                  ),
                                  obscureText: controller.obscure,
                                  errorTextStyle: const TextStyle(color: commonTextColor),
                                  validator: (value) {
                                    if (_password.text.length < 6) {
                                      return minimumCharacter;
                                    }
                                  },
                                );
                              },
                            ),
                            // Spacer(),
                            // SizedBox(
                            //   height: constraints.maxWidth > 1000 ? Get.height * 0.02 : 0.0,
                            // ),
                            constraints.maxWidth > 1000
                                ? Spacer()
                                : SizedBox(
                                    height: Get.height * 0.3,
                                  ),
                            CommonMaterialButton.commonButton(
                              onPress: () {
                                _formKey.currentState!.validate();
                              },
                              text: logIn,
                              height: 50,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
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
                                          builder: (context) => SignUpScreen(),
                                        ));
                                  },
                                  child: Text(
                                    signUp,
                                    style: signupButtonStyle,
                                  ),
                                )
                              ],
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
