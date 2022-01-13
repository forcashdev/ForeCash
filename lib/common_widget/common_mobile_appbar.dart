import 'package:flutter/material.dart';

class CommonMobileAppbar {
  static commonMobileAppbar({Color? color, List<Widget>? actions, Widget? title, TextStyle? titleTextStyle, Widget? leading, bool? centerTitle}) {
    return AppBar(
      backgroundColor: color,
      leading: leading,
      centerTitle: centerTitle,
      actions: actions,
      elevation: 0.1,
      title: title!,
      titleTextStyle: titleTextStyle,
    );
  }
}
