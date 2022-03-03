import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fore_cash/utility/const.dart';

commonTextField(
    {List<TextInputFormatter>? inputFormatter,
    TextStyle? hintStyle,
    String? hintText,
    TextEditingController? controller,
    TextStyle? textStyle,
    EdgeInsets? contentPadding,
    TextStyle? prefixStyle,
    String? prefixText}) {
  return TextFormField(
    inputFormatters: inputFormatter,
    textAlignVertical: TextAlignVertical.center,
    // textAlign: TextAlign.left,
    controller: controller,
    style: textStyle,
    decoration: InputDecoration(
      hintText: hintText ?? "",
      hintStyle: hintStyle ?? blackMontserrat10W500,
      prefixStyle: prefixStyle ?? blackMontserrat10W500,
      prefixText: prefixText,
      contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 16.0),
      border: InputBorder.none,
    ),
  );
}
