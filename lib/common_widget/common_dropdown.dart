import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:get/get.dart';

Widget commonDropDown({Object? value, List<String>? itemList, SelectedDropDownItem? controller}) {
  final controller = Get.put(SelectedDropDownItem());
  return DropdownButton(
    value: value,
    style: const TextStyle(
      fontSize: 13,
    ),
    items: itemList!.map((String items) {
      return DropdownMenuItem(
        value: items,
        child: Text(
          items,
          style: const TextStyle(color: Color(0xff777C90), fontFamily: AppTheme.fontName, fontWeight: FontWeight.w400),
        ),
      );
    }).toList(),
    onChanged: (item) {
      controller;
      // controller.changeItem(item: item);
    },
    isExpanded: true,
    underline: Container(),
    icon: const Icon(
      Icons.keyboard_arrow_down,
      // color: AppTheme.colorGrey,
    ),
  );
}
