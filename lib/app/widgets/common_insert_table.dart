import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';

import 'common_dropdown.dart';
import 'common_text.dart';
import 'common_text_field.dart';
import 'common_vertical_container.dart';

class CommonInsertTable extends StatefulWidget {
  List<String> columnNameList = [];
  int totalRowLength = 8;
  List<String> paidOnList = [];
  List<String> everyList = [];
  String paidOnSelectedValue = '';
  String everySelectedValue = '';
  bool isShowColor;

  CommonInsertTable(
      {@required this.columnNameList,
      this.totalRowLength,
      this.isShowColor = true,
      @required this.everyList,
      @required this.paidOnList,
      @required this.everySelectedValue,
      @required this.paidOnSelectedValue});

  @override
  _CommonInsertTableState createState() => _CommonInsertTableState();
}

class _CommonInsertTableState extends State<CommonInsertTable> {
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
                        ? 3
                        : 5,
                child: CommonText(
                  widget.columnNameList[index].toString(),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  textAlign: TextAlign.center,
                ),
              )),
    );
  }

  buildTableRow() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.totalRowLength,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CommonVerticalContainer(
                containerColor: AppTheme.colorAccent,
              ),

              ///expense text field
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.fromLTRB(6, 10, 0, 6),
                  child: CommonTextField(
                    text: 'Apple Inc.',
                    // controller: expenseControllerList[index],
                    inputType: TextInputType.name,
                    isFill: true,
                  ),
                ),
              ),

              ///paid on
              Flexible(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 10, 0, 6),
                  child: CommonDropDown(
                    height: 50,
                    items: widget.paidOnList,
                    value: widget.paidOnSelectedValue,
                    onChanged: (item) {
                      setState(() {});
                    },
                  ),
                ),
              ),

              ///paid on
              Flexible(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 10, 0, 6),
                  child: CommonDropDown(
                    height: 50,
                    items: widget.everyList,
                    value: widget.paidOnSelectedValue,
                    onChanged: (item) {
                      setState(() {});
                    },
                  ),
                ),
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
                    text: '\$500',
                    inputType: TextInputType.name,
                    isFill: true,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
