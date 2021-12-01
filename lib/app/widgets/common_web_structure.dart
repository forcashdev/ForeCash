import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';

import 'common_web_appbar.dart';

class CommonWebStructure extends StatelessWidget {
  Widget childWidget;

  CommonWebStructure({Key key, this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CommonWebAppBar(),
            Expanded(
              //It takes 5/6 part of the screen
              flex: 7,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  alignment: Alignment.center,
                  color: AppTheme.colorBackground,
                  child: childWidget),
            )
          ],
        ),
      ),
    );
  }
}
