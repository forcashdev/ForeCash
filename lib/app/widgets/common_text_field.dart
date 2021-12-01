import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_cash/app/theme/app_theme.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  String text, hintText;
  Color filedColor;
  Widget prefixIcon;
  Widget suffixIcon;
  bool obscureText;
  Function prefixFunction;
  Function suffixFunction;
  Function onTap;
  bool isEnabled;
  bool isFill = false;
  int maxLine;
  FocusNode focusNode;
  int inputLength;
  Function(String) onFieldSubmitted,onChanged;
  Function validation;
  TextInputAction textInputAction;

  CommonTextField({
    @required this.text,
    @required this.inputType,
    this.controller,
    this.hintText,
    this.filedColor,
    this.prefixIcon,
    this.isFill,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixFunction,
    this.suffixFunction,
    this.onTap,
    this.isEnabled,
    this.maxLine,
    this.focusNode,
    this.inputLength,
    this.onFieldSubmitted,
    this.validation,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppTheme.colorBackground),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        onChanged: onChanged  ,
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        obscuringCharacter: '*',
        validator: validation,
        onFieldSubmitted: onFieldSubmitted,
        enabled: isEnabled,
        maxLines: maxLine != null ? maxLine : 1,
        focusNode: focusNode,
        textAlign: TextAlign.start,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(
              r'(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])')),
          LengthLimitingTextInputFormatter(inputLength), // for mobile
        ],
        cursorColor: AppTheme.colorPrimary,
        decoration: InputDecoration(
            hintText: hintText ?? '',
            labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: kIsWeb ? 12.0 : 10.0,
                fontWeight: FontWeight.w400,
                fontFamily: AppTheme.fontName),
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: kIsWeb ? 14.0 : 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: AppTheme.fontName),
            contentPadding: EdgeInsets.only(left: 15, bottom: 15),
            prefixIcon: prefixIcon != null
                ? IconButton(
                    onPressed: () {
                      prefixFunction();
                    },
                    icon: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: () {
                      suffixFunction();
                    },
                    icon: suffixIcon,
                  )
                : null),
      ),
    );
  }
}
