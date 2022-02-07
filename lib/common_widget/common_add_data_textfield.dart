import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fore_cash/utility/const.dart';

class CommonDataTextField {
  static commonTextField(
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

  // static OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  //   borderSide: const BorderSide(
  //     color: commonTextFieldColor,
  //   ),
  //   borderRadius: BorderRadius.circular(7.0),
  // );
  //
  // static commonTextField(
  //     {String? fieldTitleText,
  //     TextEditingController? controller,
  //     TextStyle? textStyle,
  //     TextStyle? prefixStyle,
  //     String? prefixText,
  //     String? hintText,
  //     bool isPassword = false,
  //     TextEditingController? textEditingController,
  //     Function? validationFunction,
  //     Function? onSavedFunction,
  //     Function? onFieldSubmit,
  //     TextInputType? keyboardType,
  //     Function? onEditingComplete,
  //     Function? onTapFunction,
  //     Function? onChangedFunction,
  //     TextAlign align = TextAlign.start,
  //     TextInputAction? inputAction,
  //     List<TextInputFormatter>? inputFormatter,
  //     bool? isEnabled,
  //     int? errorMaxLines,
  //     int? maxLine,
  //     FocusNode? textFocusNode,
  //     GlobalKey<FormFieldState>? key,
  //     bool isReadOnly = false,
  //     Widget? suffixIcon,
  //     ExactAssetImage? preFixIcon,
  //     Color? filledColor = commonTextFieldColor,
  //     RxBool? showPassword,
  //     EdgeInsets? contentPadding,
  //     ScrollController? scrollController,
  //     TextStyle? hintStyle}) {
  //   bool passwordVisible = isPassword;
  //   return StatefulBuilder(builder: (context, newSetState) {
  //     return TextFormField(
  //       scrollController: scrollController,
  //       // for scroll extra while keyboard open
  //       // scrollPadding: EdgeInsets.fromLTRB(20, 20, 20, 120),
  //       enabled: isEnabled != null && !isEnabled ? false : true,
  //       textAlign: align,
  //       showCursor: !isReadOnly,
  //       onTap: () {
  //         if (onTapFunction != null) {
  //           onTapFunction();
  //         }
  //       },
  //       key: key,
  //       focusNode: textFocusNode,
  //       onChanged: (value) {
  //         if (onChangedFunction != null) {
  //           onChangedFunction(value);
  //         }
  //       },
  //       onEditingComplete: () {
  //         if (onEditingComplete != null) {
  //           onEditingComplete();
  //         }
  //       },
  //       validator: (value) {
  //         return validationFunction != null ? validationFunction(value) : null;
  //       },
  //       // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
  //       onSaved: (value) {
  //         // ignore: void_checks
  //         return onSavedFunction != null ? onSavedFunction(value) : null;
  //       },
  //       onFieldSubmitted: (value) {
  //         // ignore: void_checks
  //         return onFieldSubmit != null ? onFieldSubmit(value) : null;
  //       },
  //       maxLines: maxLine ?? 1,
  //       keyboardType: keyboardType,
  //       controller: textEditingController,
  //       // initialValue: initialText,
  //       cursorColor: colorPrimary,
  //       obscureText: passwordVisible,
  //       textInputAction: inputAction,
  //       style: blackMontserrat10W500,
  //       inputFormatters: inputFormatter,
  //       decoration: InputDecoration(
  //         errorMaxLines: errorMaxLines ?? 1,
  //         filled: true,
  //         fillColor: filledColor,
  //         contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
  //         focusedBorder: textFieldBorderStyle,
  //         disabledBorder: textFieldBorderStyle,
  //         enabledBorder: textFieldBorderStyle,
  //         errorBorder: textFieldBorderStyle,
  //         focusedErrorBorder: textFieldBorderStyle,
  //         hintText: hintText,
  //         prefixIcon: preFixIcon != null
  //             ? Image(
  //                 image: preFixIcon,
  //                 height: 15,
  //                 // color: color_8D8D8D,
  //               )
  //             : null,
  //         suffixIcon: isPassword
  //             ? InkWell(
  //                 onTap: () {
  //                   newSetState(() {
  //                     passwordVisible = !passwordVisible;
  //                   });
  //                 },
  //                 child: passwordVisible
  //                     ? const Icon(
  //                         Icons.visibility_off,
  //                         color: colorPrimary,
  //                       )
  //                     : const Icon(
  //                         Icons.visibility,
  //                         color: colorPrimary,
  //                       ))
  //             : suffixIcon ??
  //                 const SizedBox(
  //                   height: 0,
  //                   width: 0,
  //                 ),
  //         hintStyle: hintStyle ?? blackMontserrat10W500,
  //       ),
  //     );
  //   });
  // }
}
