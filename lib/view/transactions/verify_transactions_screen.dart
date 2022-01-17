import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/getx/verifytransactions_controller.dart';
import 'package:fore_cash/model/verify_transaction_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class VerifyTransactionsScreen extends StatefulWidget {
  const VerifyTransactionsScreen({Key? key}) : super(key: key);

  @override
  _VerifyTransactionsScreenState createState() => _VerifyTransactionsScreenState();
}

class _VerifyTransactionsScreenState extends State<VerifyTransactionsScreen> {
  final visibilityController = Get.put(VerifyTransactionsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (kIsWeb) {
      print("object=====>WEbView");
      // running on the web!
    } else {
      print("object=====>Mobile");
      // NOT running on the web! You can check for additional platforms here.
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1000;
          return Scaffold(
            appBar: CommonMobileAppbar.commonMobileAppbar(
              color: Colors.white,
              title: const Text(
                'DashBoard',
                style: mobileAppBarStyle,
              ),
            ),
            backgroundColor: backGroundColor,
            body: Center(
              child: Container(
                decoration: constraints.maxWidth > 1000 ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)) : const BoxDecoration(),
                width: constraints.maxWidth > 1000 ? 900 : null,
                height: constraints.maxWidth > 1000 ? 800 : null,
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    getTitleText(),
                    const SizedBox(
                      height: 40.0,
                    ),
                    getTransactionsData(constraints),
                  ],
                ),
              ),
            ),
          );
       }
    );
  }

  getTitleText() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            verifyTransaction,
            style: mobileAppBarStyle,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            verifyTransactionDesc,
            style: greyMontserrat14w400,
          ),
        ],
      ),
    );
  }

  getTransactionsList(BoxConstraints constraints) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(4.0),
        itemCount: visibilityController.transactionsList.length,
        itemBuilder: (context, index) {
          return Theme(
            data: ThemeData(
              dividerColor: Colors.transparent
            ), child: ExpansionTile(
              iconColor: Colors.transparent,
              collapsedIconColor: Colors.transparent,
              title: Slidable(
              child: getTransactionsCard(visibilityController.transactionsList[index],constraints),
              actionPane: const SlidableDrawerActionPane(),
              actionExtentRatio: 0.65,
              secondaryActions: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0,bottom: 4.0 ,left: 10.0,right: 10.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          //GeneralController.to.currentPageNavigation.value = 2;
                        },
                        child: Container(
                            width: 50,
                            margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorsFFC700.withOpacity(0.1)),
                            child: Image.asset('assets/image/icons/ic_action_match.png')),
                      ),
                      InkWell(
                        onTap: () {
                          //GeneralController.to.currentPageNavigation.value = 2;
                        },
                        child: Container(
                            width: 50,
                            margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorsFFF4EB),
                            child: Image.asset('assets/image/icons/ic_action_skip.png')),
                      ),
                      InkWell(
                        onTap: () {
                          //GeneralController.to.currentPageNavigation.value = 2;
                        },
                        child: Container(
                            width: 50,
                            margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorsECF4FF.withOpacity(0.5)),
                            child: Image.asset('assets/image/icons/ic_action_move.png')),
                      ),
                    ],
                  ),
                ),
              ],
          ),
              children: [
                ListTile(
                  title: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Merchant Name",
                          style: greyMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Date Transaction",
                          style: greyMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "",
                          style: greyMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Amount",
                          style: greyMontserrat14w500,
                        ),
                      ),
                      constraints.maxWidth > 1000 ? const Expanded(
                        flex: 2,
                        child: Text(
                          "Action",
                          textAlign: TextAlign.center,
                          style: greyMontserrat14w500,
                        ),
                      ) : Container(
                        //height: Get.height * 0.044,
                        width: 8,
                        margin: const EdgeInsets.only(top:8.0,bottom: 8.0),
                        //margin: EdgeInsets.only(right: Get.width * 0.02),
                        //decoration: BoxDecoration(color: const Color(0xff097EA2), borderRadius: BorderRadius.circular(2)),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Slidable(
                    child: getTransactionsCard(visibilityController.transactionsList[index],constraints,colorsHeights: colors12CC8E),
                    actionPane: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "Merchant Name",
                            style: greyMontserrat14w500,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Date Transaction",
                            style: greyMontserrat14w500,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "",
                            style: greyMontserrat14w500,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Amount",
                            style: greyMontserrat14w500,
                          ),
                        ),
                        constraints.maxWidth > 1000 ? const Expanded(
                          flex: 2,
                          child: Text(
                            "Action",
                            textAlign: TextAlign.center,
                            style: greyMontserrat14w500,
                          ),
                        ) : Container(
                          //height: Get.height * 0.044,
                          width: 8,
                          margin: const EdgeInsets.only(top:8.0,bottom: 8.0),
                          //margin: EdgeInsets.only(right: Get.width * 0.02),
                          //decoration: BoxDecoration(color: const Color(0xff097EA2), borderRadius: BorderRadius.circular(2)),
                        ),
                      ],
                    ),
                    actionExtentRatio: 0.50,
                    secondaryActions: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0,bottom: 4.0 ,left: 10.0,right: 10.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                //GeneralController.to.currentPageNavigation.value = 2;
                              },
                              child: Container(
                                  width: 50,
                                  margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorsECF4FF.withOpacity(0.5)),
                                  child: Image.asset('assets/image/icons/ic_action_move.png')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          );
        });
  }

  getTransactionsCard(VerifyTransactionsModel data,BoxConstraints constraints,{Color? colorsHeights = const Color(0xff097EA2)}) {
    return Padding(
      padding: constraints.maxWidth > 1000 ? const EdgeInsets.only(left: 14.0,right: 8.0) : EdgeInsets.zero,
      child: SizedBox(
        height: constraints.maxWidth > 1000  ? 70 : 50,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                data.expenseName ?? "",
                style: blackMontserrat12w500,
              ),
            ),
            Expanded(
              child: Text(
                data.dueOn ?? "",
                style: blackMontserrat12w500,
              ),
            ),
            Expanded(
              child: Text(
                data.every ?? "",
                style: blackMontserrat12w500,
              ),
            ),
            Expanded(
              child: Text(
                data.amount ?? "",
                style: blackMontserrat12w500,
              ),
            ),
            constraints.maxWidth > 1000 ? Expanded(
              flex: 2,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      //GeneralController.to.currentPageNavigation.value = 2;
                    },
                    child: Container(
                        width: 50,
                        margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorsFFC700.withOpacity(0.1)),
                        child: Image.asset('assets/image/icons/ic_action_match.png')),
                  ),
                  InkWell(
                    onTap: () {
                      //GeneralController.to.currentPageNavigation.value = 2;
                    },
                    child: Container(
                        width: 50,
                        margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorsFFF4EB),
                        child: Image.asset('assets/image/icons/ic_action_skip.png')),
                  ),
                  InkWell(
                    onTap: () {
                      //GeneralController.to.currentPageNavigation.value = 2;
                    },
                    child: Container(
                        width: 50,
                        margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorsECF4FF.withOpacity(0.5)),
                        child: Image.asset('assets/image/icons/ic_action_move.png')),
                  ),
                ],
              ),
            ) : Container(
              //height: Get.height * 0.044,
              width: 8,
              margin: const EdgeInsets.only(top:8.0,bottom: 8.0),
              //margin: EdgeInsets.only(right: Get.width * 0.02),
              decoration: BoxDecoration(color: colorsHeights, borderRadius: BorderRadius.circular(2)),
            ),
          ],
        ),
      ),
    );
  }

  getTransactionsData(BoxConstraints constraints) {
    return Container(
      margin: constraints.maxWidth > 1000 ? const EdgeInsets.all(14.0) : EdgeInsets.zero,
      decoration: constraints.maxWidth > 1000 ? BoxDecoration(border: Border.all(color: commonTextColor2), borderRadius: BorderRadius.circular(10.0)) : const BoxDecoration(),
      child: Column(
        children: [
          Padding(
          padding: constraints.maxWidth > 1000 ? const EdgeInsets.all(20.0) : const EdgeInsets.only(left: 4.0,right: 4.0),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Text(
                  "Expense Name",
                  style: greyMontserrat14w500,
                ),
              ),
              const Expanded(
                child: Text(
                  "Due On",
                  style: greyMontserrat14w500,
                ),
              ),
              const Expanded(
                child: Text(
                  "Every",
                  style: greyMontserrat14w500,
                ),
              ),
              const Expanded(
                child: Text(
                  "Amount",
                  style: greyMontserrat14w500,
                ),
              ),
              constraints.maxWidth > 1000 ? const Expanded(
                flex: 2,
                child: Text(
                  "Action",
                  textAlign: TextAlign.center,
                  style: greyMontserrat14w500,
                ),
              ) : Container(
                //height: Get.height * 0.044,
                width: 8,
                margin: const EdgeInsets.only(top:8.0,bottom: 8.0),
                //margin: EdgeInsets.only(right: Get.width * 0.02),
                //decoration: BoxDecoration(color: const Color(0xff097EA2), borderRadius: BorderRadius.circular(2)),
              ),
            ],
          ),
        ),
          Divider(
            color: constraints.maxWidth > 1000 ? commonTextColor2 : Colors.transparent,
          ),
          constraints.maxWidth > 1000 ? getTransactionsListWeb(constraints) : getTransactionsList(constraints),
        ],
      ),
    );
  }

  getTransactionsListWeb(BoxConstraints constraints) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(4.0),
        itemCount: visibilityController.transactionsList.length,
        itemBuilder: (context, index) {
          return Theme(
            data: ThemeData(
                dividerColor: Colors.transparent
            ), child: ExpansionTile(
              iconColor: Colors.transparent,
              collapsedIconColor: Colors.transparent,
              title: getTransactionsCard(visibilityController.transactionsList[index],constraints),
              children: [
                ListTile(
                  title: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Merchant Name",
                          style: greyMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Date Transaction",
                          style: greyMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "",
                          style: greyMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Amount",
                          style: greyMontserrat14w500,
                        ),
                      ),
                      constraints.maxWidth > 1000 ? const Expanded(
                        flex: 2,
                        child: Text(
                          "Action",
                          textAlign: TextAlign.center,
                          style: greyMontserrat14w500,
                        ),
                      ) : Container(
                        //height: Get.height * 0.044,
                        width: 8,
                        margin: const EdgeInsets.only(top:8.0,bottom: 8.0),
                        //margin: EdgeInsets.only(right: Get.width * 0.02),
                        //decoration: BoxDecoration(color: const Color(0xff097EA2), borderRadius: BorderRadius.circular(2)),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Apple",
                          style: blackMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "10/10/202",
                          style: blackMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "",
                          style: blackMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "\$3000",
                          style: blackMontserrat14w500,
                        ),
                      ),
                      constraints.maxWidth > 1000 ? const Expanded(
                        flex: 2,
                        child: Text(
                          "",
                          textAlign: TextAlign.center,
                          style: greyMontserrat14w500,
                        ),
                      ) : Container(
                        //height: Get.height * 0.044,
                        width: 8,
                        margin: const EdgeInsets.only(top:8.0,bottom: 8.0),
                        //margin: EdgeInsets.only(right: Get.width * 0.02),
                        //decoration: BoxDecoration(color: const Color(0xff097EA2), borderRadius: BorderRadius.circular(2)),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Apple",
                          style: blackMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "10/10/202",
                          style: blackMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "",
                          style: blackMontserrat14w500,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "\$3000",
                          style: blackMontserrat14w500,
                        ),
                      ),
                      constraints.maxWidth > 1000 ? Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(color: colorsECF4FF, borderRadius: BorderRadius.circular(25.0)),
                          child: const Text(
                            "Match this transtion",
                            textAlign: TextAlign.center,
                            style: blackMontserrat13w500,
                          ),
                        ),
                      ) : Container(
                        //height: Get.height * 0.044,
                        width: 8,
                        margin: const EdgeInsets.only(top:8.0,bottom: 8.0),
                        //margin: EdgeInsets.only(right: Get.width * 0.02),
                        //decoration: BoxDecoration(color: const Color(0xff097EA2), borderRadius: BorderRadius.circular(2)),
                      ),
                    ],
                  ),
                ),
              ]
          ),
          );
        });
  }
}
