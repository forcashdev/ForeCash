import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/utils/utils.dart';
import 'package:for_cash/app/widgets/common_text.dart';

import 'common_image_asset.dart';

class CommonDashboardAppbar extends StatefulWidget {
  final Function onTapNotification;

  CommonDashboardAppbar({Key key, this.onTapNotification}) : super(key: key);

  @override
  _CommonDashboardAppbarState createState() => _CommonDashboardAppbarState();
}

class _CommonDashboardAppbarState extends State<CommonDashboardAppbar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Container(
        padding: EdgeInsets.only(left: 15.0, right: 10.0, top: size.viewPadding.top + 20.0, bottom: 10.0),
        color: Colors.white,
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                "Dashboard",
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: AppTheme.colorBlack,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  notificationIcon(),
                  SizedBox(
                    width: 10.0,
                  ),
                  profileWidget(size),
                ],
              )
            ],
          ),
        ));
  }

  Widget notificationIcon() {
    return Stack(
      children: [
        InkWell(
          onTap: widget.onTapNotification,
          child: Container(
            height: 40.0,
            width: 40.0,
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
                    height: 16.0,
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
            margin: EdgeInsets.only(top: 5.0),
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

  void choiceAction(String choice) {
    String FirstItem = 'First Item';
    String SecondItem = 'Second Item';
    String ThirdItem = 'Third Item';

    if (choice == FirstItem) {
      print('I First Item');
    } else if (choice == SecondItem) {
      print('I Second Item');
    } else if (choice == ThirdItem) {
      print('I Third Item');
    }
  }

  bool isOpen = false;

  Widget profileWidget(size) {
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
        height: size.size.width * 0.11,
        width: size.size.width * 0.20,
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: AppTheme.colorGrey.withOpacity(0.2), width: 1),
            color: AppTheme.colorWhite),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                isOpen = !isOpen;
                setState(() {});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 34.0,
                      width: 34.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Constants.img_profile),
                        radius: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppTheme.colorGrey,
                  ),
                  PopupMenuButton<MenuItem>(
                    onSelected: (item) => onSelected(context, item),
                    itemBuilder: (context) => [
                      ...MenuItems.itemsFirst.map(buildItem).toList(),
                    ],
                  )
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

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
        child: Row(
          children: [
            Icon(
              item.icon,
              color: Colors.black,
              size: 20.0,
            ),
            SizedBox(
              width: 12.0,
            ),
            CommonText(item.text)
          ],
        ),
      );

  onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemSettings:
        showToast("setting");
        break;
      case MenuItems.itemShare:
        showToast("share");
        break;
      case MenuItems.itemLogout:
        showToast("logout");
        break;
    }
  }
}
