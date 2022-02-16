import 'package:flutter/material.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';

commonButton({
  Function()? onPress,
  String? text,
  double? height,
  Color? borderColor = Colors.transparent,
  Color? bgColor = commonButtonColor,
  TextStyle? textStyle = commonButtonTheme,
  double? width = double.infinity,
}) {
  return MaterialButton(
    onPressed: onPress,
    child: Text(
      text!,
      style: textStyle ?? commonButtonTheme,
    ),
    shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(9)),

    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
    color: bgColor ?? commonButtonColor,
    minWidth: width ?? double.infinity,
    height: height ?? 50,
  );
}
