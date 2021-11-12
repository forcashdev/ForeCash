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
  List<String> weekList = ['Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  String selectedWeek = 'Sunday';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              textWithDropDown(),
              SizedBox(
                height: 20.0,
              ),
              LowPricingForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: saveButton(),
    );
  }

  Widget textWithDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          "I want to reset my weeks on",
          color: AppTheme.colorGrey,
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          maxline: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 5.0,
        ),
        CommonDropDown(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            errorText: '',
            value: selectedWeek,
            items: weekList,
            onChanged: (value) {
              setState(() {
                selectedWeek = value;
              });
              print('changed to $value');
            }),
        SizedBox(
          height: 3.0,
        ),
        CommonText(
          "We recommend whatever day you normally get paid*",
          color: AppTheme.colorGrey,
          fontSize: 12.0,
          maxline: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
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
