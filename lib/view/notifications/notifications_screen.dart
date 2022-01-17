import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';

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
        appBar: CommonMobileAppbar.commonMobileAppbar(
          color: Colors.white,
          title: Text(
            'DashBoard',
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
