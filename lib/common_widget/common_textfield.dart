import 'package:flutter/material.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/utility/colors.dart';

class CommonTextField {
  static commonTextField({TextStyle? errorTextStyle, FormFieldValidator? validator, String? hint, BuildContext? context, var obscureText, IconButton? suffixIcon, TextEditingController? controller}) {
    final sequenceSize = MediaQuery.of(context!).size;

    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false as bool,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500),
        errorStyle: errorTextStyle,
        suffixIcon: suffixIcon ?? null,
        filled: true,
        fillColor: commonTextFieldColor,
        hintText: hint,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(sequenceSize.aspectRatio * 20),
        ),
        border: InputBorder.none,
      ),
    );
  }
}
