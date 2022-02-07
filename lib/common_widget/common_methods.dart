import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';

showCommonDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: LayoutBuilder(builder: (context, constraints) {
            final maxWidth = constraints.maxWidth > 1000;
            return Container(
              width: maxWidth ? 700 : null,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              padding: maxWidth ? const EdgeInsets.all(50.0) : const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(saveYourChanges, style: blackMontserrat16w700),
                  maxWidth ? const SizedBox(height: 20) : const SizedBox(height: 10),
                  const Text(description, style: grey2Montserrat14w500),
                  maxWidth ? const SizedBox(height: 55) : const SizedBox(height: 25),
                  Row(
                    children: [
                      Flexible(
                          child: CommonMaterialButton.commonButton(
                        height: maxWidth ? 65 : 50,
                        text: yes,
                        onPress: () {
                          // Get.to(SetupWeeklyBudgetScreen());
                        },
                      )),
                      const SizedBox(width: 30),
                      Flexible(
                          child: CommonMaterialButton.commonButton(
                        height: maxWidth ? 65 : 50,
                        text: no,
                        bgColor: Colors.white,
                        borderColor: commonTextColor,
                        textStyle: commonBackButtonTheme,
                        onPress: () {
                          // Get.to(SetupWeeklyBudgetScreen());
                        },
                      )),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      });
}

showPopupMenu(BuildContext context) {
  showMenu<String>(
    color: Colors.white,
    context: context,
    position: RelativeRect.fromLTRB(25.0, 0.0, 0.0, 0.0),
    //position where you want to show the menu on screen
    items: [
      PopupMenuItem<String>(
        child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_user.png', title: 'Profile'),
        value: '1',
        onTap: () {
          print("Profile====>");
        },
      ),
      PopupMenuDivider(height: 0.0),
      PopupMenuItem<String>(
          child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_credit_card.png', title: 'Chase Bank #2345'),
          value: '2',
          onTap: () {
            print("Profile====>");
          }),
      PopupMenuDivider(height: 0.0),
      PopupMenuItem<String>(
          child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_credit_card.png', title: 'Chime Bank #1568'),
          value: '3',
          onTap: () {
            print("Profile====>");
          }),
      PopupMenuDivider(height: 0.0),
      PopupMenuItem<String>(
          child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_user_plus.png', title: 'Add Account'),
          value: '4',
          onTap: () {
            print("Add Account====>");
          }),
      const PopupMenuDivider(height: 0.0),
      PopupMenuItem<String>(
          child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_setting.png', title: 'Setting'),
          value: '5',
          onTap: () {
            print("Setting====>");
          }),
      const PopupMenuDivider(height: 0.0),
      PopupMenuItem<String>(
          child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_logout.png', title: 'Logout'),
          value: '5',
          onTap: () {
            print("Setting====>");
          }),
      //PopupMenuItem<String>(child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_logout.png',title: 'Logout',colors: Colors.red,stlyes: whiteMontserrat14w500), value: '5',onTap: (){print("Setting====>");}),
    ],
    elevation: 8.0,
  );
}

getOptionItem({String? imagePath, String? title, colors = Colors.transparent, TextStyle? stlyes = blackMontserrat14w500}) {
  return Container(
    height: 40,
    width: double.infinity,
    color: colors,
    child: Row(
      children: [
        Image.asset(
          imagePath ?? "",
          scale: 3.5,
          color: commonTextColor,
        ),
        const SizedBox(width: 14),
        Text(title ?? "", style: stlyes)
      ],
    ),
  );
}
