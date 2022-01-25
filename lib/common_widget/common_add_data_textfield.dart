import 'package:flutter/material.dart';

class CommonDataTextField {
  static commonTextField({TextStyle? hintStyle, String? hintText, TextEditingController? controller, TextStyle? textStyle, EdgeInsets? contentPadding, TextStyle? prefixStyle, String? prefixText}) {
    return TextField(
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(hintText: hintText, hintStyle: hintStyle, prefixStyle: prefixStyle, prefixText: prefixText, contentPadding: contentPadding, border: InputBorder.none),
    );
  }
}
