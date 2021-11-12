import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/custom_calendar.dart';

class CommonCalendarDialog extends StatelessWidget {
  const CommonCalendarDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          EdgeInsets.only(top: 12, left: 10.0, bottom: 20, right: 10.0),
      insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 0.0,
      // To display the title it is optional
      content:
          Container(height: 330.0,padding: EdgeInsets.only(top: 10), child: CustomCalendar()),
      actions: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 42.0,
                  child: CommonButton(
                    buttonType: ButtonType.ElevatedButton,
                    borderRadius: 10.0,
                    padding: EdgeInsets.zero,
                    elevation: 0.0,
                    color: AppTheme.colorAccent,
                    onPressed: () {
                      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    },
                    child: CommonText(
                      "Save",
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 42.0,
                  child: CommonButton(
                    buttonType: ButtonType.ElevatedButton,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                    border: BorderSide(color: AppTheme.colorRed),
                    borderRadius: 10.0,
                    elevation: 0.0,
                    padding: EdgeInsets.zero,
                    child: CommonText(
                      "Cancel",
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: AppTheme.colorRed,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
