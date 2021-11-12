import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_name_app_bar.dart';
import 'package:for_cash/app/widgets/common_text.dart';

import 'notification_view_model.dart';
import 'widgets/notification_widget.dart';

class MobileNotificationPage extends StatefulWidget {
  @override
  MobileNotificationPageState createState() => MobileNotificationPageState();
}

class MobileNotificationPageState extends State<MobileNotificationPage> {
  NotificationModel model;
  ScrollController scrollController = new ScrollController();
  bool showViewAll = true;

  @override
  Widget build(BuildContext context) {
    model ?? (model = NotificationModel(this));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonNameAppBar(context, 'Notification'),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            notificationList(),
            SizedBox(
              height: 10,
            ),
            viewAllText(),
          ],
        ),
      ),
    );
  }

  Widget notificationList() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            primary: true,
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {},
                  child: NotificationWidget(
                    isRead: index == 0 ? true : false,
                  ));
            }),
      );

  Widget viewAllText() => Center(
          child: Visibility(
        visible: showViewAll,
        child: CommonText(
          'View All',
          color: AppTheme.colorBlack,
          fontSize: 14,
          decoration: TextDecoration.underline,
        ),
      ));
}
