import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_back_button.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_web_structure.dart';
import 'package:for_cash/pages/configuration/widgets/low_pricing_form.dart';

class WebConfigurationPage extends StatefulWidget {
  const WebConfigurationPage({Key key}) : super(key: key);

  @override
  _WebConfigurationPageState createState() => _WebConfigurationPageState();
}

class _WebConfigurationPageState extends State<WebConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return CommonWebStructure(
        childWidget: Container(
      width: 779.0,
      height: 580.0,
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
                      "Configuration",
                      fontWeight: FontWeight.w700,
                      color: AppTheme.colorBlack,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 50.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    child: LowPricingForm(),
                  )
                ],
              ),
            ),
            saveButton()
          ],
        ),
      ),
    ));
  }

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
