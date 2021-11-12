import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_app_bar.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_dropdown.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/select_calendar_page/select_calender_view_model.dart';
import 'package:for_cash/pages/select_calendar_page/widgets/low_pricing_form.dart';
import 'package:for_cash/pages/select_calendar_page/widgets/select_calender_text.dart';

class MobileSelectCalenderPage extends StatefulWidget {
  @override
  MobileSelectCalenderPageState createState() => MobileSelectCalenderPageState();
}

class MobileSelectCalenderPageState extends State<MobileSelectCalenderPage> {
  SelectCalendarViewModel model;
  List<String> weekList = ['Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  String selectedWeek = 'Sunday';

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    model ?? (model = SelectCalendarViewModel(this));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar(context, true),
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
              Center(child: SelectCalenderText()),
              SizedBox(
                height: 40,
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
      bottomNavigationBar: nextButton(),
    );
  }

  Widget nextButton() => Container(
    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: CommonButton(
            buttonType: ButtonType.ElevatedButton,
            onPressed: model.onTapOfNext,
            color: AppTheme.colorAccent,
            elevation: 0,
            child: CommonText(
              'Next',
              color:Colors.white,
              fontSize: 14.0,
              maxline: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );

  Widget textWithDropDown() {
    return Column(
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
}
