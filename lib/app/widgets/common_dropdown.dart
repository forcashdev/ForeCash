import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class CommonDropDown extends StatelessWidget {
  final String value;
  final String hint;
  final String errorText;
  final List items;
  final Function onChanged;
  final double height, width;
  final colorBackground;

  const CommonDropDown(
      {Key key,
      @required this.value,
      this.hint,
      this.colorBackground = AppTheme.colorBackground,
      @required this.items,
      this.onChanged,
      this.errorText,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: colorBackground, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: DropdownButton(
          value: value,
          style: TextStyle(
              color: AppTheme.colorGrey, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName),
          hint: CommonText(
            hint ?? '',
            fontSize: 14.0,
            color: AppTheme.colorGrey,
            fontWeight: FontWeight.w500,
            maxline: 1,
            overflow: TextOverflow.ellipsis,
          ),
          items: items.map((value) {
            return DropdownMenuItem(
              value: value,
              child: CommonText(
                value.toString(),
                color: AppTheme.colorGrey,
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
            );
          }).toList(),
          onChanged: (item) {
            onChanged(item);
          },
          isExpanded: true,
          underline: Container(),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppTheme.colorGrey,
          ),
        ),
      ),
    );
  }
}
