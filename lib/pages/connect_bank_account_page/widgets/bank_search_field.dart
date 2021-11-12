import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';

class BankSearchField extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      text: 'Search for your Bank',
      controller: searchController,
      inputType: TextInputType.name,
      isFill: true,
      iconPrefix: CommonImageAsset(
        image: Constants.ic_search,
        height: 20.0,
        width: 20.0,
      ),
    );
  }
}
