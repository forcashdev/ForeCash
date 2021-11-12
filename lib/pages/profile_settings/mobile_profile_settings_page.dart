import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_circle_image.dart';
import 'package:for_cash/app/widgets/common_name_app_bar.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/profile_settings/profile_settings_view_model.dart';
import 'package:for_cash/pages/profile_settings/widgets/profile_form.dart';

class MobileProfileSettingsPage extends StatefulWidget {
  @override
  _MobileProfileSettingsPageState createState() => _MobileProfileSettingsPageState();
}

class _MobileProfileSettingsPageState extends State<MobileProfileSettingsPage> {
  ProfileSettingsViewModel model;
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    model ?? (model = ProfileSettingsViewModel(this));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonNameAppBar(context, 'Profile Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                  child: CommonCircleImage(imagePath: Constants.dummy_image,) ),
              SizedBox(
                height: 40.0,
              ),
              accountForm(),
              // passwordForm()
            ],
          ),
        ),
      ),
      bottomNavigationBar: saveButton(),
    );
  }

  Widget accountForm() =>
      Form(
        // key: model.formKey,
        child: ProfileForm(
          nameController: model.nameController,
          emailController: model.emailController,
          passwordController: model.passwordController,
          confirmNewPasswordController: model.confirmNewPasswordController,
          newPasswordController: model.newPasswordController,
        ),
      );

  Widget saveButton() => Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
            onPressed: model.onTapSave,
            color: AppTheme.colorAccent,
            elevation: 0,
            child: CommonText(
              'Save',
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    ),
  );

}
