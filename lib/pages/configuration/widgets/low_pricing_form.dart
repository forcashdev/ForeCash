import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_dropdown.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';

// ignore: must_be_immutable
class LowPricingForm extends StatefulWidget {
  @override
  _LowPricingFormState createState() => _LowPricingFormState();
}

class _LowPricingFormState extends State<LowPricingForm> {
  TextEditingController lowPriceController = TextEditingController(text: "\$1000");
  List<String> weekList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  String selectedWeek = 'Sunday';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        textWithDropDown(),
        SizedBox(
          height: 20.0,
        ),
        CommonText(
          'Low balance warning',
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: AppTheme.colorGrey,
        ),
        SizedBox(
          height: 5.0,
        ),
        CommonTextField(
          text: '\$1000',
          controller: lowPriceController,
          inputType: TextInputType.emailAddress,
          isFill: true,
        ),
        SizedBox(
          height: 3,
        ),
        CommonText(
          "We recommend whatever day you normally get paid*",
          color: AppTheme.colorGrey,
          fontSize: 14.0,
          maxline: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
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
}
