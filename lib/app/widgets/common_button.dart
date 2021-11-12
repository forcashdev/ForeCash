import 'package:flutter/material.dart';

import 'common_text.dart';

enum ButtonType {
  TextButton,
  ElevatedButton,
  OutlinedButton,
}

// ignore: must_be_immutable
class CommonButton extends StatelessWidget {
  ButtonType buttonType;

  /// Use either `child` or `lable` property
  Widget child;
  Icon _icon;

  /// Use `icon` property for icon button
  final IconData icon;

  /// Use either `child` or `lable` property
  final String lable;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final Color shadowColor;
  final EdgeInsets padding;
  final FocusNode focusNode;
  final double elevation; //not for flat button

  /// For text size, weight.
  /// Use color property for text color
  final TextStyle textStyle;

  /// for button border of type BorderSide(color,width,style)
  final BorderSide border;

  /// it apply circular border type
  double borderRadius;

  /// if want to apply custome border shape, For circular border give only borderRadius property
  OutlinedBorder shape;

  ButtonStyle _buttonStyle;

  CommonButton({
    @required this.buttonType,
    @required this.onPressed,
    this.lable,
    this.child,
    this.icon,
    this.color,
    this.textColor,
    this.shadowColor,
    this.border,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.elevation,
    this.focusNode,
    this.shape,
    this.textStyle,
  });

  Widget myButton() {
    switch (this.buttonType) {
      case ButtonType.TextButton:
        this._buttonStyle = TextButton.styleFrom(
          backgroundColor: this.color,
          primary: this.textColor,
          elevation: this.elevation,
          padding: this.padding,
          shape: this.shape,
          side: this.border,
          shadowColor: this.shadowColor,
          textStyle: this.textStyle,
        );
        return textButton();
        break;

      case ButtonType.OutlinedButton:
        this._buttonStyle = OutlinedButton.styleFrom(
          backgroundColor: this.color,
          primary: this.textColor,
          elevation: this.elevation,
          padding: this.padding,
          shape: this.shape,
          side: this.border,
          shadowColor: this.shadowColor,
          textStyle: this.textStyle,
        );
        return outlinedButton();
        break;

      case ButtonType.ElevatedButton:
        this._buttonStyle = ElevatedButton.styleFrom(
          primary: this.color,
          onPrimary: this.textColor,
          elevation: this.elevation,
          padding: this.padding,
          shape: this.shape,
          side: this.border,
          shadowColor: this.shadowColor,
          textStyle: this.textStyle,
        );
        return elevatedButton();
        break;

      default:
        this._buttonStyle = TextButton.styleFrom(
          backgroundColor: this.color,
          primary: this.textColor,
          elevation: this.elevation,
          padding: this.padding,
          shape: this.shape,
          side: this.border,
          shadowColor: this.shadowColor,
          textStyle: this.textStyle,
        );
        return textButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.shape == null && this.borderRadius != 0.0) {
      this.shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.borderRadius));
    }

    if (this.lable != null) {
      this.child = CommonText(
        this.lable,
        color: Colors.white,
        maxline: 1,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      );
    }

    if (this.icon != null) {
      this._icon = Icon(
        this.icon,
      );
    }

    return myButton();
  }

  TextButton textButton() {
    if (this.icon != null) {
      return TextButton.icon(
        icon: this._icon,
        label: this.child,
        onPressed: this.onPressed,
        style: this._buttonStyle,
        focusNode: this.focusNode,
      );
    }
    return TextButton(
      child: this.child,
      onPressed: this.onPressed,
      style: this._buttonStyle,
      focusNode: this.focusNode,
    );
  }

  OutlinedButton outlinedButton() {
    if (this.icon != null) {
      return OutlinedButton.icon(
        icon: this._icon,
        label: this.child,
        onPressed: this.onPressed,
        style: this._buttonStyle,
        focusNode: this.focusNode,
      );
    }
    return OutlinedButton(
      child: this.child,
      onPressed: this.onPressed,
      style: this._buttonStyle,
      focusNode: this.focusNode,
    );
  }

  ElevatedButton elevatedButton() {
    if (this.icon != null) {
      return ElevatedButton.icon(
        icon: this._icon,
        label: this.child,
        onPressed: this.onPressed,
        style: this._buttonStyle,
        focusNode: this.focusNode,
      );
    }
    return ElevatedButton(
      child: this.child,
      onPressed: this.onPressed,
      style: this._buttonStyle,
      focusNode: this.focusNode,
    );
  }
}
