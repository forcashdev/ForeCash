import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';

import 'common_text.dart';

class CommonAddRowText extends StatelessWidget {
  String text;
  CommonAddRowText({Key key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 3.0),
        child: CommonText(
          "+ $text",
          color: AppTheme.colorPrimaryLight,
          fontSize: 14.0,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500,
          maxline: 1,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
