import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_methods.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/common_widget/common_web_appbar.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: constraints.maxWidth > 1000
            ? CommonWebAppbar.commonWebAppbar(scale: Get.mediaQuery.size.aspectRatio * 150, actions: [
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
                Container(
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
                      IconButton(
                          onPressed: () {
                            showPopupMenu(context);
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
              ])
            : CommonMobileAppbar.commonMobileAppbar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                color: Colors.white,
                title: Text(
                  notification,
                  style: mobileAppBarStyle,
                ),
              ),
        backgroundColor: backGroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Text(
                notifications,
                style: mobileAppBarStyle,
              ),
              Expanded(
                child: getNotificationList(constraints),
              ),
            ],
          ),
        ),
      );
    });
  }

  getNotificationList(BoxConstraints constraints) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(4.0),
        itemCount: 12,
        itemBuilder: (context, index) {
          return getNotificationCard(constraints);
        });
  }

  getNotificationCard(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            alignment: Alignment.center,
          ),
          Expanded(
            child: getTitleNDescription(),
          ),
          getAction(constraints),
        ],
      ),
      /* child: Column(
        children: [
           Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            alignment: Alignment.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text(
                "Monthly Expense",
                style: blackMontserrat14w600,
              ),
              Text(
                "10:20 AM",
                style: blackMontserrat10w400,
              ),

            ],
          ),
          const SizedBox(height: 8.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "We have updated your monthly expense",
                style: greyMontserrat12w500,
              ),
             Icon(Icons.delete,color: Colors.red,)


            ],
          ),
        ],
      ),*/
    );
  }

  getTitleNDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Monthly Expense",
          style: blackMontserrat14w600,
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          "We have updated your monthly expense",
          style: greyMontserrat12w500,
        ),
      ],
    );
  }

  getAction(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "10:20 AM",
          style: blackMontserrat10w400,
        ),
        const SizedBox(
          height: 6.0,
        ),
        constraints.maxWidth > 1000
            ? PopupMenuButton(
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                icon: const Icon(Icons.more_horiz_rounded),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "Delete",
                          style: greyMontserrat12w500,
                        ),
                      ],
                    ),
                    value: 1,
                  ),
                ],
              )
            : const Icon(
                Icons.delete,
                color: Colors.red,
              ),
      ],
    );
  }
}
