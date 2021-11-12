import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class CommonWeekBox extends StatelessWidget {
  String title;
  String total;

  CommonWeekBox({Key key, this.title, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppTheme.colorPrimaryLight,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              total,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              maxline: 1,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.0,
            ),
            CommonText(
              title,
              color: Colors.white,
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
