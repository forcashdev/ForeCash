import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_dropdown.dart';
import 'package:for_cash/app/widgets/common_name_app_bar.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/configuration/widgets/low_pricing_form.dart';

import 'configuration_view_model.dart';

class MobileConfigurationPage extends StatefulWidget {
  @override
  _MobileConfigurationPageState createState() => _MobileConfigurationPageState();
}

class _MobileConfigurationPageState extends State<MobileConfigurationPage> {

  ConfigurationModel model;


  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    model ?? (model = ConfigurationModel(this));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonNameAppBar(context, 'Configuration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: LowPricingForm(),
        ),
      ),
      bottomNavigationBar: saveButton(),
    );
  }



  Widget saveButton() => Container(
    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
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
