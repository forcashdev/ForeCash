import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/images.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/notifications/notifications_screen.dart';
import 'package:get/get.dart';

import 'common_methods.dart';

appBarWithUserNAme({BuildContext? context}) {
  return AppBar(
      elevation: 5,
      backgroundColor: Colors.white,
      leadingWidth: 180,
      leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            foreCashLogo2,
          )),
      // scale: Get.mediaQuery.size.aspectRatio * 150,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.01),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const NotificationsScreen());
                },
                child: Container(
                  height: 35,
                  width: 35,
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: appBarActionColor,
                  ),
                  child: Image.asset('assets/image/png/notificationIcon.png'),
                ),
              ),
              const Positioned(
                right: 3,
                top: 4,
                child: CircleAvatar(
                  backgroundColor: cameraBackGroundColor,
                  radius: 6,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: Get.width * 0.007,
        ),
        GestureDetector(
          onTap: () {
            showPopupMenu(context!);
          },
          child: Container(
            width: 160,
            margin: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01, right: Get.width * 0.015),
            padding: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(color: appBarActionColor, borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 17,
                  backgroundImage: AssetImage('assets/image/png/profilePhoto.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    userName,
                    style: userNameProfileStyle,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.008,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                )
              ],
            ),
          ),
        )
      ]);
}
