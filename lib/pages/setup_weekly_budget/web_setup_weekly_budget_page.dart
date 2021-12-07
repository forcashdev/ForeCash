import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_back_button.dart';
import 'package:for_cash/app/widgets/common_button.dart';
import 'package:for_cash/app/widgets/common_dropdown.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/pages/setup_weekly_budget/widgets/setup_weekly_budget_text.dart';

class WebSelectWeeklyBudgetPage extends StatefulWidget {
  const WebSelectWeeklyBudgetPage({Key key}) : super(key: key);

  @override
  _WebSelectWeeklyBudgetPageState createState() => _WebSelectWeeklyBudgetPageState();
}

class _WebSelectWeeklyBudgetPageState extends State<WebSelectWeeklyBudgetPage> {
  bool isCheckboxChecked = false;

  List<int> datalist = [0, 1, 2, 3];
  List expenseNameList = [
    "Grocery",
    "Gas",
    "Free Spend / Entertainment",
    "AMEX",
    "Auto Insurance",
    "Cell Phone",
    "Internet",
  ];
  List incomeTextList = [];
  List amountTextList = [];
  List apiEveryList = [
    "15th",
    "16th",
    "17th",
    "18th",
    "17th",
    "18th",
    "17th",
  ];
  List apiPaidList = [
    "1 Month",
    "2 Month",
    "3 Month",
    "4 Month",
    "3 Month",
    "4 Month",
    "3 Month",
  ];

  List selectedPaid = [];
  List selectedEvery = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 1600,
      constraints: BoxConstraints(minWidth: 500, maxWidth: 1600),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      // margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Column(
        children: [
          Container(
            width: 1600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonBackButton(
                  onBackTap: () {
                    stepIndexController.sink.add(3);
                  },
                ),
                SetupWeeklyBudgetText(),
                Container(
                  width: 150.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),

//  Table
          Container(
            constraints: BoxConstraints(minWidth: 500, maxWidth: 1600),
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
                      border: Border(bottom: BorderSide(color: AppTheme.colorGrey, width: 0.5)),
                    ),
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 14),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:
                                  CommonText('Expense Name', fontWeight: FontWeight.w500, color: AppTheme.colorGrey)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonText('Reset On', fontWeight: FontWeight.w500, color: AppTheme.colorGrey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonText('Every', fontWeight: FontWeight.w500, color: AppTheme.colorGrey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonText('Amount', fontWeight: FontWeight.w500, color: AppTheme.colorGrey),
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
                                image: isCheckboxChecked ? Constants.ic_checked : Constants.ic_unchecked,
                                height: 14.0,
                                width: 14.0,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                color: Colors.white,
                                child: CommonText(
                                  expenseNameList[item],
                                  color: AppTheme.colorGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
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
                              colorBackground: Colors.white,
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
                            colorBackground: Colors.white,
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
                        padding: EdgeInsets.all(10.0),
                        child: Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            // color: Colors.yellow,
                            child: CommonText(
                              "\$500",
                              color: AppTheme.colorGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList()
              ],
            ),
          ),

          nextButton()

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

  Widget nextButton() => Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        margin: EdgeInsets.only(left: 300, right: 300, top: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 45,
              child: CommonButton(
                buttonType: ButtonType.ElevatedButton,
                onPressed: () {
                  stepIndexController.sink.add(3);
                },
                color: AppTheme.colorAccent,
                elevation: 0,
                child: CommonText(
                  'Next',
                  color: AppTheme.colorWhite,
                  fontSize: 14.0,
                  maxline: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );
}
