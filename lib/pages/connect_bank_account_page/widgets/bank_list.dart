import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/pages/connect_bank_account_page/widgets/bank_image.dart';
import 'package:for_cash/pages/select_monthly_income/mobile_select_monthly_income_page.dart';

class BankList extends StatelessWidget {
  List<String> imageList = [
    Constants.ic_logo_primary,
    Constants.ic_logo_primary,
    Constants.ic_logo_primary,
    Constants.ic_logo_primary,
    Constants.ic_logo_primary,
    Constants.ic_logo_primary,
    Constants.ic_logo_primary,
    Constants.ic_logo_primary,
    Constants.ic_logo_primary,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 2.0,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: imageList.map((String url) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => MobileSelectMonthlyIncomePage())),
            child: GridTile(child: BankImage(url)),
          );
        }).toList());
  }
}
