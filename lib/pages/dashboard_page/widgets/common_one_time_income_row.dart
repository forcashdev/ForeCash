import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/dialog/common_calendar_dialog.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_dropdown.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';

class CommonOneTimeIncomeRow extends StatefulWidget {
  List<String> columnNameList = [];
  int totalRowLength = 8;
  List<String> dueOnList = [];
  String dueOnSelectedValue = '';
  String everySelectedValue = '';
  bool isShowColor;

  CommonOneTimeIncomeRow(
      {@required this.columnNameList,
      this.totalRowLength,
      this.isShowColor = true,
      @required this.dueOnList,
      @required this.everySelectedValue,
      @required this.dueOnSelectedValue});

  @override
  _CommonOneTimeIncomeRowState createState() => _CommonOneTimeIncomeRowState();
}

class _CommonOneTimeIncomeRowState extends State<CommonOneTimeIncomeRow> {
  List<TextEditingController> expenseControllerList = [];
  List<TextEditingController> amountControllerList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        buildTableColumn(),
        buildTableRow(),
      ],
    );
  }

  buildTableColumn() {
    return Row(
      children: List.generate(
          widget.columnNameList.length,
          (index) => Expanded(
                flex: index == 0
                    ? 6
                    : (index == 1 || index == 2)
                        ? 4
                        : 5,
                child: Center(
                  child: CommonText(
                    widget.columnNameList[index].toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.colorGrey,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
    );
  }

  buildTableRow() {
    return Row(
      children: [
        ///expense text field
        Expanded(
          flex: 6,
          child: Container(
            padding: EdgeInsets.fromLTRB(6, 10, 0, 6),
            child: CommonTextField(
              text: "",
              // controller: expenseControllerList[index],
              inputType: TextInputType.name,
              isFill: true,
            ),
          ),
        ),

        ///due on
        Flexible(
          flex: 5,
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 10, 0, 6),
            child: CommonDropDown(
              height: 50,
              items: widget.dueOnList,
              value: widget.dueOnSelectedValue,
              onChanged: (item) {
                widget.dueOnSelectedValue = item;
                FocusScope.of(context).requestFocus(FocusNode());
                setState(() {});
              },
            ),
          ),
        ),

        ///Every
        Flexible(
          flex: 5,
          child: Container(
              padding: EdgeInsets.fromLTRB(8, 10, 0, 6),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CommonCalendarDialog(),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppTheme.colorBackground,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: CommonText(
                                "1 ,Jan",
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                maxline: 1,
                                color: AppTheme.colorBlack,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            CommonImageAsset(
                              image: Constants.ic_calendar,
                              height: 13.0,
                              width: 15.0,
                            ),
                          ])),
                ),
              )),
        ),

        /* ///every list
              Flexible(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 10, 0, 6),
                  child: CommonDropDown(
                    colorBackground: widget.isShowColor
                        ? AppTheme.colorBackground
                        : Colors.transparent,
                    height: 50,
                    items: widget.everyList,
                    value: widget.everySelectedValue,
                    onChanged: (item) {
                      setState(() {});
                    },
                  ),
                ),
              ),
*/

        ///amount
        Expanded(
          flex: 6,
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 10, 10, 6),
            child: CommonTextField(
              // controller: amountControllerList[index],
              text: '\$',
              inputType: TextInputType.name,
              isFill: true,
            ),
          ),
        ),
      ],
    );
  }
}
