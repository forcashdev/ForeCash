import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';
import 'package:for_cash/pages/sign_up/widgets/already_have_account_text.dart';
import 'package:for_cash/pages/sign_up/widgets/get_started_text.dart';

class WebSignUpPage extends StatefulWidget {
  const WebSignUpPage({Key key}) : super(key: key);

  @override
  WebSignUpPageState createState() => WebSignUpPageState();
}

class WebSignUpPageState extends State<WebSignUpPage> {
  List<String> stepList = [
    "Create Account",
    "Connect Bank Account",
    "Monthly Expense",
    "Weekly Expense",
    "Monthly Income",
    "Weekly Income",
    "Setup Calendar"
  ];
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 750,
      margin: EdgeInsets.symmetric(horizontal: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          SizedBox(height: 70),
          GetStartedText(),
          SizedBox(
            height: 40.0,
          ),
          fullNameField(size),
          SizedBox(
            height: 25.0,
          ),
          emailField(size),
          SizedBox(
            height: 25.0,
          ),
          Container(
            width: 630,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  "Password",
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.fontName,
                ),
                CommonText(
                  "Forgot Password?",
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.fontName,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          passwordField(size),
          SizedBox(
            height: 35.0,
          ),
          submitButton(size),
          SizedBox(
            height: 20.0,
          ),
          AlreadyHaveAccountText(),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
    /*Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                // and it take 1/6 part of the screen
                child: Container(
                  width: size.width,
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20.0),
                  child: CommonImageAsset(
                    image: Constants.ic_logo_primary,
                    height: 45.0,
                  ),
                ),
              ),
              Expanded(
                //It takes 5/6 part of the screen
                flex: 7,
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    color: AppTheme.colorBackground,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        size.width > 1000
                            ? Container(
                                width: size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 1320,
                                      alignment: Alignment.center,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            width: size.width * 0.052,
                                          );
                                        },
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: stepList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          String steps = stepList[index];
                                          return CommonText(
                                            "$steps",
                                            color: AppTheme.colorPrimary,
                                            fontSize: 14.0,
                                            maxline: 2,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500,
                                          );
                                        },
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 1400,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        Container(
                                            width: size.width * 0.13,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color: AppTheme.colorPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: CommonText(
                                                  "Step 1 of 7",
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                ))),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 30.0,
                        ),

                        SizedBox(
                          height: 50.0,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );*/
  }

  fullNameField(size) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 20,
              width: 630,
              child: CommonText(
                "Full Name",
                fontSize: 11.0,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.fontName,
              ),
            ),
          ),
          Center(
            child: CommonTextField(
              hintText: 'Name',
              inputType: TextInputType.emailAddress,
              onChanged: (val) {},
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  emailField(size) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 20,
              width: 630,
              child: CommonText(
                "Email",
                fontSize: 11.0,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.fontName,
              ),
            ),
          ),
          Center(
            child: CommonTextField(
              hintText: 'Email address',
              inputType: TextInputType.emailAddress,
              onChanged: (val) {},
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  passwordField(size) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CommonTextField(
              hintText: 'Password',
              inputType: TextInputType.emailAddress,
              onChanged: (val) {},
              maxLine: 1,
              obscureText: _obscureText,
              iconSuffix: Image.asset(
                // Based on passwordVisible state choose the icon
                _obscureText ? Constants.ic_pass_hide : Constants.ic_show_password,
                height: 22.0,
                width: 22.0,
              ),
              onSuffixTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Container(
              height: 20,
              width: 630,
              child: CommonText(
                "Minimum 6 Character required*",
                fontSize: 9.0,
                color: AppTheme.colorGrey,
                fontFamily: AppTheme.fontName,
              ),
            ),
          ),
        ],
      ),
    );
  }

  submitButton(Size size) {
    return Container(
      width: 630,
      height: 35.0,
      child: CommonButton(
        buttonType: ButtonType.ElevatedButton,
        onPressed: () {
          stepIndexController.sink.add(1);
        },
        color: AppTheme.colorAccent,
        lable: "Sign up",
      ),
    );
  }
}
