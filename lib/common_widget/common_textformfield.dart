import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:get/get.dart';

OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: const BorderSide(color: commonTextFieldColor),
  borderRadius: BorderRadius.circular(4.0),
);

commonTextFormField(
    {String? fieldTitleText,
    TextStyle? textStyle,
    TextStyle? prefixstyle,
    String? prefixText,
    String? hintText,
    InputBorder? focusedBorder,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    bool isPassword = false,
    TextEditingController? textEditingController,
    Function? validationFunction,
    Function? onSavedFunction,
    Function? onFieldSubmit,
    TextInputType? keyboardType,
    Function? onEditingComplete,
    Function? onTapFunction,
    Function? onChangedFunction,
    TextAlign align = TextAlign.start,
    TextInputAction? inputAction,
    List<TextInputFormatter>? inputFormatter,
    bool? isEnabled,
    int? errorMaxLines,
    int? maxLine,
    FocusNode? textFocusNode,
    GlobalKey<FormFieldState>? key,
    bool isReadOnly = false,
    Widget? suffixIcon,
    Widget? preFixIcon,
    Color? filledColor = commonTextFieldColor,
    RxBool? showPassword,
    EdgeInsets? contentPadding,
    ScrollController? scrollController,
    TextStyle? hintStyle,
    String? intialValue}) {
  bool passwordVisible = isPassword;
  return StatefulBuilder(builder: (context, newSetState) {
    return TextFormField(
      // scrollController: scrollController,
      // for scroll extra while keyboard open
      // scrollPadding: EdgeInsets.fromLTRB(20, 20, 20, 120),
      // enabled: isEnabled != null && !isEnabled ? false : true,
      //enabled: true,
      textAlign: align,
      // showCursor: !isReadOnly,
      onTap: () {
        if (onTapFunction != null) {
          onTapFunction();
        }
      },
      key: key,
      focusNode: textFocusNode,
      onChanged: (value) {
        if (onChangedFunction != null) {
          onChangedFunction(value);
        }
      },
      onEditingComplete: () {
        if (onEditingComplete != null) {
          onEditingComplete();
        }
      },
      validator: (value) {
        return validationFunction != null ? validationFunction(value) : null;
      },
      // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
      onSaved: (value) {
        // ignore: void_checks
        return onSavedFunction != null ? onSavedFunction(value) : null;
      },
      onFieldSubmitted: (value) {
        // ignore: void_checks
        return onFieldSubmit != null ? onFieldSubmit(value) : null;
      },
      // maxLines: maxLine ?? 1,
      keyboardType: keyboardType,
      controller: textEditingController,
      // initialValue: initialText,
      // cursorColor: colorPrimary,
      obscureText: passwordVisible,
      textInputAction: inputAction ?? TextInputAction.next,
      style: textStyle ?? blackMontserrat10W500,
      inputFormatters: inputFormatter,
      //expands: true,
      decoration: InputDecoration(
        hoverColor: Colors.transparent,
        prefixStyle: prefixstyle ?? incomeNameStyle,
        prefixText: prefixText ?? null,
        errorMaxLines: errorMaxLines ?? 1,
        filled: true,
        fillColor: filledColor,
        // isDense: true,
        contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        focusedBorder: focusedBorder ?? textFieldBorderStyle,
        disabledBorder: disabledBorder ?? textFieldBorderStyle,
        enabledBorder: enabledBorder ?? textFieldBorderStyle,
        errorBorder: errorBorder ?? textFieldBorderStyle,
        focusedErrorBorder: focusedErrorBorder ?? textFieldBorderStyle,
        hintText: hintText ?? '',
        prefixIcon: preFixIcon != null ? preFixIcon : null,
        suffixIcon: isPassword
            ? InkWell(
                onTap: () {
                  newSetState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: passwordVisible
                    ? const Icon(
                        Icons.visibility_off,
                        color: commonTextColor2,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: commonTextColor2,
                      ))
            : suffixIcon ?? null,
        hintStyle: hintStyle ?? blackMontserrat10W500,
      ),
    );
  });
}
