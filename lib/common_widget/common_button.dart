import 'package:flutter/material.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';

class CommonMaterialButton {
  static commonButton({
    Function()? onPress,
    String? text,
    double? height,
  }) {
    return MaterialButton(
      onPressed: onPress,
      child: Text(
        text!,
        style: commonButtonTheme,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      color: commonButtonColor,
      minWidth: double.infinity,
      height: height,
    );
  }
}
