import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_back_button.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_circle_image.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';
import 'package:for_cash/app/widgets/common_web_structure.dart';

class WebProfileSettingsPage extends StatefulWidget {
  const WebProfileSettingsPage({Key key}) : super(key: key);

  @override
  _WebProfileSettingsPageState createState() => _WebProfileSettingsPageState();
}

class _WebProfileSettingsPageState extends State<WebProfileSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CommonWebStructure(
        childWidget: Container(
      width: 800,
        height: 1048,
      padding: EdgeInsets.only(bottom: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      // margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  CommonBackButton(
                    onBackTap: () {},
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: CommonText(
                      "Profile Settings",
                      fontWeight: FontWeight.w700,
                      color: AppTheme.colorBlack,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Center(
                      child: Column(
                    children: [
                      CommonCircleImage(
                        imagePath: Constants.dummy_image,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CommonText(
                        "John Doe",
                        fontWeight: FontWeight.w700,
                        color: AppTheme.colorBlack,
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  )),
                  profileForm()
                ],
              ),
            ),
            saveButton()
          ],
        ),
      ),
    ));
  }

  Widget profileForm() => Container(
        margin: EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CommonText(
            'Full Name',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.colorGrey,
          ),
          SizedBox(
            height: 10,
          ),
          CommonTextField(
            text: 'Name',
            controller: TextEditingController(),
            inputType: TextInputType.name,
            isFill: true,
          ),
          SizedBox(
            height: 30,
          ),
          CommonText(
            'Email',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.colorGrey,
          ),
          SizedBox(
            height: 10,
          ),
          CommonTextField(
            text: 'Email address',
            controller: TextEditingController(),
            inputType: TextInputType.emailAddress,
            isFill: true,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                'Password',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.colorGrey,
              ),
              CommonText(
                'Forgot password?',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppTheme.colorGrey,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CommonTextField(
            text: 'Password',
            controller: TextEditingController(),
            inputType: TextInputType.name,
            isFill: true,
            suffixIcon: CommonImageAsset(
              image: Constants.ic_pass_hide,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CommonText(
            'New Password',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.colorGrey,
          ),
          SizedBox(
            height: 10,
          ),
          CommonTextField(
            text: 'Password',
            controller: TextEditingController(),
            inputType: TextInputType.name,
            isFill: true,
            suffixIcon: CommonImageAsset(
              image: Constants.ic_pass_hide,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          CommonText(
            'Minimum 6 Character required*',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppTheme.colorGrey,
          ),
          SizedBox(
            height: 30,
          ),
          CommonText(
            'Confirm New password',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.colorGrey,
          ),
          SizedBox(
            height: 10,
          ),
          CommonTextField(
            text: 'Password',
            controller: TextEditingController(),
            inputType: TextInputType.name,
            isFill: true,
            suffixIcon: CommonImageAsset(
              image: Constants.ic_pass_hide,
            ),
          ),
          SizedBox(
            height: 10,
          )
        ]),
      );

  Widget saveButton() => Container(
        padding: EdgeInsets.only(left: 70, right: 70, top: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              Container(
                width: double.infinity,
              height: 45,
              child: CommonButton(
                buttonType: ButtonType.ElevatedButton,
                onPressed: () {},
                color: AppTheme.colorAccent,
                elevation: 0,
                child: CommonText(
                  'Save',
                  color: AppTheme.colorWhite,
                  fontSize: 14.0,
                  maxline: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );
}
