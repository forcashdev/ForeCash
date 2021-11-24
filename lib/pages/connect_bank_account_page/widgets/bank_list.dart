import 'package:flutter/foundation.dart';
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
        primary: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: kIsWeb ? 3 : 2,
        childAspectRatio: kIsWeb ? 2.5 : 2,
        mainAxisSpacing: kIsWeb ? 30.0 : 20.0,
        crossAxisSpacing: kIsWeb ? 30.0 : 20.0,
        children: imageList.map((String url) {
          return InkWell(
            onTap: () {
              kIsWeb
                  ? stepIndexController.sink.add(2)
                  : Navigator.push(context, MaterialPageRoute(builder: (builder) => MobileSelectMonthlyIncomePage()));
            },
            child: GridTile(child: BankImage(url)),
          );
        }).toList());
  }
}
