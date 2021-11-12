import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class NotificationWidget extends StatelessWidget {
  bool isRead ;
  bool isSelected ;
  NotificationWidget({this.isRead = false, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppTheme.colorBackground : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          unreadDot(),
          SizedBox(
            width: 10,
          ),
          Expanded(child: notificationDetails()),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget unreadDot() => Visibility(
    visible: isRead,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.colorAccent,
          ),
          height: 10,
          width: 10,
        ),
      );

  Widget notificationDetails() => ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          notificationTitleTime(),
          SizedBox(
            height: 10,
          ),
          notificationSubTitleDelete()
        ],
      );

  Widget notificationTitleTime() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: CommonText(
              'Monthly Expense',
              color: AppTheme.colorBlack,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: CommonText(
              '10:20 AM',
              fontSize: 10,
              color: AppTheme.colorBlack,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );

  Widget notificationSubTitleDelete() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: CommonText(
              'We have updated your monthly expense',
              fontSize: 12,
              color: AppTheme.colorTextGrey,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                print('delete');
              },
              icon: CommonImageAsset(
                image: Constants.ic_delete,
                height: 26,
              ),
              padding: EdgeInsets.zero,
              alignment: Alignment.centerRight,
              constraints: BoxConstraints(
                maxHeight: 40,
                maxWidth: 30
              ),
            ),
          )
        ],
      );
}
