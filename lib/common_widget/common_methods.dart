import 'package:flutter/material.dart';
import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/common_widget/common_button.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/login_screen.dart';
import 'package:fore_cash/view/authentication/profile_update_screen_screen.dart';
import 'package:fore_cash/view/authentication/progress_indicator_screen.dart';
import 'package:fore_cash/view/authentication/update_calendar_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
                          child: commonButton(
                        height: maxWidth ? 65 : 50,
                        text: yes,
                        onPress: () {
                          // Get.to(SetupWeeklyBudgetScreen());
                        },
                      )),
                      const SizedBox(width: 30),
                      Flexible(
                          child: commonButton(
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
        child: getOptionItem(
            imagePath: 'assets/image/icons/ic_menu_user.png',
            title: 'Profile',
            onTap: () {
              Get.to(() => const ProfileUpdateScreen());
            }),
        value: '1',
      ),
      PopupMenuDivider(height: 0.0),
      PopupMenuItem<String>(
          child: getOptionItem(
            imagePath: 'assets/image/icons/ic_menu_credit_card.png',
            title: 'Chase Bank #2345',
          ),
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
          child: getOptionItem(
              imagePath: 'assets/image/icons/ic_menu_user_plus.png',
              title: 'Add Account',
              onTap: () {
                Get.to(() => const LoginScreen());
              }),
          value: '4',
          onTap: () {
            print("Add Account====>");
          }),
      const PopupMenuDivider(height: 0.0),
      PopupMenuItem<String>(
          child: getOptionItem(
              imagePath: 'assets/image/icons/ic_menu_setting.png',
              title: 'Setting',
              onTap: () {
                Get.to(() => const UpdateCalendarScreen());
              }),
          value: '5',
          onTap: () {
            print("Setting====>");
          }),
      const PopupMenuDivider(height: 0.0),
      PopupMenuItem<String>(
        child: getOptionItem(
            imagePath: 'assets/image/icons/ic_menu_logout.png',
            title: 'Logout',
            onTap: () {
              print('>>>>>>>>>>>');
              final screenIndexController = Get.put(ScreenIndexController());
              // screenIndexController.updateIndex(index: 1);
              final box = GetStorage();
              final finalUserEmail = box.remove('userEmail');
              storage.write("loginToken", '');
              screenIndexController.updateIndex(index: 0);
              Get.to(() => const ScreenProgressIndicator());
            }),
        value: '5',
      ),
      //PopupMenuItem<String>(child: getOptionItem(imagePath: 'assets/image/icons/ic_menu_logout.png',title: 'Logout',colors: Colors.red,stlyes: whiteMontserrat14w500), value: '5',onTap: (){print("Setting====>");}),
    ],
    elevation: 8.0,
  );
}

deleteImageWidget({Function? onTap}) {
  return InkWell(
    onTap: () {
      onTap!();
    },
    child: Container(
        decoration: BoxDecoration(color: colorsFFEBEB, borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(horizontal: 7.0),
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          deleteImage,
          height: Get.height * 0.025,
          // width: 30.0,
        )),
  );
}

getOptionItem({Function? onTap, String? imagePath, String? title, colors = Colors.transparent, TextStyle? stlyes = blackMontserrat14w500}) {
  return GestureDetector(
    onTap: () {
      onTap!();
    },
    child: Container(
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
    ),
  );
}
