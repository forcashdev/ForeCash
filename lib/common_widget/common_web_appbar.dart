import 'package:flutter/material.dart';
import 'package:fore_cash/utility/images.dart';

class CommonWebAppbar {
  static commonWebAppbar({double? scale}) {
    return AppBar(
      leadingWidth: 180,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset(
          foreCashLogo2,
          // scale: scale,
        ),
      ),
    );
  }
}
