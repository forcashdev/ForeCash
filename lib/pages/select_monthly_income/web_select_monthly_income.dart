import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_dropdown.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_insert_table.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';
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

  List<int> datalist = [0, 1, 2];
  List incomeTextList = [];
  List amountTextList = [];
  List apiEveryList = ["15th", "16th", "17th", "18th"];
  List apiPaidList = ["1 Month", "2 Month", "3 Month", "4 Month"];

  List selectedPaid = [];
  List selectedEvery = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 750,
      constraints: BoxConstraints(minWidth: 500, maxWidth: 750),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      // margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Column(
        children: [
          SelectMonthlyIncomeText(),
          SizedBox(
            height: 50.0,
          ),

//  Table
          Container(
            constraints: BoxConstraints(minWidth: 500, maxWidth: 750),
            decoration: BoxDecoration(
              border: Border.all(
                width: .5,
                color: AppTheme.colorGrey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
              },
              // border: TableBorder.symmetric(
              //     outside: BorderSide(
              //         color: AppTheme.colorGrey.withOpacity(.5), width: 1)),
              children: [
                //Header
                TableRow(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: AppTheme.colorGrey, width: 0.5)),
                    ),
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 14),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CommonText('Income Name',
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.colorGrey)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonText('Paid On',
                            fontWeight: FontWeight.w500,
                            color: AppTheme.colorGrey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonText('Every',
                            fontWeight: FontWeight.w500,
                            color: AppTheme.colorGrey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonText('Income Name',
                            fontWeight: FontWeight.w500,
                            color: AppTheme.colorGrey),
                      ),
                    ]),

                //Rows
                ...datalist.map((item) {
                  incomeTextList.add(TextEditingController());
                  amountTextList.add(TextEditingController());
                  selectedPaid.add('1 Month');
                  selectedEvery.add('15th');
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
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
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: CommonTextField(
                                  text: item.toString(),
                                  radius: 5.0,
                                  controller: incomeTextList[item],
                                  inputType: TextInputType.emailAddress,
                                  isFill: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CommonDropDown(
                              height: 40.0,
                              width: MediaQuery.of(context).size.width,
                              errorText: '',
                              value: selectedEvery[item],
                              items: apiEveryList,
                              onChanged: (value) {
                                setState(() {
                                  selectedEvery[item] = value;
                                });
                                print('changed to $value');
                              })),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonDropDown(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width,
                            errorText: '',
                            value: selectedPaid[item],
                            items: apiPaidList,
                            onChanged: (value) {
                              setState(() {
                                selectedPaid[item] = value;
                              });
                              print('changed to $value');
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonTextField(
                          text: 'Email address',
                          controller: amountTextList[item],
                          inputType: TextInputType.emailAddress,
                          isFill: true,
                        ),
                      ),
                    ],
                  );
                }).toList()
              ],
            ),
          ),

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
