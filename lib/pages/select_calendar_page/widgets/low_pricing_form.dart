import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';

// ignore: must_be_immutable
class LowPricingForm extends StatelessWidget {
  TextEditingController lowPriceController = TextEditingController(text: "\$1000");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
