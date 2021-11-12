import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

import 'common_divider_line.dart';

class CommonNameAppBar extends StatelessWidget {
  String title = '';
  BuildContext context;
  CommonNameAppBar(this.context,this.title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backArrow(),
      title: CommonText(
        title,
        fontWeight: FontWeight.w700,
        color: AppTheme.colorBlack,
        fontSize: 20,
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
          child: Container(
            color: AppTheme.colorBGWhite,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0)),
    );
  }

  Widget backArrow() => IconButton(
    onPressed: Navigator.of(context).pop,
    icon: Icon(
      Icons.arrow_back_ios,
      color: AppTheme.colorBlack,
    ),
  );
}
