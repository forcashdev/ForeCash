import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';

class CommonVerticalContainer extends StatelessWidget {
  Color containerColor = AppTheme.colorAccent;
  CommonVerticalContainer({this.containerColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        color: containerColor
      ),
    );
  }
}
