import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_vertical_container.dart';

class GetTableDataWidget extends StatefulWidget {
  List<String> expenseList = [];
  int totalRowLength = 8;
  List<String> paidOnList = [];
  List<String> everyList = [];
  String paidOnSelectedValue = '';
  String everySelectedValue = '';

  GetTableDataWidget(
      {@required this.expenseList,
      this.totalRowLength,
      @required this.everyList,
      @required this.paidOnList,
      @required this.everySelectedValue,
      @required this.paidOnSelectedValue});

  @override
  _GetTableDataWidgetState createState() => _GetTableDataWidgetState();
}

class _GetTableDataWidgetState extends State<GetTableDataWidget> {
  List<TextEditingController> expenseControllerList = [];
  List<TextEditingController> amountControllerList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        buildTableColumn(size),
        buildTableRow(size),
      ],
    );
  }

  buildTableColumn(Size size) {
    // return Row(
    //   children: List.generate(
    //       widget.columnNameList.length,
    //       (index) => Expanded(
    //             flex: index == 0
    //                 ? 6
    //                 : (index == 1 || index == 2)
    //                     ? 3
    //                     : 5,
    //             child: CommonText(
    //               widget.columnNameList[index].toString(),
    //               fontSize: 14,
    //               fontWeight: FontWeight.w500,
    //               color: AppTheme.colorGrey,
    //               textAlign: TextAlign.center,
    //             ),
    //           )),
    // );
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 5.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
                height: size.height * 0.06,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: CommonText(
                  "Expense Name",
                  fontSize: 14,
                  maxline: 2,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  textAlign: TextAlign.start,
                )),
          ),
          Expanded(
            flex: 4,
            child: Container(
                height: size.height * 0.06,
                alignment: Alignment.centerLeft,
                child: CommonText(
                  "Due on",
                  fontSize: 14,
                  maxline: 2,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 4,
            child: Container(
                height: size.height * 0.06,
                alignment: Alignment.centerLeft,
                child: CommonText(
                  "Category",
                  fontSize: 14,
                  maxline: 2,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 4,
            child: Container(
                height: size.height * 0.06,
                alignment: Alignment.centerLeft,
                child: CommonText(
                  "Amount",
                  fontSize: 14,
                  maxline: 2,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorGrey,
                  textAlign: TextAlign.center,
                )),
          ),
          Container(
            height: size.height * 0.06,
            width: 10.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }

  buildTableRow(Size size) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: 4,
      padding: EdgeInsets.only(right: 5.0),
      itemBuilder: (context, index) {
        return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.13,
            secondaryActions: <Widget>[
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: CommonImageAsset(
                    image: Constants.ic_accept,
                    height: 34.0,
                    width: 34.0,
                  )),
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: CommonImageAsset(
                    image: Constants.ic_skip,
                    height: 34.0,
                  )),
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: CommonImageAsset(
                    image: Constants.ic_week,
                    height: 34.0,
                    width: 34.0,
                  )),
            ],
            child: ConfigurableExpansionTile(
              header: Flexible(
                child: Container(
                  width: size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),

                      ///expense text field
                      Expanded(
                        flex: 6,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(5, 10, 0, 6),
                            alignment: Alignment.centerLeft,
                            child: CommonText(
                              "Rent",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.colorBlack,
                            )),
                      ),

                      ///due on
                      Flexible(
                        flex: 5,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(35, 10, 0, 6),
                            alignment: Alignment.centerLeft,
                            child: CommonText(
                              "${widget.paidOnList[index]}",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.colorBlack,
                            )),
                      ),

                      ///every list
                      Flexible(
                        flex: 5,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 0, 6),
                            alignment: Alignment.centerLeft,
                            child: CommonText(
                              "1 Mon",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.colorBlack,
                            )),
                      ),

                      ///amount
                      Expanded(
                        flex: 6,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 0, 6),
                            alignment: Alignment.centerLeft,
                            child: CommonText(
                              "\$2000",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.colorBlack,
                            )),
                      ),

                      Expanded(
                        child: Container(
                          height: 40.0,
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          child: CommonVerticalContainer(
                            containerColor: AppTheme.colorAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              children: [
                buildTableColumn(size),
              ],
            ));
      },
    );
    // return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: 6,
    //     padding: EdgeInsets.only(top: 15.0),
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (context, index) {
    //       return Slidable(
    //         actionPane: SlidableDrawerActionPane(),
    //         actionExtentRatio: 0.13,
    //         secondaryActions: <Widget>[
    //           Container(
    //               margin: EdgeInsets.all(5.0),
    //               child: CommonImageAsset(
    //                 image: Constants.ic_accept,
    //                 height: 34.0,
    //                 width: 34.0,
    //               )),
    //           Container(
    //               margin: EdgeInsets.all(5.0),
    //               child: CommonImageAsset(
    //                 image: Constants.ic_skip,
    //                 height: 34.0,
    //                 width: 34.0,
    //               )),
    //           Container(
    //               margin: EdgeInsets.all(5.0),
    //               child: CommonImageAsset(
    //                 image: Constants.ic_week,
    //                 height: 34.0,
    //                 width: 34.0,
    //               )),
    //         ],
    //         key: Key(index.toString()),
    //         child: Theme(
    //           data: ThemeData(dividerColor: Colors.transparent),
    //           child: ExpansionTile(
    //             trailing: Container(
    //               width: 0,
    //               color: Colors.yellow,
    //             ),
    //             title: Row(
    //               children: [
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //
    //                 ///expense text field
    //                 Expanded(
    //                   flex: 6,
    //                   child: Container(
    //                       padding: EdgeInsets.fromLTRB(5, 10, 0, 6),
    //                       alignment: Alignment.centerLeft,
    //                       child: CommonText(
    //                         "Rent",
    //                         fontSize: 12.0,
    //                         fontWeight: FontWeight.w700,
    //                         color: AppTheme.colorBlack,
    //                       )),
    //                 ),
    //
    //                 ///due on
    //                 Flexible(
    //                   flex: 5,
    //                   child: Container(
    //                       padding: EdgeInsets.fromLTRB(35, 10, 0, 6),
    //                       alignment: Alignment.centerLeft,
    //                       child: CommonText(
    //                         "${widget.paidOnList[index]}",
    //                         fontSize: 12.0,
    //                         fontWeight: FontWeight.w700,
    //                         color: AppTheme.colorBlack,
    //                       )),
    //                 ),
    //
    //                 ///every list
    //                 Flexible(
    //                   flex: 5,
    //                   child: Container(
    //                       padding: EdgeInsets.fromLTRB(30, 10, 0, 6),
    //                       alignment: Alignment.centerLeft,
    //                       child: CommonText(
    //                         "1 Mon",
    //                         fontSize: 12.0,
    //                         fontWeight: FontWeight.w700,
    //                         color: AppTheme.colorBlack,
    //                       )),
    //                 ),
    //
    //                 ///amount
    //                 Expanded(
    //                   flex: 6,
    //                   child: Container(
    //                       padding: EdgeInsets.fromLTRB(30, 10, 0, 6),
    //                       alignment: Alignment.centerLeft,
    //                       child: CommonText(
    //                         "\$2000",
    //                         fontSize: 12.0,
    //                         fontWeight: FontWeight.w700,
    //                         color: AppTheme.colorBlack,
    //                       )),
    //                 ),
    //
    //                 Expanded(
    //                   child: Container(
    //                     height: 40.0,
    //                     margin:
    //                         EdgeInsets.symmetric(vertical: 5.0),
    //                     child: CommonVerticalContainer(
    //                       containerColor: AppTheme.colorAccent,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             children: [buildTableColumn()],
    //           ),
    //         ),
    //       );
    //     });
  }
}
