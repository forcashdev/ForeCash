import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_text.dart';

class DeleteConfirmationDialog extends StatefulWidget {
  const DeleteConfirmationDialog({Key key}) : super(key: key);

  @override
  _DeleteConfirmationDialogState createState() => _DeleteConfirmationDialogState();
}

class _DeleteConfirmationDialogState extends State<DeleteConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 12, left: 20.0, bottom: 20, right: 20.0),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 0.0,
      // To display the title it is optional
      title: CommonText(
        "Do you want to save your Changes ?",
        color: AppTheme.colorBlack,
        textAlign: TextAlign.center,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
      content: Padding(
        padding: EdgeInsets.only(top: 10),
        child: CommonText(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
          fontSize: 14.0,
          maxline: 2,
          textAlign: TextAlign.center,
          fontFamily: AppTheme.fontName,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.8,
              height: 42.0,
              child: CommonButton(
                buttonType: ButtonType.ElevatedButton,
                borderRadius: 10.0,
                padding: EdgeInsets.zero,
                elevation: 0.0,
                color: AppTheme.colorAccent,
                onPressed: () {},
                child: CommonText(
                  "Yes",
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.8,
              height: 42.0,
              child: CommonButton(
                buttonType: ButtonType.ElevatedButton,
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                border: BorderSide(color: AppTheme.colorPrimary, width: 1.17),
                borderRadius: 10.0,
                elevation: 0.0,
                padding: EdgeInsets.zero,
                child: CommonText(
                  "No",
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: AppTheme.colorBlack,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
