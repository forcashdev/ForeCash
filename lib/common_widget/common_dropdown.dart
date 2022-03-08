import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget commonDropDown(
    {TextStyle? valueTextStyle,
    TextStyle? selectedItemTextStyle,
    Object? value,
    List<String>? itemList,
    dynamic itemListMap,
    List<double>? itemListDouble,
    Function? onChanged,
    String? hintText,
    TextStyle? hintTextStyle}) {
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
      items: itemList != null
          ? itemList.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: selectedItemTextStyle,
                ),
              );
            }).toList()
          : itemListMap!.map((items) {
              return DropdownMenuItem(
                value: items.toString(),
                child: Text(
                  items.toString(),
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
        Icons.keyboard_arrow_down, color: Color(0xff777C90), size: 15.sp,
        // color: AppTheme.colorGrey,
      ),
    ),
  );
}
