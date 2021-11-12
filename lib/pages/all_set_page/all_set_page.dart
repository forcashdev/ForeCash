import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';

import 'all_set_view_model.dart';

class AllSetPage extends StatefulWidget {
  const AllSetPage({Key key}) : super(key: key);

  @override
  AllSetPageState createState() => AllSetPageState();
}

class AllSetPageState extends State<AllSetPage> {
  AllSetViewModel model;
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    model ?? (model = AllSetViewModel(this));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: AppTheme.colorPrimary,
        padding: EdgeInsets.symmetric(vertical: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: CommonImageAsset(
              image: Constants.img_all_set,
              height: 250,
              width: 250,
            )),
            CommonText(
              "All Set!",
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.w900,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
