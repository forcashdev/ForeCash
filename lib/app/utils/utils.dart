import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_text.dart';

showToast(
  msg,
) {
  BotToast.showCustomText(
    duration: Duration(seconds: 3),
    toastBuilder: (cancelFunc) {
      return Padding(
        padding: EdgeInsets.all(12.0),
        child: Card(
          elevation: 15,
          color: AppTheme.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: CommonText(
                        "$msg",
                        fontWeight: FontWeight.w500,
                        fontFamily: AppTheme.fontName,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
