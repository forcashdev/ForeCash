import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';

import 'common_image_asset.dart';
import 'common_text.dart';

// ignore: must_be_immutable
class CommonBackButton extends StatelessWidget {

  Function onBackTap;

  CommonBackButton({Key key,this.onBackTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBackTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            CommonImageAsset(
              image: Constants.ic_arrow_left,
              height: 16.0,
              width: 9.0,
            ),
            SizedBox(width: 10.0,),
            CommonText("Back",color: AppTheme.colorPrimary,fontWeight: FontWeight.w700,fontSize: 16.0,)
          ],
        ),
      ),
    );
  }
}
