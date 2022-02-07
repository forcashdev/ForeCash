import 'package:flutter/material.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:get/get.dart';

Widget commonTextField(
    {EdgeInsets? contentPadding,
    TextStyle? errorTextStyle,
    TextInputAction? textInputAction,
    FormFieldValidator? validator,
    String? hint,
    bool? obscureText = false,
    IconButton? suffixIcon,
    TextEditingController? controller}) {
  return TextFormField(
    style: textFieldStyle,
    validator: validator,
    controller: controller,
    textInputAction: textInputAction,
    obscureText: obscureText!,
    decoration: InputDecoration(
      contentPadding: contentPadding,
      hintStyle: textFieldHintStyle,
      errorStyle: errorTextStyle,
      suffixIcon: suffixIcon ?? null,
      filled: true,
      fillColor: commonTextFieldColor,
      hintText: hint,
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Get.size.aspectRatio * 20),
      ),
      border: InputBorder.none,
    ),
  );
}
