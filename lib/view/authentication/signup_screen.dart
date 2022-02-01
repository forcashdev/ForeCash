import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/common_widget/common_textfield.dart';
import 'package:fore_cash/common_widget/email_validation.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/getx/signup_password_obscure_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/login_screen.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // bool isObscure = true;
  final screenIndexController = Get.put(ScreenIndexController());
  final obscureTextController = Get.put(SignUpPasswordObscureController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  FocusNode _focusNode = FocusNode();

  // final controller = Get.put(ObscureText());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            backgroundColor: constraints.maxWidth > 1000 ? backGroundColor : Colors.white,
            // resizeToAvoidBottomInset: false,
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: constraints.maxWidth > 1000 ? Get.height * 0.025 : 0.0),
                  decoration: BoxDecoration(color: constraints.maxWidth > 1000 ? Colors.white : null, borderRadius: BorderRadius.circular(9)),
                  width: constraints.maxWidth > 1000 ? 600 : null,
                  height: constraints.maxWidth > 1000 ? 700 : null,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.04, right: Get.width * 0.04, bottom: constraints.maxWidth < 1000 ? Get.width * 0.02 : 0.1),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.02,
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
                              getStarted,
                              style: headTitleTheme,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          Align(
                            alignment: const FractionalOffset(0.5, 0.0),
                            child: Text(
                              createAccount,
                              style: createAccountTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          Text(fullName, style: fullNameHintStyle),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          CommonTextField.commonTextField(hint: name, controller: _name, textInputAction: TextInputAction.next),
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          Text(emailAddress, style: fullNameHintStyle),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          CommonTextField.commonTextField(
                            textInputAction: TextInputAction.next,
                            hint: emailAddress,
                            errorTextStyle: const TextStyle(color: commonTextColor),
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
                            height: Get.height * 0.05,
                          ),
                          Text(password, style: fullNameHintStyle),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          GetBuilder<SignUpPasswordObscureController>(
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
                          constraints.maxWidth > 1000
                              ? Spacer()
                              : SizedBox(
                                  height: constraints.maxWidth < 1000 ? Get.height * 0.17 : 0,
                                ),
                          CommonMaterialButton.commonButton(
                            onPress: () {
                              _formKey.currentState!.validate();
                              if (_formKey.currentState!.validate()) {
                                screenIndex = 1;
                                print('>>>>>>>>>>>>>>>>>>>>>>$screenIndex');
                                screenIndexController.updateIndex(index: 1);
                              }
                            },
                            text: signUp,
                            height: 50,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                alreadyAccount,
                                style: alreadyAccountStyle,
                              ),
                              SizedBox(
                                width: Get.width * 0.005,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ));
                                },
                                child: Text(
                                  logIn,
                                  style: loginStyle,
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
            ),
          );
        },
      ),
    );
  }
}
