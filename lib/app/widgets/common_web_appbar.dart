import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';

import 'common_image_asset.dart';
import 'common_text.dart';

class CommonWebAppBar extends StatelessWidget {
  CommonWebAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      // and it take 1/6 part of the screen
      child: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonImageAsset(
              image: Constants.ic_logo_primary,
              height: 45.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                notificationIcon(),
                SizedBox(
                  width: 10.0,
                ),
                profileWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool isOpen = false;

  Widget profileWidget() {
    List<String> choices = <String>[
      "Profile",
      "Chase Bank #2345",
      "Chime Bank #1568",
      "Add Account",
      "Setting",
      "Log out"
    ];
    List<String> iconList = <String>[
      Constants.ic_profile,
      Constants.ic_credit_card,
      Constants.ic_credit_card,
      Constants.ic_add_account,
      Constants.ic_setting,
      Constants.ic_logout,
    ];
    return Container(
        height: 50,
        width: 240,
        padding: EdgeInsets.fromLTRB(3.0, 3.0, 8.0, 3.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: AppTheme.colorGrey.withOpacity(0.2), width: 1),
            color: AppTheme.colorWhite),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                isOpen = !isOpen;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Flexible(
                      child: Container(
                        height: 42.0,
                        width: 42.0,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(Constants.img_profile),
                          radius: 50.0,
                        ),
                      ),
                    ),
                  ),
                  CommonText(
                    "John - #7048",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.colorGrey,
                  ),
                  Icon(
                    isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppTheme.colorBlack,
                  ),
                ],
              ),
            ),
            // Positioned(
            //   top: 0,
            //   bottom: 0,
            //   right: 0,
            //   child: Container(
            //     width: 30.0,
            //     child: PopupMenuButton<String>(
            //       icon: CommonImageAsset(
            //         image: Constants.ic_down_arrow,
            //         height: 10.0,
            //         width: 10.0,
            //       ),
            //       onSelected: choiceAction,
            //       itemBuilder: (BuildContext context) {
            //         int index = 0;
            //         return choices.map((String choice) {
            //           return PopupMenuItem<String>(
            //             value: choice,
            //             height: 30,
            //             padding: EdgeInsets.zero,
            //             child: Container(
            //               alignment: Alignment.center,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   Row(
            //                     children: [
            //                       CommonImageAsset(
            //                         image: iconList[index++],
            //                       ),
            //                       SizedBox(
            //                         width: 10.0,
            //                       ),
            //                       CommonText(
            //                         choice,
            //                         color: AppTheme.colorGrey,
            //                         fontSize: 12.0,
            //                         fontWeight: FontWeight.w500,
            //                       )
            //                     ],
            //                   ),
            //                   CommonDividerLine(
            //                     height: 1.0,
            //                     color: AppTheme.colorWhite,
            //                   )
            //                 ],
            //               ),
            //             ),
            //           );
            //         }).toList();
            //       },
            //     ),
            //   ),
            // )
          ],
        ));
  }

  Widget notificationIcon() {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 50.0,
            width: 50.0,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: AppTheme.colorWhite,
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: AppTheme.colorGrey.withOpacity(0.2), width: 1)),
            child: Stack(
              children: [
                Center(
                  child: CommonImageAsset(
                    image: Constants.ic_notification,
                    color: Colors.black,
                    height: 20.0,
                    width: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 47,
          height: 30,
          alignment: Alignment.topRight,
          child: Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.colorAccent,
            ),
            child: Center(
                child: CommonText(
              "1",
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )),
          ),
        ),
      ],
    );
  }
}
