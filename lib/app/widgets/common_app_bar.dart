import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';

import 'common_divider_line.dart';
import 'common_image_asset.dart';

class CommonAppBar extends StatelessWidget {
  bool showBack = true;
  BuildContext context;

  CommonAppBar(this.context, this.showBack);

  @override
  Widget build(BuildContext context) => Padding(
    padding:EdgeInsets.symmetric(vertical:5.0),
    child: Column(
          children: [
            AppBar(
              leading: backArrow(),
              title: appLogo(),
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            CommonDividerLine(
              width: MediaQuery.of(context).size.width,
              height: 1.0,
              color:AppTheme.colorBGWhite,
            ),
          ],
        ),
  );

  Widget backArrow() => Visibility(
        visible: showBack,
        child: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.colorBlack,
          ),
        ),
      );

  Widget appLogo() => CommonImageAsset(
        image: Constants.ic_logo_primary,
      );
}
