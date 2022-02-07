import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDropDown {
  static Widget commonDropDown({TextStyle? valueTextStyle, TextStyle? selectedItemTextStyle, Object? value, List<String>? itemList, Function? onChanged, String? hintText, TextStyle? hintTextStyle}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: hintText != null
            ? Text(
                hintText,
                style: hintTextStyle,
              )
            : null,
        value: value,
        style: valueTextStyle,
        items: itemList!.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              items,
              style: selectedItemTextStyle,
            ),
          );
        }).toList(),
        onChanged: (item) {
          onChanged!(item);
          // controller.changeItem(item: item);
        },
        isExpanded: true,
        icon: Icon(
          Icons.keyboard_arrow_down, color: Color(0xff777C90), size: 12.sp,
          // color: AppTheme.colorGrey,
        ),
      ),
    );
  }
}
