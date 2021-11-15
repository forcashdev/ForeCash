import 'package:editable/editable.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_insert_table.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/select_monthly_income/widgets/select_monthly_income_text.dart';

class WebSelectMonthlyIncomePage extends StatefulWidget {
  const WebSelectMonthlyIncomePage({Key key}) : super(key: key);

  @override
  _WebSelectMonthlyIncomePageState createState() =>
      _WebSelectMonthlyIncomePageState();
}

class _WebSelectMonthlyIncomePageState
    extends State<WebSelectMonthlyIncomePage> {
  bool isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Column(
        children: [
          SelectMonthlyIncomeText(),
          SizedBox(
            height: 50.0,
          ),

//  Table
          Container(
            height: 300,
            child: Table(
              border: TableBorder.symmetric(
                  outside: BorderSide(
                      color: AppTheme.colorGrey.withOpacity(.5), width: 1)),
              children: [
                TableRow(
                    children: [
                      Expanded(child: SizedBox.shrink()),
                      Expanded(child: SizedBox.shrink()),
                      Expanded(child: SizedBox.shrink()),
                      Expanded(child: SizedBox.shrink()),
                    ],
                    decoration: BoxDecoration(
                        color: AppTheme.colorGrey.withOpacity(.5))),
                TableRow(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                    children: [
                      Text('Income Name',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Paid On',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Every',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Amount',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                TableRow(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            isCheckboxChecked = !isCheckboxChecked;
                            setState(() {});
                          },
                          child: CommonImageAsset(
                            image: isCheckboxChecked
                                ? Constants.ic_checked
                                : Constants.ic_unchecked,
                            height: 14.0,
                            width: 14.0,
                          ),
                        ),
                        Text('Amount'),
                      ],
                    ),
                    TableCell(child: Text('Amount')),
                    Text('Amount'),
                    Text('Amount'),
                  ],
                ),
              ],
            ),
          )

          // Container(
          //   width: double.infinity,
          //   height: 200,
          //   decoration: BoxDecoration(
          //       border: Border.all(
          //           color: AppTheme.colorGrey.withOpacity(0.5), width: 1)),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           CommonText('Income Name', textAlign: TextAlign.start),
          //           CommonText('Paid On', textAlign: TextAlign.start),
          //           CommonText('Every', textAlign: TextAlign.start),
          //           CommonText('Amount', textAlign: TextAlign.start),
          //         ],
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(top: 10),
          //         height: 1,
          //         color: Colors.grey.withOpacity(.5),
          //       ),
          //       Row(
          //         children: [],
          //       )
          //     ],
          //   ),
          // )

          //--------------------------original code
          // Table(
          //   border: TableBorder.symmetric(
          //       outside: BorderSide(color: AppTheme.colorGrey, width: 1)),
          //   children: [
          //     TableRow(
          //         decoration: BoxDecoration(
          //           border: Border.all(width: 1.0, color: Colors.teal),
          //         ),
          //         children: [
          //           Row(
          //             children: [
          //               Container(
          //                 height: 48.0,
          //                 width: 38.0,
          //               ),
          //               Text("Winners"),
          //             ],
          //           ),
          //           Text("“Year”"),
          //           Text("“Country”"),
          //           Text("“Club Name”"),
          //         ]),
          //     TableRow(children: [
          //       Row(
          //         children: [
          //           Checkbox(
          //               value: true,
          //               onChanged: (val) {
          //                 return val;
          //               }),
          //           Text("“Ronaldo”"),
          //         ],
          //       ),
          //       Text("“1997”"),
          //       Text("“Brazil”"),
          //       Text("“Internazionale”"),
          //     ]),
          //     TableRow(children: [
          //       Row(
          //         children: [
          //           Checkbox(
          //               value: true,
          //               onChanged: (val) {
          //                 return val;
          //               }),
          //           Text("“Zinedine Zidane”"),
          //         ],
          //       ),
          //       Text("“1998”"),
          //       Text("“France”"),
          //       Text("“Juventus”"),
          //     ]),
          //     TableRow(children: [
          //       Text("“Rivaldo”"),
          //       Text("“1999”"),
          //       Text("“Brazil”"),
          //       Text("“Barcelona”"),
          //     ]),
          //     TableRow(children: [
          //       Text("“Luís Figo”"),
          //       Text("“2000”"),
          //       Text("“Portugal”"),
          //       Text("“Real Madrid”"),
          //     ]),
          //     TableRow(children: [
          //       Text("“Michael Owen”"),
          //       Text("“2001”"),
          //       Text("“England”"),
          //       Text("“Liverpool”"),
          //     ]),
          //     TableRow(children: [
          //       Text("“Ronaldo”"),
          //       Text("“2002”"),
          //       Text("“Brazil”"),
          //       Text("“Real Madrid”"),
          //     ]),
          //   ],
          // ),
        ],
      ),
    );
  }
}
